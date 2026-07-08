import Link from "next/link";
import { ArrowRight, BookOpen, Layers, Target, PlayCircle } from "lucide-react";
import { Card, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";

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
  {
    href: null,
    icon: PlayCircle,
    title: "Articles & Videos",
    description: "Written explainers and video lessons for every subject. Coming soon.",
  },
];

export default function ReviewHubPage() {
  return (
    <div className="editorial-shell py-14">
      <div className="mb-8 border-b border-foreground/15 pb-6">
        <p className="eyebrow">Review modes</p>
        <h1 className="mt-2 text-4xl font-semibold leading-tight">Review</h1>
        <p className="mt-2 max-w-2xl text-sm text-muted-foreground">
          Three ways to study, all built around the same lesson library.
        </p>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        {panels.map((panel, index) => {
          const card = (
            <Card
              className={`studio-card h-full flex flex-col animate-enter-up ${
                panel.href ? "" : "opacity-70 hover:-translate-y-0 hover:shadow-none"
              }`}
              style={{ animationDelay: `${index * 90}ms` }}
            >
              <CardHeader>
                <div className="flex items-center justify-between mb-6">
                  <span className="eyebrow">0{index + 1}</span>
                  <span
                    className={`flex h-9 w-9 items-center justify-center rounded-lg ${
                      panel.href ? "bg-foreground text-background" : "bg-muted text-muted-foreground"
                    }`}
                  >
                    <panel.icon className="h-4.5 w-4.5" />
                  </span>
                </div>
                <CardTitle className="text-xl">{panel.title}</CardTitle>
                <CardDescription className="mt-2 leading-relaxed min-h-[3rem]">{panel.description}</CardDescription>
                {panel.href ? (
                  <span className="mt-4 inline-flex items-center gap-1 text-sm font-medium text-primary">
                    Get started <ArrowRight className="h-3.5 w-3.5" />
                  </span>
                ) : (
                  <Badge variant="secondary" className="mt-4 w-fit rounded-full">
                    Coming soon
                  </Badge>
                )}
              </CardHeader>
            </Card>
          );

          return panel.href ? (
            <Link key={panel.title} href={panel.href}>
              {card}
            </Link>
          ) : (
            <div key={panel.title} aria-disabled="true">
              {card}
            </div>
          );
        })}
      </div>
    </div>
  );
}
