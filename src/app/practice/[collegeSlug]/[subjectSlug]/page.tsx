import Image from "next/image";
import { notFound } from "next/navigation";
import { getStaticCollege } from "@/lib/colleges-static";
import { getSubjectTree } from "@/lib/review-data";
import { LessonSelector } from "@/components/lesson-selector";

export default async function PracticePage({
  params,
}: {
  params: Promise<{ collegeSlug: string; subjectSlug: string }>;
}) {
  const { collegeSlug, subjectSlug } = await params;
  const college = getStaticCollege(collegeSlug);
  const subject = college?.subjects.find((s) => s.slug === subjectSlug);
  if (!college || !subject) notFound();

  // Get the lesson tree for this college
  const tree = await getSubjectTree(collegeSlug);
  
  // Filter to only show lessons for this specific subject
  const filteredTree = tree.map((subjectArea) => ({
    ...subjectArea,
    modules: subjectArea.modules.filter((mod) => 
      mod.name.toLowerCase().includes(subject.name.toLowerCase()) ||
      subjectArea.name.toLowerCase().includes(subject.name.toLowerCase())
    ),
  })).filter((subjectArea) => subjectArea.modules.length > 0);

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
          <p className="eyebrow">{college.examName} · {subject.name}</p>
          <h1 className="mt-3 text-4xl font-semibold leading-tight md:text-5xl">
            Practice: {subject.name}
          </h1>
          <p className="mt-3 max-w-2xl text-muted-foreground">
            {subject.description}
          </p>
        </div>
      </div>
      <div className="mt-8">
        <LessonSelector
          tree={filteredTree}
          sessionHref={`/practice/${collegeSlug}/${subjectSlug}/session`}
          submitLabel="Start practice"
        />
      </div>
    </div>
  );
}
