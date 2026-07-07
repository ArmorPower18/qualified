import { notFound } from "next/navigation";
import { getStaticCollege } from "@/lib/colleges-static";
import { getSubjectQuestions } from "@/lib/data";
import { QuestionCard } from "@/components/question-card";

export default async function PracticePage({
  params,
}: {
  params: Promise<{ collegeSlug: string; subjectSlug: string }>;
}) {
  const { collegeSlug, subjectSlug } = await params;
  const college = getStaticCollege(collegeSlug);
  const subject = college?.subjects.find((s) => s.slug === subjectSlug);
  if (!college || !subject) notFound();

  const questions = await getSubjectQuestions(collegeSlug, subjectSlug);

  return (
    <div className="mx-auto max-w-3xl px-4 py-12">
      <span className="text-sm font-semibold text-primary">
        {college.examName} · {subject.name}
      </span>
      <h1 className="text-3xl font-bold">Practice: {subject.name}</h1>
      <p className="mt-2 text-muted-foreground">{subject.description}</p>

      <div className="mt-8 flex flex-col gap-6">
        {questions.map((q, i) => (
          <QuestionCard key={q.id} question={q} index={i} />
        ))}
      </div>
    </div>
  );
}
