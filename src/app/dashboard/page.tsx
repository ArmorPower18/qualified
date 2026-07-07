import Link from "next/link";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { buttonVariants } from "@/components/ui/button";
import { MasteryChart } from "@/components/mastery-chart";
import type { MockTestAttempt, ReviewAttempt } from "@/lib/types";

const modeLabels: Record<ReviewAttempt["mode"], string> = {
  flashcard: "Flashcards",
  general: "General Review",
  exam_focus: "Exam Focus Review",
};

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

  return (
    <div className="editorial-shell max-w-4xl py-10">
      <div className="border-b border-foreground/15 pb-6">
        <p className="eyebrow">Progress</p>
        <h1 className="mt-3 text-4xl font-semibold leading-tight md:text-5xl">Your mastery dashboard</h1>
        <p className="mt-3 max-w-2xl text-muted-foreground">
          Track your mock test performance over time and spot where to focus next.
        </p>
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
                  No review sessions yet — flashcards and topic review count toward your mastery
                  tracking too.
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
