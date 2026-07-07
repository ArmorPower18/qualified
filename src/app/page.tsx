import Link from "next/link";
import { ArrowRight, Layers, LineChart, Timer } from "lucide-react";
import { buttonVariants } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { STATIC_COLLEGES } from "@/lib/colleges-static";

const pillars = [
  {
    icon: Timer,
    label: "01",
    title: "Timed exam pressure",
    description: "Full-length mock tests tuned for UPCAT, ACET, DCAT, and USTET pacing.",
  },
  {
    icon: Layers,
    label: "02",
    title: "Focused review loops",
    description: "Practice questions, flashcards, and explanations organized by lesson.",
  },
  {
    icon: LineChart,
    label: "03",
    title: "Visible progress",
    description: "Track accuracy patterns so the next study session has a clear target.",
  },
];

const tickerItems = ["UPCAT", "ACET", "DCAT", "USTET", "MOCK TESTS", "FLASHCARDS", "FREE REVIEW"];

export default function Home() {
  return (
    <div className="overflow-hidden">
      <section className="border-b border-foreground/15">
        <div className="editorial-shell grid min-h-[calc(100vh-6rem)] gap-8 py-8 lg:grid-cols-[1.08fr_0.92fr] lg:items-end lg:py-10">
          <div className="self-center">
            <div className="animate-enter-up inline-flex items-center gap-3 border-y border-foreground/20 py-1.5">
              <span className="eyebrow">Free CET prep</span>
              <span className="h-1.5 w-1.5 rounded-full bg-accent" />
              <span className="eyebrow">Philippines</span>
            </div>
            <h1 className="animate-enter-up mt-6 max-w-4xl text-4xl font-semibold leading-[1.05] text-foreground [animation-delay:90ms] sm:text-5xl md:text-6xl lg:text-7xl">
              Study like the exam is already on the table.
            </h1>
            <p className="animate-enter-up mt-5 max-w-2xl text-base leading-7 text-muted-foreground [animation-delay:180ms] md:text-lg">
              Qualified combines realistic mock tests, targeted review, flashcards, and progress
              tracking for UPCAT, ACET, DCAT, and USTET preparation.
            </p>
            <div className="animate-enter-up mt-7 flex flex-wrap items-center gap-3 [animation-delay:270ms]">
              <Link href="/signup" className={buttonVariants({ size: "lg", className: "rounded-md px-5" })}>
                Start practicing
                <ArrowRight className="ml-1 h-4 w-4" />
              </Link>
              <Link
                href="/colleges"
                className={buttonVariants({
                  size: "lg",
                  variant: "outline",
                  className: "rounded-md border-foreground/20 bg-card/70 px-5",
                })}
              >
                Browse exams
              </Link>
            </div>
          </div>

          <div className="animate-enter-up self-end [animation-delay:180ms]">
            <div className="rule-grid border border-foreground/15 bg-card/70 p-3">
              <div className="grid overflow-hidden border border-foreground/20 bg-background sm:aspect-[4/5] sm:grid-rows-[1fr_auto]">
                <div className="grid sm:grid-cols-2">
                  <div className="border-b border-foreground/15 p-5 sm:border-r sm:border-b-0">
                    <p className="eyebrow">Active session</p>
                    <p className="mt-4 text-6xl font-semibold tracking-normal">84%</p>
                    <p className="mt-2 text-sm text-muted-foreground">Reading accuracy</p>
                  </div>
                  <div className="flex flex-col justify-between p-5">
                    <div>
                      <p className="eyebrow">Next block</p>
                      <p className="mt-4 text-xl font-semibold leading-tight sm:text-2xl">Science drills</p>
                    </div>
                    <div className="space-y-2">
                      {[72, 48, 86].map((width, index) => (
                        <div key={index} className="h-2 bg-muted">
                          <div
                            className="h-full bg-foreground animate-line-reveal"
                            style={{ width: `${width}%`, animationDelay: `${index * 120 + 300}ms` }}
                          />
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
                <div className="grid grid-cols-2 border-t border-foreground/15 text-center text-sm sm:grid-cols-4">
                  {STATIC_COLLEGES.map((college) => (
                    <Link
                      key={college.slug}
                      href={`/colleges/${college.slug}`}
                      className="border-r border-foreground/15 px-2 py-4 font-medium last:border-r-0 hover:bg-foreground hover:text-background"
                    >
                      {college.examName}
                    </Link>
                  ))}
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <div className="border-b border-foreground/15 bg-accent py-3 text-foreground">
        <div className="flex w-max animate-ticker gap-8 whitespace-nowrap font-mono text-xs font-semibold uppercase tracking-[0.22em]">
          {[...tickerItems, ...tickerItems, ...tickerItems, ...tickerItems].map((item, index) => (
            <span key={`${item}-${index}`}>{item}</span>
          ))}
        </div>
      </div>

      <section className="editorial-shell py-12">
        <div className="grid gap-6 border-b border-foreground/15 pb-6 md:grid-cols-[0.7fr_1fr]">
          <p className="eyebrow">Study system</p>
          <h2 className="text-3xl font-semibold leading-tight md:text-4xl">
            A cleaner path from review material to measurable readiness.
          </h2>
        </div>
        <div className="mt-6 grid gap-4 md:grid-cols-3">
          {pillars.map((pillar) => (
            <Card key={pillar.title} className="studio-card animate-enter-up">
              <CardHeader>
                <div className="flex items-center justify-between">
                  <span className="eyebrow">{pillar.label}</span>
                  <span className="flex h-9 w-9 items-center justify-center rounded-md bg-foreground text-background">
                    <pillar.icon className="h-4 w-4" />
                  </span>
                </div>
                <CardTitle className="mt-8 text-xl">{pillar.title}</CardTitle>
                <CardDescription className="leading-relaxed">{pillar.description}</CardDescription>
              </CardHeader>
            </Card>
          ))}
        </div>
      </section>

      <section className="editorial-shell py-12 pb-16">
        <div className="grid gap-6 lg:grid-cols-[0.8fr_1.2fr]">
          <div>
            <p className="eyebrow">Choose your exam</p>
            <h2 className="mt-3 text-3xl font-semibold leading-tight md:text-4xl">Start with the test that matters.</h2>
            <p className="mt-4 max-w-md text-muted-foreground">
              Not applying to one of these?{" "}
              <Link href="/custom" className="font-medium text-primary underline underline-offset-4">
                Build a custom reviewer
              </Link>
              .
            </p>
          </div>
          <div className="grid gap-3 sm:grid-cols-2">
            {STATIC_COLLEGES.map((college, index) => (
              <Link key={college.slug} href={`/colleges/${college.slug}`}>
                <Card className="studio-card h-full animate-enter-up" style={{ animationDelay: `${index * 80}ms` }}>
                  <CardHeader>
                    <span className="eyebrow">0{index + 1}</span>
                    <CardTitle className="mt-5 text-2xl">{college.examName}</CardTitle>
                    <CardDescription>{college.name}</CardDescription>
                  </CardHeader>
                  <CardContent className="flex items-center justify-between text-sm">
                    <span className="text-muted-foreground">{college.subjects.length} sections</span>
                    <span className="inline-flex items-center gap-1 font-medium text-primary">
                      Open <ArrowRight className="h-3.5 w-3.5" />
                    </span>
                  </CardContent>
                </Card>
              </Link>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
