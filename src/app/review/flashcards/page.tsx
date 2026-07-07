import { LessonSelector } from "@/components/lesson-selector";
import { getSubjectTree } from "@/lib/review-data";

export default async function FlashcardsSelectPage() {
  const tree = await getSubjectTree("general");

  return (
    <div className="editorial-shell max-w-4xl py-14">
      <div className="border-b border-foreground/15 pb-8">
        <p className="eyebrow">Active recall</p>
        <h1 className="mt-4 text-4xl font-semibold leading-tight md:text-6xl">Flashcards</h1>
        <p className="mt-4 max-w-2xl text-muted-foreground">
          Pick lessons across any subject to build a custom flashcard deck. No time pressure, just
          memorization at your own pace.
        </p>
      </div>
      <div className="mt-8">
        <LessonSelector tree={tree} sessionHref="/review/flashcards/session" submitLabel="Study flashcards" />
      </div>
    </div>
  );
}
