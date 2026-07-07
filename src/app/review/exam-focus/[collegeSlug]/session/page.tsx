import Link from "next/link";
import { notFound } from "next/navigation";
import { Target } from "lucide-react";
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card";
import { buttonVariants } from "@/components/ui/button";
import { getStaticCollege } from "@/lib/colleges-static";
import { getReviewQuestions } from "@/lib/review-data";
import { createClient } from "@/lib/supabase/server";
import { ReviewQuestionSession } from "@/components/review-question-session";
import type { Difficulty } from "@/lib/types";

export default async function ExamFocusSessionPage({
  params,
  searchParams,
}: {
  params: Promise<{ collegeSlug: string }>;
  searchParams: Promise<{ lessons?: string; difficulty?: string; count?: string }>;
}) {
  const { collegeSlug } = await params;
  const college = getStaticCollege(collegeSlug);
  if (!college) notFound();

  const sp = await searchParams;
  const lessonIds = (sp.lessons ?? "").split(",").filter(Boolean);
  const difficulty = (sp.difficulty as Difficulty | undefined) ?? null;
  const count = Number(sp.count) || 10;

  const questions = await getReviewQuestions(lessonIds, difficulty, count);

  let collegeId: string | null = null;
  try {
    const supabase = await createClient();
    const { data } = await supabase.from("colleges").select("id").eq("slug", collegeSlug).single();
    collegeId = data?.id ?? null;
  } catch {
    collegeId = null;
  }

  if (questions.length === 0) {
    return (
      <div className="editorial-shell max-w-2xl py-16">
        <Card className="studio-card">
          <CardHeader className="items-center text-center">
            <Target className="h-10 w-10 text-muted-foreground" />
            <CardTitle className="mt-2 text-base font-medium text-muted-foreground">
              No questions yet for this selection
            </CardTitle>
          </CardHeader>
          <CardContent className="flex flex-col items-center gap-4 text-center text-sm text-muted-foreground">
            <p>We&apos;re still building out the question bank for these lessons — check back soon.</p>
            <Link href={`/review/exam-focus/${collegeSlug}`} className={buttonVariants({ className: "rounded-md" })}>
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
        mode="exam_focus"
        collegeId={collegeId}
        backHref={`/review/exam-focus/${collegeSlug}`}
      />
    </div>
  );
}
