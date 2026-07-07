import Link from "next/link";
import { BookOpen } from "lucide-react";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { buttonVariants } from "@/components/ui/button";
import { getReviewQuestions } from "@/lib/review-data";
import { ReviewQuestionSession } from "@/components/review-question-session";
import type { Difficulty } from "@/lib/types";

export default async function GeneralReviewSessionPage({
  searchParams,
}: {
  searchParams: Promise<{ lessons?: string; difficulty?: string; count?: string }>;
}) {
  const params = await searchParams;
  const lessonIds = (params.lessons ?? "").split(",").filter(Boolean);
  const difficulty = (params.difficulty as Difficulty | undefined) ?? null;
  const count = Number(params.count) || 10;

  const questions = await getReviewQuestions(lessonIds, difficulty, count);

  if (questions.length === 0) {
    return (
      <div className="editorial-shell max-w-2xl py-16">
        <Card className="studio-card">
          <CardHeader className="items-center text-center">
            <BookOpen className="h-10 w-10 text-muted-foreground" />
            <CardTitle className="mt-2 text-base font-medium text-muted-foreground">
              No questions yet for this selection
            </CardTitle>
          </CardHeader>
          <CardContent className="flex flex-col items-center gap-4 text-center text-sm text-muted-foreground">
            <p>We&apos;re still building out the question bank for these lessons — check back soon.</p>
            <Link href="/review/general" className={buttonVariants({ className: "rounded-md" })}>
              Try a different selection
            </Link>
          </CardContent>
        </Card>
      </div>
    );
  }

  return (
    <div className="editorial-shell max-w-3xl py-12">
      <ReviewQuestionSession
        questions={questions}
        lessonIds={lessonIds}
        difficulty={difficulty}
        mode="general"
        collegeId={null}
        backHref="/review/general"
      />
    </div>
  );
}
