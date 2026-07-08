import Link from "next/link";
import Image from "next/image";
import { notFound } from "next/navigation";
import { Timer } from "lucide-react";
import { buttonVariants } from "@/components/ui/button";
import { getStaticCollege, STATIC_COLLEGES } from "@/lib/colleges-static";
import { getCustomCollege } from "@/lib/data";
import { getSubjectTree } from "@/lib/review-data";
import { LessonSelector } from "@/components/lesson-selector";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";

export function generateStaticParams() {
  return STATIC_COLLEGES.map((c) => ({ collegeSlug: c.slug }));
}

export default async function CollegePage({
  params,
}: {
  params: Promise<{ collegeSlug: string }>;
}) {
  const { collegeSlug } = await params;
  const college = getStaticCollege(collegeSlug) ?? (await getCustomCollege(collegeSlug));
  if (!college) notFound();

  const tree = await getSubjectTree(collegeSlug);

  return (
    <div className="editorial-shell py-14">
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
          <h1 className="mt-3 text-4xl font-semibold leading-tight md:text-5xl">{college.name}</h1>
          <p className="mt-3 max-w-2xl text-muted-foreground">{college.description}</p>
          {college.subjects.length > 0 && (
            <div className="mt-5 flex flex-wrap gap-3">
              <Link href={`/mock-test/${college.slug}`} className={buttonVariants({ className: "rounded-md" })}>
                <Timer className="mr-2 h-4 w-4" /> Take a full mock test
              </Link>
            </div>
          )}
        </div>
      </div>

      {college.subjects.length > 0 && tree.length > 0 ? (
        <section className="mt-10">
          <div className="flex items-end justify-between gap-4 mb-6">
            <div>
              <p className="eyebrow">Coverage</p>
              <h2 className="mt-3 text-2xl font-semibold">Subjects</h2>
            </div>
          </div>
          <LessonSelector
            tree={tree}
            sessionHref={`/practice/${college.slug}/session`}
            submitLabel="Start practice"
          />
        </section>
      ) : (
        <Card className="studio-card mt-10">
          <CardHeader>
            <CardTitle>Coverage &amp; sample questions</CardTitle>
            <CardDescription>Submitted by you and used to tailor your custom reviewer.</CardDescription>
          </CardHeader>
          <CardContent>
            <pre className="whitespace-pre-wrap text-sm text-foreground/90">{college.description}</pre>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
