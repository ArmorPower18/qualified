"use client";

import { useState } from "react";
import { CheckCircle2, XCircle } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { cn } from "@/lib/utils";
import type { Question, QuestionAttemptSource } from "@/lib/types";
import { CommentThread } from "@/components/comment-thread";
import { createClient } from "@/lib/supabase/client";

export function QuestionCard({
  question,
  index,
  subjectLabel,
  attemptSource,
  collegeId,
}: {
  question: Question;
  index: number;
  // When provided, answering logs a question_attempts row for subject mastery tracking.
  // Omitted for sample/fallback questions (no real DB row to attribute the attempt to).
  subjectLabel?: string;
  attemptSource?: QuestionAttemptSource;
  // Null for exam-agnostic attempts (general review) so the dashboard can scope
  // subject mastery to whichever exam is selected.
  collegeId?: string | null;
}) {
  const [selected, setSelected] = useState<string | null>(null);

  const isCorrect = selected === question.correct_answer;

  async function handleSelect(key: string) {
    setSelected(key);
    if (!subjectLabel || !attemptSource || question.id.startsWith("sample-")) return;
    const supabase = createClient();
    const { data: userData } = await supabase.auth.getUser();
    if (!userData.user) return;
    await supabase.from("question_attempts").insert({
      user_id: userData.user.id,
      source: attemptSource,
      subject_label: subjectLabel,
      college_id: collegeId ?? null,
      is_correct: key === question.correct_answer,
    });
  }

  return (
    <Card className="studio-card">
      <CardHeader>
        <div className="flex items-center justify-between">
          <CardTitle className="text-base">Question {index + 1}</CardTitle>
          <Badge variant="secondary" className="capitalize">
            {question.difficulty}
          </Badge>
        </div>
        <p className="pt-2 text-foreground">{question.prompt}</p>
      </CardHeader>
      <CardContent>
        <div className="flex flex-col gap-2">
          {question.choices.map((choice) => {
            const isSelected = selected === choice.key;
            const showCorrect = selected !== null && choice.key === question.correct_answer;
            const showWrong = isSelected && choice.key !== question.correct_answer;
            return (
              <button
                key={choice.key}
                type="button"
                onClick={() => handleSelect(choice.key)}
                disabled={selected !== null}
                className={cn(
                  "flex items-center justify-between rounded-md border px-4 py-2.5 text-left text-sm transition-colors",
                  "disabled:cursor-default",
                  !selected && "hover:border-primary hover:bg-primary/5",
                  showCorrect && "border-green-500 bg-green-500/10",
                  showWrong && "border-destructive bg-destructive/10"
                )}
              >
                <span>
                  <span className="mr-2 font-semibold">{choice.key}.</span>
                  {choice.text}
                </span>
                {showCorrect && <CheckCircle2 className="h-4 w-4 text-green-600" />}
                {showWrong && <XCircle className="h-4 w-4 text-destructive" />}
              </button>
            );
          })}
        </div>

        {selected && (
          <div
            className={cn(
              "mt-4 rounded-md p-3 text-sm",
              isCorrect ? "bg-green-500/10 text-green-700" : "bg-destructive/10 text-destructive"
            )}
          >
            <p className="font-semibold">{isCorrect ? "Correct!" : "Not quite."}</p>
            {question.explanation && <p className="mt-1 text-foreground/80">{question.explanation}</p>}
          </div>
        )}

        <div className="mt-6">
          <CommentThread questionId={question.id} />
        </div>
      </CardContent>
    </Card>
  );
}
