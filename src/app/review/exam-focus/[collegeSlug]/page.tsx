import Image from "next/image";
import { notFound } from "next/navigation";
import { getStaticCollege } from "@/lib/colleges-static";
import { getSubjectTree } from "@/lib/review-data";
import { LessonSelector } from "@/components/lesson-selector";

export default async function ExamFocusCollegePage({
  params,
}: {
  params: Promise<{ collegeSlug: string }>;
}) {
  const { collegeSlug } = await params;
  const college = getStaticCollege(collegeSlug);
  if (!college) notFound();

  const tree = await getSubjectTree(collegeSlug);

  return (
    <div className="editorial-shell max-w-4xl py-14">
      <div className="grid gap-8 border-b border-foreground/15 pb-8 md:grid-cols-[auto_1fr]">
        <div className="flex items-start">
          {college.logo && (
            <Image
              src={college.logo}
              alt={`${college.name} seal`}
              width={160}
              height={160}
              className="h-32 w-32 md:h-40 md:w-40 object-contain"
            />
          )}
        </div>
        <div>
          <p className="eyebrow">{college.examName}</p>
          <h1 className="mt-3 text-4xl font-semibold leading-tight md:text-5xl">
            Exam Focus: {college.name}
          </h1>
          <p className="mt-3 max-w-2xl text-muted-foreground">
            Only lessons {college.examName} actually prioritizes — select as many as you want to
            combine into one review session.
          </p>
        </div>
      </div>
      <div className="mt-8">
        <LessonSelector
          tree={tree}
          sessionHref={`/review/exam-focus/${collegeSlug}/session`}
          submitLabel="Start review"
        />
      </div>
    </div>
  );
}
