import Link from "next/link";
import Image from "next/image";
import { ArrowRight } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { STATIC_COLLEGES } from "@/lib/colleges-static";

export default function CollegesPage() {
  return (
    <div className="editorial-shell py-10">
      <div className="mb-8 border-b border-foreground/15 pb-6">
        <p className="eyebrow">Exam library</p>
        <h1 className="mt-2 text-4xl font-semibold leading-tight">Colleges</h1>
        <p className="mt-2 max-w-2xl text-sm text-muted-foreground">
          Pick your college to see subject breakdowns and practice.
        </p>
      </div>
      <div className="grid gap-4 md:grid-cols-3">
        {STATIC_COLLEGES.map((college, index) => (
          <Link key={college.slug} href={`/colleges/${college.slug}`}>
            <Card className="studio-card h-full flex flex-col animate-enter-up" style={{ animationDelay: `${index * 80}ms` }}>
              <CardHeader>
                <div className="flex items-center justify-between mb-6">
                  <span className="eyebrow">0{index + 1}</span>
                  <Image
                    src={college.logo}
                    alt={`${college.name} seal`}
                    width={48}
                    height={48}
                    className="h-12 w-12 object-contain"
                  />
                </div>
                <CardTitle className="text-xl">{college.examName}</CardTitle>
                <CardDescription className="mt-2 min-h-[2.5rem]">{college.name}</CardDescription>
                <span className="mt-4 inline-flex items-center gap-1 text-sm font-medium text-primary">
                  Open <ArrowRight className="h-3.5 w-3.5" />
                </span>
              </CardHeader>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  );
}
