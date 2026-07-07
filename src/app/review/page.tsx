import Link from "next/link";
import { ArrowRight, BookOpen, Layers, Target } from "lucide-react";
import { Card, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";

const panels = [
  {
    href: "/review/flashcards",
    icon: Layers,
    title: "Flashcards",
    description:
      "Active recall for memorization. Flip through cards at your own pace, no time pressure.",
  },
  {
    href: "/review/general",
    icon: BookOpen,
    title: "General Review",
    description:
      "Browse any lesson or module across every subject and practice broadly across topics.",
  },
  {
    href: "/review/exam-focus",
    icon: Target,
    title: "Exam Focus Review",
    description:
      "Pick your target exam and drill only the lessons that exam actually prioritizes.",
  },
];

export default function ReviewHubPage() {
  return (
    <div className="editorial-shell py-14">
      <div className="grid gap-8 border-b border-foreground/15 pb-8 md:grid-cols-[0.7fr_1fr]">
        <p className="eyebrow">Review modes</p>
        <div>
          <h1 className="text-4xl font-semibold leading-tight md:text-6xl">Review</h1>
          <p className="mt-4 max-w-2xl text-muted-foreground">
            Three ways to study, all built around the same lesson library. Pick what fits how you
            want to prepare today.
          </p>
        </div>
      </div>

      <div className="mt-8 grid gap-4 md:grid-cols-3">
        {panels.map((panel, index) => (
          <Link key={panel.href} href={panel.href}>
            <Card
              className="studio-card h-full animate-enter-up"
              style={{ animationDelay: `${index * 90}ms` }}
            >
              <CardHeader>
                <div className="flex items-center justify-between">
                  <span className="eyebrow">0{index + 1}</span>
                  <span className="flex h-9 w-9 items-center justify-center rounded-md bg-foreground text-background">
                    <panel.icon className="h-4 w-4" />
                  </span>
                </div>
                <CardTitle className="mt-8 text-xl">{panel.title}</CardTitle>
                <CardDescription className="leading-relaxed">{panel.description}</CardDescription>
                <span className="mt-2 inline-flex items-center gap-1 text-sm font-medium text-primary">
                  Get started <ArrowRight className="h-3.5 w-3.5" />
                </span>
              </CardHeader>
            </Card>
          </Link>
        ))}
      </div>
    </div>
  );
}
