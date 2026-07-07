import Link from "next/link";
import { ArrowRight, Timer } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { STATIC_COLLEGES } from "@/lib/colleges-static";

export default function MockTestIndexPage() {
  return (
    <div className="editorial-shell py-14">
      <div className="grid gap-8 border-b border-foreground/15 pb-8 md:grid-cols-[0.7fr_1fr]">
        <p className="eyebrow">Timed practice</p>
        <div>
          <h1 className="text-4xl font-semibold leading-tight md:text-6xl">Mock Tests</h1>
          <p className="mt-4 max-w-2xl text-muted-foreground">
            Full-length, timed mock tests that simulate the real time pressure of each CET.
          </p>
        </div>
      </div>
      <div className="mt-8 grid gap-4 sm:grid-cols-2">
        {STATIC_COLLEGES.map((college, index) => (
          <Link key={college.slug} href={`/mock-test/${college.slug}`}>
            <Card
              className="studio-card h-full animate-enter-up"
              style={{ animationDelay: `${index * 80}ms` }}
            >
              <CardHeader>
                <div className="flex items-center justify-between">
                  <span className="eyebrow">0{index + 1}</span>
                  <span className="flex h-9 w-9 items-center justify-center rounded-md bg-foreground text-background">
                    <Timer className="h-4 w-4" />
                  </span>
                </div>
                <CardTitle className="mt-8 text-xl">{college.examName} Mock Test</CardTitle>
                <CardDescription>{college.name}</CardDescription>
              </CardHeader>
              <CardContent className="flex items-center justify-between text-sm">
                <span className="text-muted-foreground">{college.subjects.length} timed sections</span>
                <span className="inline-flex items-center gap-1 font-medium text-primary">
                  Start <ArrowRight className="h-3.5 w-3.5" />
                </span>
              </CardContent>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  );
}
