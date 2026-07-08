import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { buttonVariants } from "@/components/ui/button";
import { MasteryChart } from "@/components/mastery-chart";
import { Progress } from "@/components/ui/progress";
import type { MockTestAttempt, ReviewAttempt, QuestionAttempt } from "@/lib/types";

const modeLabels: Record<ReviewAttempt["mode"], string> = {
  flashcard: "Flashcards",
  general: "General Review",
  exam_focus: "Exam Focus Review",
};

function formatDuration(totalSeconds: number) {
  const hours = Math.floor(totalSeconds / 3600);
  const minutes = Math.round((totalSeconds % 3600) / 60);
  if (hours === 0 && minutes === 0) return "< 1m";
  if (hours === 0) return `${minutes}m`;
  return `${hours}h ${minutes}m`;
}

export default async function DashboardPage() {
  const supabase = await createClient();
  const user = await supabase.auth
    .getUser()
    .then(({ data }) => data.user)
    .catch(() => null);

  if (!user) redirect("/login");

  const { data: attempts } = await supabase
    .from("mock_test_attempts")
    .select("*")
    .eq("user_id", user.id)
    .order("completed_at", { ascending: true });

  const typedAttempts = (attempts as MockTestAttempt[]) ?? [];

  const { data: reviewAttempts } = await supabase
    .from("review_attempts")
    .select("*")
    .eq("user_id", user.id)
    .order("completed_at", { ascending: false });

  const typedReviewAttempts = (reviewAttempts as ReviewAttempt[]) ?? [];

  const totalStudySeconds = typedReviewAttempts.reduce((sum, a) => sum + (a.duration_seconds ?? 0), 0);

  // Subject mastery: accuracy per subject from practice + review questions only.
  // Flashcards never write to question_attempts (self-reported, not graded), so they're
  // excluded automatically.
  const { data: questionAttempts } = await supabase
    .from("question_attempts")
    .select("*")
    .eq("user_id", user.id);

  const typedQuestionAttempts = (questionAttempts as QuestionAttempt[]) ?? [];
  const masteryBySubject = new Map<string, { correct: number; total: number }>();
  for (const a of typedQuestionAttempts) {
    const bucket = masteryBySubject.get(a.subject_label) ?? { correct: 0, total: 0 };
    bucket.total += 1;
    if (a.is_correct) bucket.correct += 1;
    masteryBySubject.set(a.subject_label, bucket);
  }
  const subjectMastery = Array.from(masteryBySubject.entries())
    .map(([subject, { correct, total }]) => ({
      subject,
      correct,
      total,
      pct: Math.round((correct / total) * 100),
    }))
    .sort((a, b) => b.total - a.total);

  return (
    <div className="editorial-shell max-w-4xl py-10">
      <div className="border-b border-foreground/15 pb-6">
        <p className="eyebrow">Progress</p>
        <h1 className="mt-3 text-4xl font-semibold leading-tight md:text-5xl">Your mastery dashboard</h1>
        <p className="mt-3 max-w-2xl text-muted-foreground">
          Track your mock test performance over time and spot where to focus next.
        </p>
      </div>

      <div className="mt-6 grid gap-5 md:grid-cols-[1.3fr_0.7fr]">
        <Card className="studio-card">
          <CardHeader>
            <CardTitle>Subject mastery</CardTitle>
            <CardDescription>
              Accuracy from practice questions and review sessions (Flashcards don&apos;t count —
              they&apos;re self-graded, not scored).
            </CardDescription>
          </CardHeader>
          <CardContent>
            {subjectMastery.length === 0 ? (
              <p className="text-sm text-muted-foreground">
                Answer some practice or review questions to see your accuracy by subject here.
              </p>
            ) : (
              <div className="flex flex-col gap-4">
                {subjectMastery.map((s) => (
                  <div key={s.subject}>
                    <div className="flex items-center justify-between text-sm">
                      <span className="font-medium">{s.subject}</span>
                      <span className="text-muted-foreground">
                        {s.correct}/{s.total} ({s.pct}%)
                      </span>
                    </div>
                    <Progress value={s.pct} className="mt-1.5" />
                  </div>
                ))}
              </div>
            )}
          </CardContent>
        </Card>

        <Card className="studio-card">
          <CardHeader>
            <CardTitle>Time studied</CardTitle>
            <CardDescription>Across all review sessions</CardDescription>
          </CardHeader>
          <CardContent>
            <p className="text-4xl font-semibold text-primary">{formatDuration(totalStudySeconds)}</p>
            <p className="mt-1 text-sm text-muted-foreground">
              {typedReviewAttempts.length} session{typedReviewAttempts.length === 1 ? "" : "s"} completed
            </p>
          </CardContent>
        </Card>
      </div>

      {typedAttempts.length === 0 ? (
        <Card className="studio-card mt-6">
          <CardHeader>
            <CardTitle>No attempts yet</CardTitle>
            <CardDescription>
              Take a mock test to start building your mastery history.
            </CardDescription>
          </CardHeader>
          <CardContent>
            <Link href="/mock-test" className={buttonVariants()}>
              Take a mock test
            </Link>
          </CardContent>
        </Card>
      ) : (
        <div className="mt-6 flex flex-col gap-5">
          <Card className="studio-card">
            <CardHeader>
              <CardTitle>Score over time</CardTitle>
              <CardDescription>Percentage correct per completed mock test attempt</CardDescription>
            </CardHeader>
            <CardContent>
              <MasteryChart attempts={typedAttempts} />
            </CardContent>
          </Card>

          <Card className="studio-card">
            <CardHeader>
              <CardTitle>Recent attempts</CardTitle>
            </CardHeader>
            <CardContent>
              <ul className="flex flex-col gap-2">
                {typedAttempts
                  .slice()
                  .reverse()
                  .map((a) => (
                    <li key={a.id} className="flex items-center justify-between border-b py-2 text-sm">
                      <span className="text-muted-foreground">
                        {a.completed_at ? new Date(a.completed_at).toLocaleDateString() : "In progress"}
                      </span>
                      <span className="font-semibold text-primary">
                        {a.score ?? 0}/{a.total_questions ?? 0} (
                        {a.total_questions ? Math.round(((a.score ?? 0) / a.total_questions) * 100) : 0}%)
                      </span>
                    </li>
                  ))}
              </ul>
            </CardContent>
          </Card>
        </div>
      )}

      <div className="mt-6">
        <Card className="studio-card">
          <CardHeader>
            <CardTitle>Recent review sessions</CardTitle>
            <CardDescription>Flashcards, General Review, and Exam Focus Review activity</CardDescription>
          </CardHeader>
          <CardContent>
            {typedReviewAttempts.length === 0 ? (
              <div className="flex flex-col items-start gap-3">
                <p className="text-sm text-muted-foreground">
                  No review sessions yet — General Review and Exam Focus Review count toward your
                  subject mastery above; flashcard time is tracked here too.
                </p>
                <Link href="/review" className={buttonVariants({ variant: "outline", className: "rounded-md" })}>
                  Go to Review
                </Link>
              </div>
            ) : (
              <ul className="flex flex-col gap-2">
                {typedReviewAttempts.map((a) => (
                  <li key={a.id} className="flex items-center justify-between border-b py-2 text-sm">
                    <span className="text-muted-foreground">
                      {modeLabels[a.mode]} ·{" "}
                      {a.completed_at ? new Date(a.completed_at).toLocaleDateString() : "In progress"}
                    </span>
                    <span className="font-semibold text-primary">
                      {a.mode === "flashcard"
                        ? `${a.score ?? 0}/${a.total_questions ?? 0} knew it`
                        : `${a.question_count} question${a.question_count === 1 ? "" : "s"}`}
                    </span>
                  </li>
                ))}
              </ul>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
