import Link from "next/link";
import { ArrowRight, Check, Sparkles, Timer, Target } from "lucide-react";
import { buttonVariants } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";

const highlights = [
  {
    icon: Sparkles,
    title: "4 exam tracks, free",
    description: "UPCAT, ACET, DCAT, and USTET — lessons, articles, and practice questions for every school, always free.",
  },
  {
    icon: Timer,
    title: "Scheduled mock tests",
    description: "Pro gets 2 full-length mock tests a month. Season Pass gets 4 — timed, reviewed, and tracked.",
  },
  {
    icon: Target,
    title: "AI that studies with you",
    description: "A personalized reviewer, tutor, and question generator built from your own mastery data.",
  },
];

const freeFeatures = [
  "All 4 exam tracks — UPCAT, ACET, DCAT, USTET",
  "Videos & articles for every lesson",
  "Full practice question bank",
  "Flashcards (20 cards/day)",
  "Mastery tracking across all subjects",
  "2 mock test attempts per college",
];

const freeLocked = [
  "2 full-length mock tests/month",
  "AI study tutor & explanations",
  "AI-personalized reviewer",
  "Custom study pack generation",
];

const proFeatures = [
  "Everything in Free, ad-free",
  "2 full-length mock tests per month",
  "Unlimited flashcards with spaced repetition",
  "AI study tutor — explanations for every question",
  "AI-personalized reviewer from your mastery data",
  "Hybrid AI question generation for your weak areas",
  "3 AI custom study packs/month — any school, incl. Big 4",
];

const seasonPassFeatures = [
  "Everything in Pro",
  "4 full-length mock tests per month",
  "Unlimited AI custom study packs",
  "Locked-in 20% discount for all 4 months",
  "Early access to new colleges & features",
];

