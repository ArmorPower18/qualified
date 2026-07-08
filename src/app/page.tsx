import Link from "next/link";
import Image from "next/image";
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
    tags: ["Section countdown", "Auto-submit"],
  },
  {
    icon: Layers,
    label: "02",
    title: "Focused review loops",
    description: "Practice questions, flashcards, and explanations organized by lesson.",
    tags: ["General Review", "Exam Focus"],
  },
  {
    icon: LineChart,
    label: "03",
    title: "Visible progress",
    description: "Track accuracy patterns so the next study session has a clear target.",
    tags: ["Subject mastery", "Time studied"],
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
                <div className="grid sm:grid-cols-2 sm:min-h-[28rem]">
                  <div className="border-b border-foreground/15 p-6 sm:border-r sm:border-b-0">
                    <p className="eyebrow">Active session</p>
                    <p className="mt-4 text-6xl font-semibold tracking-normal">84%</p>
                    <p className="mt-2 text-sm text-muted-foreground">Reading accuracy</p>
                    <div className="mt-8 space-y-4 border-t border-foreground/15 pt-6">
                      {[
                        { label: "Math accuracy", value: 76 },
                        { label: "Science accuracy", value: 68 },
                      ].map((stat, index) => (
                        <div key={stat.label}>
                          <div className="flex items-center justify-between text-xs text-muted-foreground">
                            <span>{stat.label}</span>
                            <span className="font-medium text-foreground">{stat.value}%</span>
                          </div>
                          <div className="mt-2 h-1.5 bg-muted">
                            <div
                              className="h-full bg-foreground animate-line-reveal"
                              style={{ width: `${stat.value}%`, animationDelay: `${index * 120 + 420}ms` }}
                            />
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                  <div className="flex flex-col p-6">
                    <p className="eyebrow">Next block</p>
                    <p className="mt-4 text-xl font-semibold leading-tight sm:text-2xl">Science drills</p>
                    <div className="mt-6 space-y-2.5">
                      {[72, 48, 86].map((width, index) => (
                        <div key={index} className="h-2 bg-muted">
                          <div
                            className="h-full bg-foreground animate-line-reveal"
                            style={{ width: `${width}%`, animationDelay: `${index * 120 + 300}ms` }}
                          />
                        </div>
                      ))}
                    </div>
                    <div className="mt-8 flex-1 space-y-4 border-t border-foreground/15 pt-6 text-sm">
                      <div className="flex items-center justify-between">
                        <span className="text-muted-foreground">Study streak</span>
                        <span className="font-medium">4 days</span>
                      </div>
                      <div className="flex items-center justify-between">
                        <span className="text-muted-foreground">Flashcards reviewed</span>
                        <span className="font-medium">128</span>
                      </div>
                      <div className="flex items-center justify-between">
                        <span className="text-muted-foreground">Mock tests taken</span>
                        <span className="font-medium">3</span>
                      </div>
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

      <section className="editorial-shell py-10">
        <div className="grid gap-6 border-b border-foreground/15 pb-6 md:grid-cols-[0.5fr_1fr]">
          <p className="eyebrow">Study system</p>
          <h2 className="text-3xl font-semibold leading-tight md:text-4xl">
            A cleaner path from review material to measurable readiness.
          </h2>
        </div>
        <div className="mt-6 grid gap-4 md:grid-cols-3">
          {pillars.map((pillar) => (
            <Card key={pillar.title} className="studio-card animate-enter-up flex h-full flex-col">
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
              <CardContent className="mt-auto flex flex-wrap gap-2 border-t border-foreground/15 pt-4">
                {pillar.tags.map((tag) => (
                  <span
                    key={tag}
                    className="rounded-full border border-foreground/15 bg-background px-2.5 py-1 text-xs font-medium text-muted-foreground"
                  >
                    {tag}
                  </span>
                ))}
              </CardContent>
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
                <Card
                  className="studio-card flex h-full flex-col animate-enter-up"
                  style={{ animationDelay: `${index * 80}ms` }}
                >
                  <CardHeader className="pb-1">
                    <div className="flex items-start justify-between mb-6">
                      <span className="eyebrow !tracking-normal">0{index + 1}</span>
                      <Image
                        src={college.logo}
                        alt={`${college.name} seal`}
                        width={72}
                        height={72}
                        className="h-18 w-18 object-contain -mt-2"
                      />
                    </div>
                    <CardTitle className="text-2xl pr-16 -mt-10">{college.examName}</CardTitle>
                    <CardDescription className="pr-16 min-h-[2.5rem]">{college.name}</CardDescription>
                  </CardHeader>
                  <div className="border-t border-foreground/15 mx-6" />
                  <div className="flex flex-wrap gap-2 px-6 pt-2.5">
                    {college.subjects.map((subject) => (
                      <span
                        key={subject.slug}
                        className="rounded-full border border-foreground/15 bg-background px-2.5 py-1 text-xs font-medium text-muted-foreground"
                      >
                        {subject.name}
                      </span>
                    ))}
                  </div>
                  <div className="mt-auto flex items-center justify-between px-6 pb-5 pt-3 text-sm">
                    <span className="text-muted-foreground">{college.subjects.length} sections</span>
                    <span className="inline-flex items-center gap-1 font-medium text-primary">
                      Open <ArrowRight className="h-3.5 w-3.5" />
                    </span>
                  </div>
                </Card>
              </Link>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
