"use client";

import { useEffect, useMemo, useState, useCallback } from "react";
import { useRouter } from "next/navigation";
import { Clock, CheckCircle2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Progress } from "@/components/ui/progress";
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

export function MockTestRunner({ config, collegeSlug }: { config: MockTestConfig; collegeSlug: string }) {
  const router = useRouter();
  const supabase = createClient();
  const [phase, setPhase] = useState<Phase>("intro");
  const [sectionIndex, setSectionIndex] = useState(0);
  const [secondsLeft, setSecondsLeft] = useState((config.sections[0]?.minutes ?? 0) * 60);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [saved, setSaved] = useState(false);

  const section = config.sections[sectionIndex];
  const isLastSection = sectionIndex === config.sections.length - 1;

  const allQuestions = useMemo(() => config.sections.flatMap((s) => s.questions), [config.sections]);

  const finishTest = useCallback(async () => {
    setPhase("results");
    const { data: userData } = await supabase.auth.getUser();
    if (!userData.user) return;

    const correctCount = allQuestions.filter((q) => answers[q.id] === q.correct_answer).length;
    const { data: college } = await supabase
      .from("colleges")
      .select("id")
      .eq("slug", collegeSlug)
      .single();
    await supabase.from("mock_test_attempts").insert({
      user_id: userData.user.id,
      mock_test_id: `synthetic:${collegeSlug}`,
      college_id: college?.id ?? null,
      score: correctCount,
      total_questions: allQuestions.length,
      answers,
      completed_at: new Date().toISOString(),
    });
    setSaved(true);
  }, [allQuestions, answers, collegeSlug, supabase]);

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
          <CardTitle>{config.name}</CardTitle>
        </CardHeader>
        <CardContent>
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

  return (
    <Card>
      <CardHeader className="items-center text-center">
        <CheckCircle2 className="h-10 w-10 text-primary" />
        <CardTitle className="mt-2">Test complete!</CardTitle>
      </CardHeader>
      <CardContent className="text-center">
        <p className="text-4xl font-bold text-primary">{pct}%</p>
        <p className="text-muted-foreground">
          {correctCount} out of {allQuestions.length} correct
        </p>
        {!saved && (
          <p className="mt-2 text-xs text-muted-foreground">
            Log in to save this attempt to your mastery dashboard.
          </p>
        )}
        <div className="mt-6 flex justify-center gap-3">
          <Button variant="outline" onClick={() => router.push(`/colleges/${collegeSlug}`)}>
            Back to {collegeSlug.toUpperCase()}
          </Button>
          {saved && <Button onClick={() => router.push("/dashboard")}>View dashboard</Button>}
        </div>
      </CardContent>
    </Card>
  );
}