export default function PricingPage() {
  return (
    <div className="overflow-hidden">
      <section className="border-b border-foreground/15">
        <div className="editorial-shell py-10 lg:py-14">
          <div className="flex justify-center">
            <Badge variant="outline" className="gap-1.5 rounded-full border-foreground/20 px-3 py-1 text-[0.7rem] uppercase tracking-[0.14em]">
              <Sparkles className="h-3 w-3" />
              Qualified Pro
            </Badge>
          </div>
          <h1 className="mt-6 text-balance text-center text-4xl font-semibold leading-[1.05] text-foreground sm:text-5xl md:text-6xl">
            Prep for every school
            <br />
            you&apos;re applying to.
          </h1>
          <p className="mx-auto mt-5 max-w-2xl text-balance text-center text-base leading-7 text-muted-foreground md:text-lg">
            Lessons, articles, and practice questions stay free — for all four colleges, always.
            Pro unlocks unlimited mocks, an AI study tutor, and personalized review built from
            your own mastery data.
          </p>

          <div className="mt-10 grid gap-3 sm:grid-cols-3">
            {highlights.map(({ icon: Icon, title, description }) => (
              <div key={title} className="rounded-xl border border-foreground/15 bg-card p-4">
                <div className="flex items-center gap-2">
                  <span className="flex h-7 w-7 items-center justify-center rounded-lg bg-primary/10 text-primary">
                    <Icon className="h-3.5 w-3.5" />
                  </span>
                  <p className="text-sm font-medium text-foreground">{title}</p>
                </div>
                <p className="mt-2 text-xs leading-5 text-muted-foreground">{description}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      <section className="editorial-shell py-10 lg:py-14">
        <div className="grid gap-5 lg:grid-cols-3 lg:items-stretch">
          {/* Free */}
          <div className="flex flex-col rounded-2xl border border-foreground/15 bg-card p-6">
            <p className="text-lg font-semibold text-foreground">Free</p>
            <p className="mt-1 text-sm text-muted-foreground">Everything you need to start, for every school.</p>
            <div className="mt-6 flex items-baseline gap-1">
              <span className="text-4xl font-semibold text-foreground">₱0</span>
            </div>
            <p className="text-xs text-muted-foreground">forever</p>

            <ul className="mt-6 flex flex-1 flex-col gap-2.5">
              {freeFeatures.map((f) => (
                <li key={f} className="flex items-start gap-2 text-sm text-foreground">
                  <Check className="mt-0.5 h-4 w-4 shrink-0 text-primary" />
                  {f}
                </li>
              ))}
              {freeLocked.map((f) => (
                <li key={f} className="flex items-start gap-2 text-sm text-muted-foreground/60">
                  <span className="mt-0.5 flex h-4 w-4 shrink-0 items-center justify-center text-muted-foreground/40">×</span>
                  {f}
                </li>
              ))}
            </ul>

            <Link
              href="/signup"
              className={buttonVariants({ variant: "outline", size: "lg", className: "mt-6 w-full rounded-md" })}
            >
              Start for free
            </Link>
          </div>

          {/* Pro */}
          <div className="relative flex flex-col rounded-2xl border-2 border-primary bg-card p-6 shadow-[0_0_0_4px_color-mix(in_oklch,var(--primary),transparent_92%)]">
            <div className="absolute -top-3 left-1/2 -translate-x-1/2">
              <Badge className="rounded-full px-3 py-1 text-[0.7rem] uppercase tracking-[0.1em]">
                3-day free trial
              </Badge>
            </div>
            <p className="text-lg font-semibold text-foreground">Pro</p>
            <p className="mt-1 text-sm text-muted-foreground">All schools, scheduled mocks, AI-powered.</p>
            <div className="mt-6 flex items-baseline gap-1">
              <span className="text-4xl font-semibold text-foreground">₱499</span>
              <span className="text-sm text-muted-foreground">/month</span>
            </div>
            <p className="text-xs text-muted-foreground">per month</p>

            <ul className="mt-6 flex flex-1 flex-col gap-2.5">
              {proFeatures.map((f) => (
                <li key={f} className="flex items-start gap-2 text-sm text-foreground">
                  <Check className="mt-0.5 h-4 w-4 shrink-0 text-primary" />
                  {f}
                </li>
              ))}
            </ul>

            <Link
              href="/signup?plan=pro"
              className={buttonVariants({ size: "lg", className: "mt-6 w-full rounded-md" })}
            >
              Start your free trial
              <ArrowRight className="ml-1 h-4 w-4" />
            </Link>
            <p className="mt-2 text-center text-xs text-muted-foreground">
              3 days free, then ₱499/month. Cancel anytime.
            </p>
          </div>

          {/* Season Pass */}
          <div className="relative flex flex-col rounded-2xl border border-foreground/15 bg-card p-6">
            <div className="absolute -top-3 left-1/2 -translate-x-1/2">
              <Badge variant="secondary" className="rounded-full px-3 py-1 text-[0.7rem] uppercase tracking-[0.1em]">
                Best deal
              </Badge>
            </div>
            <p className="text-lg font-semibold text-foreground">Season Pass</p>
            <p className="mt-1 text-sm text-muted-foreground">4 months of Pro, more features, one payment.</p>
            <div className="mt-6 flex items-baseline gap-1">
              <span className="text-4xl font-semibold text-foreground">₱1,599</span>
            </div>
            <p className="text-xs text-muted-foreground">for 4 months · 20% off</p>

            <ul className="mt-6 flex flex-1 flex-col gap-2.5">
              {seasonPassFeatures.map((f) => (
                <li key={f} className="flex items-start gap-2 text-sm text-foreground">
                  <Check className="mt-0.5 h-4 w-4 shrink-0 text-primary" />
                  {f}
                </li>
              ))}
            </ul>

            <Link
              href="/signup?plan=season-pass"
              className={buttonVariants({ variant: "outline", size: "lg", className: "mt-6 w-full rounded-md" })}
            >
              Get the Season Pass
              <ArrowRight className="ml-1 h-4 w-4" />
            </Link>
            <p className="mt-2 text-center text-xs text-muted-foreground">
              One payment. Covers 4 months — 20% off for more features than Pro.
            </p>
          </div>
        </div>

        <div className="mt-6 flex flex-col items-center justify-between gap-3 rounded-xl border border-foreground/15 bg-card px-5 py-4 sm:flex-row">
          <p className="text-sm text-muted-foreground">
            Not ready yet? Keep using free lessons and your two starter mocks per college while you decide.
          </p>
          <Link href="/signup" className="text-sm font-medium text-primary hover:underline">
            No card needed for Free →
          </Link>
        </div>
      </section>
    </div>
  );
}
