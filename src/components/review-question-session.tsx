"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { CheckCircle2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { createClient } from "@/lib/supabase/client";
import { QuestionCard } from "@/components/question-card";
import type { ReviewQuestion, Difficulty, ReviewMode, Question, QuestionAttemptSource } from "@/lib/types";

const modeToAttemptSource: Record<"general" | "exam_focus", QuestionAttemptSource> = {
  general: "general_review",
  exam_focus: "exam_focus_review",
};

export function ReviewQuestionSession({
  questions,
  lessonIds,
  lessonSubjectNames,
  difficulty,
  mode,
  collegeId,
  backHref,
}: {
  questions: ReviewQuestion[];
  lessonIds: string[];
  lessonSubjectNames: Record<string, string>;
  difficulty: Difficulty | null;
  mode: ReviewMode;
  collegeId: string | null;
  backHref: string;
}) {
  const router = useRouter();
  const supabase = createClient();
  const [saved, setSaved] = useState(false);
  const [saving, setSaving] = useState(false);
  const [sessionStart] = useState(() => Date.now());

  // QuestionCard expects the shared `Question` shape — review questions carry the
  // same fields, just keyed to a lesson instead of a CET subject.
  const asQuestions: Question[] = useMemo(
    () =>
      questions.map((q) => ({
        id: q.id,
        subject_id: q.lesson_id,
        topic: "",
        prompt: q.prompt,
        choices: q.choices,
        correct_answer: q.correct_answer,
        explanation: q.explanation,
        difficulty: q.difficulty,
        source: null,
        is_ai_generated: q.is_ai_generated,
      })),
    [questions]
  );

  async function handleFinish() {
    setSaving(true);
    const { data: userData } = await supabase.auth.getUser();
    if (!userData.user) {
      setSaving(false);
      return;
    }
    const durationSeconds = Math.round((Date.now() - sessionStart) / 1000);
    await supabase.from("review_attempts").insert({
      user_id: userData.user.id,
      mode,
      college_id: collegeId,
      lesson_ids: lessonIds,
      difficulty,
      question_count: questions.length,
      total_questions: questions.length,
      duration_seconds: durationSeconds,
      completed_at: new Date().toISOString(),
    });
    setSaving(false);
    setSaved(true);
  }

  const attemptSource = mode === "flashcard" ? undefined : modeToAttemptSource[mode];

  return (
    <div className="flex flex-col gap-6">
      {asQuestions.map((q, i) => (
        <QuestionCard
          key={q.id}
          question={q}
          index={i}
          subjectLabel={lessonSubjectNames[questions[i].lesson_id] ?? "General"}
          attemptSource={attemptSource}
          collegeId={collegeId}
        />
      ))}

      <Card className="studio-card">
        <CardContent className="flex flex-col items-center gap-3 py-8 text-center">
          {saved ? (
            <>
              <CheckCircle2 className="h-8 w-8 text-primary" />
              <p className="font-medium">Saved to your mastery dashboard.</p>
              <Button onClick={() => router.push("/dashboard")}>View dashboard</Button>
            </>
          ) : (
            <>
              <p className="text-sm text-muted-foreground">
                Answer the questions above, then mark this session complete to track it.
              </p>
              <div className="flex gap-3">
                <Button variant="outline" onClick={() => router.push(backHref)}>
                  New selection
                </Button>
                <Button onClick={handleFinish} disabled={saving}>
                  {saving ? "Saving..." : "Mark session complete"}
                </Button>
              </div>
            </>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
