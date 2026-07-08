"use client";

import { useEffect, useMemo, useState, useCallback } from "react";
import { useRouter } from "next/navigation";
import { AlertTriangle, CheckCircle2, Clock } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import { GenerateStudyPlanButton } from "@/components/generate-study-plan-button";
import { cn } from "@/lib/utils";
import { createClient } from "@/lib/supabase/client";
import type { MockTestConfig } from "@/lib/data";

type Phase = "intro" | "running" | "results";

function formatTime(totalSeconds: number) {
  const m = Math.floor(totalSeconds / 60)
    .toString()
    .padStart(2, "0");
  const s = Math.floor(totalSeconds % 60)
    .toString()
    .padStart(2, "0");
  return `${m}:${s}`;
}

export function MockTestRunner({
  config,
  collegeSlug,
  isPretest = false,
}: {
  config: MockTestConfig;
  collegeSlug: string;
  // True when this is the student's first attempt for this college — a free
  // diagnostic that doesn't count against their plan's mock test quota (see /pricing).
  isPretest?: boolean;
}) {
  const router = useRouter();
  const supabase = createClient();
  const [phase, setPhase] = useState<Phase>("intro");
  const [sectionIndex, setSectionIndex] = useState(0);
  const [secondsLeft, setSecondsLeft] = useState((config.sections[0]?.minutes ?? 0) * 60);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [saved, setSaved] = useState(false);
  const [saveError, setSaveError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  const section = config.sections[sectionIndex];
  const isLastSection = sectionIndex === config.sections.length - 1;

  const allQuestions = useMemo(() => config.sections.flatMap((s) => s.questions), [config.sections]);

  // Per-section breakdown for the results screen — computed straight from what's
  // already loaded, so it shows up even if the save to Supabase below fails.
  const sectionBreakdown = useMemo(
    () =>
      config.sections
        .map((s) => {
          const correct = s.questions.filter((q) => answers[q.id] === q.correct_answer).length;
          const unanswered = s.questions.filter((q) => !answers[q.id]).length;
          const total = s.questions.length;
          return {
            name: s.name,
            correct,
            unanswered,
            total,
            pct: total > 0 ? Math.round((correct / total) * 100) : 0,
          };
        })
        .sort((a, b) => a.pct - b.pct),
    [config.sections, answers]
  );

  const finishTest = useCallback(async () => {
    setPhase("results");
    setSaving(true);
    setSaveError(null);
    const { data: userData } = await supabase.auth.getUser();
    if (!userData.user) {
      setSaving(false);
      return;
    }

    const correctCount = allQuestions.filter((q) => answers[q.id] === q.correct_answer).length;
    const { data: college } = await supabase
      .from("colleges")
      .select("id")
      .eq("slug", collegeSlug)
      .single();
    const { error: attemptError } = await supabase.from("mock_test_attempts").insert({
      user_id: userData.user.id,
      mock_test_id: `synthetic:${collegeSlug}`,
      college_id: college?.id ?? null,
      is_pretest: isPretest,
      score: correctCount,
      total_questions: allQuestions.length,
      answers,
      completed_at: new Date().toISOString(),
    });

    if (attemptError) {
      console.error("Failed to save mock test attempt:", attemptError);
      setSaveError(attemptError.message);
      setSaving(false);
      return;
    }

    // Feed subject mastery (and, for a pre-test, the AI study plan) with a
    // per-question row — same 'practice' bucket the practice-question flow
    // writes to, tagged with each section's name as the subject label.
    const questionAttemptRows = config.sections.flatMap((s) =>
      s.questions.map((q) => ({
        user_id: userData.user!.id,
        source: "practice" as const,
        subject_label: s.name,
        is_correct: answers[q.id] === q.correct_answer,
      }))
    );
    if (questionAttemptRows.length > 0) {
      const { error: questionAttemptError } = await supabase.from("question_attempts").insert(questionAttemptRows);
      if (questionAttemptError) console.error("Failed to save question attempts:", questionAttemptError);
    }

    setSaving(false);
    setSaved(true);
  }, [allQuestions, answers, collegeSlug, config.sections, isPretest, supabase]);

  const goToNextSection = useCallback(() => {
    if (isLastSection) {
      finishTest();
      return;
    }
    setSectionIndex((i) => i + 1);
    setSecondsLeft(config.sections[sectionIndex + 1].minutes * 60);
  }, [isLastSection, finishTest, config.sections, sectionIndex]);

  useEffect(() => {
    if (phase !== "running") return;
    if (secondsLeft <= 0) {
      const t = setTimeout(goToNextSection, 0);
      return () => clearTimeout(t);
    }
    const t = setTimeout(() => setSecondsLeft((s) => s - 1), 1000);
    return () => clearTimeout(t);
  }, [phase, secondsLeft, goToNextSection]);

  if (phase === "intro") {
    return (
      <Card>
        <CardHeader>
          <div className="flex flex-wrap items-center gap-2">
            <CardTitle>{config.name}</CardTitle>
            {isPretest && <Badge className="rounded-full">Free pre-test</Badge>}
          </div>
        </CardHeader>
        <CardContent>
          {isPretest && (
            <p className="mb-3 text-sm text-foreground">
              This is your free diagnostic for this exam — it doesn&apos;t count against your plan&apos;s
              mock test limit. Take it now to see your starting point before you study.
            </p>
          )}
          <p className="text-sm text-muted-foreground">
            This mock test has {config.sections.length} timed sections. Once a section&apos;s timer runs
            out, it auto-submits and you move to the next one — just like the real exam. You cannot go
            back to a previous section.
          </p>
          <ul className="mt-4 flex flex-col gap-1 text-sm">
            {config.sections.map((s) => (
              <li key={s.subjectSlug} className="flex justify-between border-b py-1.5">
                <span>{s.name}</span>
                <span className="text-muted-foreground">
                  {s.minutes} min · {s.questions.length} questions
                </span>
              </li>
            ))}
          </ul>
          <Button
            className="mt-6"
            onClick={() => {
              setPhase("running");
              setSecondsLeft(config.sections[0].minutes * 60);
            }}
          >
            Start test
          </Button>
        </CardContent>
      </Card>
    );
  }

  if (phase === "running" && section) {
    const totalSeconds = section.minutes * 60;
    return (
      <div className="flex flex-col gap-4">
        <Card>
          <CardHeader className="flex-row items-center justify-between space-y-0">
            <div>
              <CardTitle>
                Section {sectionIndex + 1} of {config.sections.length}: {section.name}
              </CardTitle>
            </div>
            <div
              className={cn(
                "flex items-center gap-1.5 rounded-md px-3 py-1.5 text-sm font-semibold",
                secondsLeft < 60 ? "bg-destructive/10 text-destructive" : "bg-primary/10 text-primary"
              )}
            >
              <Clock className="h-4 w-4" />
              {formatTime(secondsLeft)}
            </div>
          </CardHeader>
          <CardContent>
            <Progress value={100 - (secondsLeft / totalSeconds) * 100} />
          </CardContent>
        </Card>

        <div className="flex flex-col gap-4">
          {section.questions.map((q, i) => (
            <Card key={q.id}>
              <CardHeader>
                <CardTitle className="text-base">Question {i + 1}</CardTitle>
                <p className="pt-1 text-sm text-foreground">{q.prompt}</p>
              </CardHeader>
              <CardContent className="flex flex-col gap-2">
                {q.choices.map((choice) => (
                  <button
                    key={choice.key}
                    type="button"
                    onClick={() => setAnswers((a) => ({ ...a, [q.id]: choice.key }))}
                    className={cn(
                      "flex items-center rounded-md border px-4 py-2 text-left text-sm transition-colors hover:border-primary hover:bg-primary/5",
                      answers[q.id] === choice.key && "border-primary bg-primary/10"
                    )}
                  >
                    <span className="mr-2 font-semibold">{choice.key}.</span>
                    {choice.text}
                  </button>
                ))}
              </CardContent>
            </Card>
          ))}
        </div>

        <Button onClick={goToNextSection} className="self-end">
          {isLastSection ? "Submit test" : "Next section"}
        </Button>
      </div>
    );
  }

  const correctCount = allQuestions.filter((q) => answers[q.id] === q.correct_answer).length;
  const pct = Math.round((correctCount / allQuestions.length) * 100);
  const weakest = sectionBreakdown[0];
  const strongest = sectionBreakdown[sectionBreakdown.length - 1];
  const totalUnanswered = sectionBreakdown.reduce((sum, s) => sum + s.unanswered, 0);

  return (
    <div className="flex flex-col gap-4">
      <Card>
        <CardHeader className="items-center text-center">
          <CheckCircle2 className="h-10 w-10 text-primary" />
          <CardTitle className="mt-2">{isPretest ? "Pre-test complete!" : "Test complete!"}</CardTitle>
        </CardHeader>
        <CardContent className="text-center">
          <p className="text-4xl font-bold text-primary">{pct}%</p>
          <p className="text-muted-foreground">
            {correctCount} out of {allQuestions.length} correct
            {totalUnanswered > 0 && ` · ${totalUnanswered} unanswered`}
          </p>
          {saving && <p className="mt-2 text-xs text-muted-foreground">Saving your results…</p>}
          {saveError && (
            <div className="mt-3 flex flex-col items-center gap-2">
              <p className="flex items-center gap-1.5 text-xs text-destructive">
                <AlertTriangle className="h-3.5 w-3.5" /> Couldn&apos;t save this attempt: {saveError}
              </p>
              <Button size="sm" variant="outline" onClick={finishTest}>
                Retry saving
              </Button>
            </div>
          )}
          {!saved && !saving && !saveError && (
            <p className="mt-2 text-xs text-muted-foreground">
              Log in to save this attempt to your mastery dashboard.
            </p>
          )}
          {saved && isPretest && (
            <div className="mt-5 flex justify-center">
              <GenerateStudyPlanButton collegeSlug={collegeSlug} />
            </div>
          )}
          <div className="mt-6 flex justify-center gap-3">
            <Button variant="outline" onClick={() => router.push(`/colleges/${collegeSlug}`)}>
              Back to {collegeSlug.toUpperCase()}
            </Button>
            {saved && <Button onClick={() => router.push("/dashboard")}>View dashboard</Button>}
          </div>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Section insights</CardTitle>
        </CardHeader>
        <CardContent className="flex flex-col gap-4">
          {weakest && strongest && weakest.name !== strongest.name && (
            <div className="grid gap-3 sm:grid-cols-2">
              <div className="rounded-lg border border-destructive/30 bg-destructive/5 p-3">
                <p className="text-xs font-medium text-destructive">Weakest section</p>
                <p className="mt-1 text-sm font-semibold">{weakest.name}</p>
                <p className="text-xs text-muted-foreground">
                  {weakest.correct}/{weakest.total} correct ({weakest.pct}%)
                </p>
              </div>
              <div className="rounded-lg border border-border bg-muted/40 p-3">
                <p className="text-xs font-medium text-muted-foreground">Strongest section</p>
                <p className="mt-1 text-sm font-semibold">{strongest.name}</p>
                <p className="text-xs text-muted-foreground">
                  {strongest.correct}/{strongest.total} correct ({strongest.pct}%)
                </p>
              </div>
            </div>
          )}

          <div className="flex flex-col gap-3">
            {sectionBreakdown.map((s) => (
              <div key={s.name}>
                <div className="flex items-center justify-between text-sm">
                  <span className="flex items-center gap-2 font-medium">
                    {s.name}
                    {s.pct < 60 && (
                      <Badge variant="destructive" className="rounded-full text-[0.65rem]">
                        Needs work
                      </Badge>
                    )}
                    {s.pct >= 80 && (
                      <Badge variant="secondary" className="rounded-full text-[0.65rem]">
                        Strong
                      </Badge>
                    )}
                  </span>
                  <span className="text-muted-foreground">
                    {s.correct}/{s.total} ({s.pct}%)
                    {s.unanswered > 0 && ` · ${s.unanswered} blank`}
                  </span>
                </div>
                <Progress value={s.pct} className="mt-1.5" />
              </div>
            ))}
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
