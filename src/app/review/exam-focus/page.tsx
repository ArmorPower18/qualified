import Link from "next/link";
import Image from "next/image";
import { ArrowRight } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { STATIC_COLLEGES } from "@/lib/colleges-static";

export default function ExamFocusReviewPage() {
  return (
    <div className="editorial-shell max-w-5xl py-14">
      <div className="border-b border-foreground/15 pb-8">
        <p className="eyebrow">Exam focus</p>
        <h1 className="mt-4 text-4xl font-semibold leading-tight md:text-6xl">Exam Focus Review</h1>
        <p className="mt-4 max-w-2xl text-muted-foreground">
          Pick your target exam to drill only the lessons it prioritizes. Combine as many modules
          as you like for wider coverage.
        </p>
      </div>
      <div className="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {STATIC_COLLEGES.map((college, index) => (
          <Link key={college.slug} href={`/review/exam-focus/${college.slug}`}>
            <Card
              className="studio-card h-full animate-enter-up"
              style={{ animationDelay: `${index * 80}ms` }}
            >
              <CardHeader>
                <div className="flex items-center justify-between">
                  <span className="eyebrow !tracking-normal">0{index + 1}</span>
                  <Image
                    src={college.logo}
                    alt={`${college.name} seal`}
                    width={36}
                    height={36}
                    className="h-9 w-9 object-contain"
                  />
                </div>
                <CardTitle className="mt-5 text-2xl">{college.examName}</CardTitle>
                <CardDescription>{college.name}</CardDescription>
              </CardHeader>
              <CardContent className="flex justify-end">
                <ArrowRight className="h-4 w-4 text-primary" />
              </CardContent>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  );
}
