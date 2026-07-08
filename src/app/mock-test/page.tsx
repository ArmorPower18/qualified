import Link from "next/link";
import { ArrowRight, Timer } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { STATIC_COLLEGES } from "@/lib/colleges-static";
import { getMockTestConfig } from "@/lib/data";

export default async function MockTestIndexPage() {
  // Fetch section counts from the DB for all colleges in parallel
  const configs = await Promise.all(
    STATIC_COLLEGES.map((college) => getMockTestConfig(college.slug))
  );

  return (
    <div className="editorial-shell py-14">
      <div className="mb-8 border-b border-foreground/15 pb-6">
        <p className="eyebrow">Timed practice</p>
        <h1 className="mt-2 text-4xl font-semibold leading-tight">Mock Tests</h1>
        <p className="mt-2 max-w-2xl text-sm text-muted-foreground">
          Full-length, timed mock tests that simulate the real time pressure of each CET.
        </p>
      </div>
      <div className="grid gap-4 md:grid-cols-3">
        {STATIC_COLLEGES.map((college, index) => {
          const config = configs[index];
          const sectionCount = config?.sections.length ?? college.subjects.length;
          const totalMinutes = config?.totalMinutes ?? college.subjects.length * 10;
          return (
            <Link key={college.slug} href={`/mock-test/${college.slug}`}>
              <Card
                className="studio-card h-full flex flex-col animate-enter-up"
                style={{ animationDelay: `${index * 80}ms` }}
              >
                <CardHeader>
                  <div className="flex items-center justify-between mb-6">
                    <span className="eyebrow !tracking-normal">0{index + 1}</span>
                    <span className="flex h-9 w-9 items-center justify-center rounded-lg bg-foreground text-background">
                      <Timer className="h-4.5 w-4.5" />
                    </span>
                  </div>
                  <CardTitle className="text-xl">{college.examName} Mock Test</CardTitle>
                  <CardDescription className="mt-2 min-h-[2.5rem]">{college.name}</CardDescription>
                  <div className="mt-4 flex items-center justify-between text-sm">
                    <span className="text-muted-foreground">
                      {sectionCount} sections · {totalMinutes} min
                    </span>
                    <span className="inline-flex items-center gap-1 font-medium text-primary">
                      Start <ArrowRight className="h-3.5 w-3.5" />
                    </span>
                  </div>
                </CardHeader>
              </Card>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
