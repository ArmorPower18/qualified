import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@/lib/supabase/server";
import { getStaticCollege } from "@/lib/colleges-static";
import type { QuestionAttempt, StudyPlanWeek } from "@/lib/types";

const RELIABILITY_CONSTANT = 5;

export async function POST(request: NextRequest) {
  try {
    const supabase = await createClient();
    const { data: userData, error: userError } = await supabase.auth.getUser();
    if (userError || !userData.user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }
    const user = userData.user;

    const body = await request.json().catch(() => null);
    const collegeSlug: string | undefined = body?.collegeSlug;
    if (!collegeSlug) {
      return NextResponse.json({ error: "Missing collegeSlug" }, { status: 400 });
    }

    const staticCollege = getStaticCollege(collegeSlug);
    if (!staticCollege) {
      return NextResponse.json({ error: "Unknown college" }, { status: 400 });
    }

    const { data: college } = await supabase.from("colleges").select("id").eq("slug", collegeSlug).single();
    if (!college) {
      return NextResponse.json({ error: "College not found" }, { status: 404 });
    }

    // Require a completed pre-test for this exam before generating a plan —
    // there's nothing to analyze yet otherwise.
    const { count: attemptCount } = await supabase
      .from("mock_test_attempts")
      .select("id", { count: "exact", head: true })
      .eq("user_id", user.id)
      .eq("college_id", college.id)
      .not("completed_at", "is", null);
    if (!attemptCount) {
      return NextResponse.json(
        { error: "Take your pre-test for this exam before generating a study plan." },
        { status: 400 }
      );
    }

    // Subject mastery, confidence-adjusted the same way as the dashboard so the
    // plan and the dashboard agree on what's actually weak.
    const { data: questionAttempts } = await supabase
      .from("question_attempts")
      .select("*")
      .eq("user_id", user.id);
    const typedAttempts = (questionAttempts as QuestionAttempt[]) ?? [];
    const bySubject = new Map<string, { correct: number; total: number }>();
    for (const a of typedAttempts) {
      const bucket = bySubject.get(a.subject_label) ?? { correct: 0, total: 0 };
      bucket.total += 1;
      if (a.is_correct) bucket.correct += 1;
      bySubject.set(a.subject_label, bucket);
    }
    const subjectMastery = Array.from(bySubject.entries())
      .map(([subject, { correct, total }]) => {
        const rawPct = Math.round((correct / total) * 100);
        const confidence = total / (total + RELIABILITY_CONSTANT);
        return { subject, correct, total, pct: Math.round(rawPct * confidence) };
      })
      .sort((a, b) => a.pct - b.pct);

    const { data: profile } = await supabase.from("profiles").select("test_date").eq("id", user.id).maybeSingle();
    const testDate = profile?.test_date ? new Date(`${profile.test_date}T00:00:00`) : null;
    const daysRemaining = testDate
      ? Math.max(0, Math.ceil((testDate.getTime() - Date.now()) / (1000 * 60 * 60 * 24)))
      : null;
    const weekCount = Math.min(6, Math.max(2, daysRemaining ? Math.round(daysRemaining / 7) : 4));

    if (!process.env.GEMINI_API_KEY) {
      return NextResponse.json(
        { error: "AI processing is not configured. Please add GEMINI_API_KEY to .env.local" },
        { status: 500 }
      );
    }

    const masterySummary = subjectMastery.length
      ? subjectMastery.map((s) => `- ${s.subject}: ${s.pct}% mastery (${s.correct}/${s.total} correct)`).join("\n")
      : "- No graded practice/review attempts yet — treat every section as unproven.";

    const message = `You are building a personalized study plan for a student preparing for the ${staticCollege.examName} (${staticCollege.name}).

Exam sections: ${staticCollege.subjects.map((s) => s.name).join(", ")}.
${daysRemaining !== null ? `Days remaining until test date: ${daysRemaining}.` : `No test date set — assume a general ${weekCount}-week runway.`}

Subject mastery so far (confidence-adjusted accuracy — lower means weaker or less-practiced):
${masterySummary}

Build a ${weekCount}-week study plan that prioritizes the weakest subjects early, gradually shifts toward balanced review, and ends with timed practice close to the exam. Each week should have 3-5 days with 1-2 short activities each (15-40 minutes), referencing only the exam sections listed above by name. Return ONLY valid JSON, no markdown fences, in this exact structure:
{
  "summary": "1-2 sentence overview of the plan's strategy",
  "weeks": [
    {
      "label": "Week 1",
      "focus": "short phrase describing this week's theme",
      "days": [
        {
          "day": "Mon",
          "activities": [
            { "kind": "practice" | "review" | "mock", "subject": "exact section name", "minutes": 30, "title": "short title", "description": "one sentence on what to do and why" }
          ]
        }
      ]
    }
  ]
}`;

    const model = process.env.GEMINI_MODEL || "gemini-2.5-flash";
    const geminiResponse = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent`,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "x-goog-api-key": process.env.GEMINI_API_KEY,
        },
        body: JSON.stringify({
          contents: [{ parts: [{ text: message }] }],
          generationConfig: { responseMimeType: "application/json" },
        }),
      }
    );

    if (!geminiResponse.ok) {
      const errorText = await geminiResponse.text();
      console.error("Gemini API error:", errorText);
      return NextResponse.json({ error: "Failed to generate a study plan with the AI agent" }, { status: 500 });
    }

    const geminiResult = await geminiResponse.json();
    const text: string | undefined = geminiResult?.candidates?.[0]?.content?.parts?.[0]?.text;
    if (!text) {
      console.error("Unexpected Gemini response shape:", geminiResult);
      return NextResponse.json({ error: "AI agent returned an unexpected format" }, { status: 500 });
    }

    let parsed: { summary?: string; weeks?: StudyPlanWeek[] };
    try {
      parsed = JSON.parse(text);
    } catch (e) {
      console.error("Failed to parse study plan JSON:", e, text);
      return NextResponse.json({ error: "AI agent returned an unexpected format" }, { status: 500 });
    }

    if (!Array.isArray(parsed.weeks) || parsed.weeks.length === 0) {
      return NextResponse.json({ error: "AI agent returned an incomplete plan" }, { status: 500 });
    }

    const { data: saved, error: saveError } = await supabase
      .from("study_plans")
      .upsert(
        {
          user_id: user.id,
          college_id: college.id,
          summary: parsed.summary ?? null,
          weeks: parsed.weeks,
          generated_at: new Date().toISOString(),
        },
        { onConflict: "user_id,college_id" }
      )
      .select()
      .single();

    if (saveError || !saved) {
      console.error("Failed to save study plan:", saveError);
      return NextResponse.json(
        { error: `Failed to save the generated study plan: ${saveError?.message ?? "unknown error"}` },
        { status: 500 }
      );
    }

    return NextResponse.json({ success: true, plan: saved });
  } catch (error) {
    console.error("Error generating study plan:", error);
    return NextResponse.json(
      { error: error instanceof Error ? error.message : "Failed to generate study plan" },
      { status: 500 }
    );
  }
}
