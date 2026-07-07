import { LessonSelector } from "@/components/lesson-selector";
import { getSubjectTree } from "@/lib/review-data";

export default async function GeneralReviewSelectPage() {
  const tree = await getSubjectTree("general");

  return (
    <div className="editorial-shell max-w-4xl py-14">
      <div className="border-b border-foreground/15 pb-8">
        <p className="eyebrow">Broad practice</p>
        <h1 className="mt-4 text-4xl font-semibold leading-tight md:text-6xl">General Review</h1>
        <p className="mt-4 max-w-2xl text-muted-foreground">
          Browse every subject and combine as many lessons or modules as you want for broad,
          topic-based practice.
        </p>
      </div>
      <div className="mt-8">
        <LessonSelector tree={tree} sessionHref="/review/general/session" submitLabel="Start review" />
      </div>
    </div>
  );
}
