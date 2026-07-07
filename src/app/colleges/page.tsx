import Link from "next/link";
import { ArrowRight } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { STATIC_COLLEGES } from "@/lib/colleges-static";

export default function CollegesPage() {
  return (
    <div className="editorial-shell py-10">
      <div className="grid gap-6 border-b border-foreground/15 pb-6 md:grid-cols-[0.7fr_1fr]">
        <p className="eyebrow">Exam library</p>
        <div>
          <h1 className="text-4xl font-semibold leading-tight md:text-5xl">Colleges</h1>
          <p className="mt-3 max-w-2xl text-muted-foreground">
            Pick the college you&apos;re preparing for to see subject breakdowns, practice questions,
            videos, and mock tests.
          </p>
        </div>
      </div>
      <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {STATIC_COLLEGES.map((college) => (
          <Link key={college.slug} href={`/colleges/${college.slug}`}>
            <Card className="studio-card h-full">
              <CardHeader>
                <CardTitle className="text-2xl">{college.examName}</CardTitle>
                <CardDescription>{college.name}</CardDescription>
              </CardHeader>
              <CardContent className="flex items-end justify-between gap-4 text-sm">
                <span className="text-muted-foreground">{college.description}</span>
                <ArrowRight className="h-4 w-4 shrink-0 text-primary" />
              </CardContent>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  );
}
