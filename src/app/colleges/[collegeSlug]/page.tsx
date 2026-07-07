import Link from "next/link";
import { notFound } from "next/navigation";
import { BookOpen, PlayCircle, Timer } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { buttonVariants } from "@/components/ui/button";
import { getStaticCollege, STATIC_COLLEGES } from "@/lib/colleges-static";
import { getCustomCollege } from "@/lib/data";

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

  return (
    <div className="editorial-shell py-14">
      <div className="grid gap-8 border-b border-foreground/15 pb-8 md:grid-cols-[0.7fr_1fr]">
        <p className="eyebrow">{college.examName}</p>
        <div>
          <h1 className="text-4xl font-semibold leading-tight md:text-6xl">{college.name}</h1>
          <p className="mt-4 max-w-2xl text-muted-foreground">{college.description}</p>
          {college.subjects.length > 0 && (
            <div className="mt-6 flex flex-wrap gap-3">
              <Link href={`/mock-test/${college.slug}`} className={buttonVariants({ className: "rounded-md" })}>
                <Timer className="mr-2 h-4 w-4" /> Take a full mock test
              </Link>
            </div>
          )}
        </div>
      </div>

      {college.subjects.length > 0 ? (
        <section className="mt-10">
          <div className="flex items-end justify-between gap-4">
            <div>
              <p className="eyebrow">Coverage</p>
              <h2 className="mt-3 text-2xl font-semibold">Subjects</h2>
            </div>
          </div>
          <div className="mt-4 grid gap-4 sm:grid-cols-2">
            {college.subjects.map((subject, index) => (
              <Card
                key={subject.slug}
                className="studio-card animate-enter-up"
                style={{ animationDelay: `${index * 80}ms` }}
              >
                <CardHeader>
                  <CardTitle>{subject.name}</CardTitle>
                  <CardDescription>{subject.description}</CardDescription>
                </CardHeader>
                <CardContent className="flex flex-wrap gap-3">
                  <Link
                    href={`/practice/${college.slug}/${subject.slug}`}
                    className={buttonVariants({ variant: "outline", size: "sm", className: "rounded-md" })}
                  >
                    <BookOpen className="mr-2 h-4 w-4" /> Practice
                  </Link>
                  <Link
                    href={`/videos/${college.slug}/${subject.slug}`}
                    className={buttonVariants({ variant: "outline", size: "sm", className: "rounded-md" })}
                  >
                    <PlayCircle className="mr-2 h-4 w-4" /> Videos
                  </Link>
                </CardContent>
              </Card>
            ))}
          </div>
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
