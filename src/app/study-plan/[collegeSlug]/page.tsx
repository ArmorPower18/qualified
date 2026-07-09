import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { BookOpen, ListChecks, Timer } from "lucide-react";
import { createClient } from "@/lib/supabase/server";
import { getStaticCollege } from "@/lib/colleges-static";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { buttonVariants } from "@/components/ui/button";
import { GenerateStudyPlanButton } from "@/components/generate-study-plan-button";
import { DashboardExamTabs } from "@/components/dashboard-exam-tabs";
import { flattenPlanDays, getPlanDayDate, isSameDay, resolveActivityHref } from "@/lib/study-plan";
import type { StudyPlan, StudyPlanActivity } from "@/lib/types";

const activityIcon = {
  practice: ListChecks,
  review: BookOpen,
  mock: Timer,
} as const;

const HIGHLIGHT_WINDOW_DAYS = 4; // today + the following 3 days

function dayLabel(date: Date, today: Date) {
  if (isSameDay(date, today)) return "Today";
  const diffDays = Math.round((date.getTime() - today.getTime()) / (1000 * 60 * 60 * 24));
  if (diffDays === 1) return "Tomorrow";
  return date.toLocaleDateString(undefined, { weekday: "long", month: "short", day: "numeric" });
}

export default async function StudyPlanPage({
  params,
}: {
  params: Promise<{ collegeSlug: string }>;
}) {
  const { collegeSlug } = await params;
  const college = getStaticCollege(collegeSlug);
  if (!college) notFound();

  const supabase = await createClient();
  const user = await supabase.auth
    .getUser()
    .then(({ data }) => data.user)
    .catch(() => null);
  if (!user) redirect("/login");

  const { data: collegeRow } = await supabase.from("colleges").select("id").eq("slug", collegeSlug).single();
  const collegeId = collegeRow?.id;

  const { data: collegeRows } = await supabase.from("colleges").select("id, slug").eq("is_custom", false);
  const slugToId = Object.fromEntries((collegeRows ?? []).map((c) => [c.slug as string, c.id as string]));

  const { count: attemptCount } = collegeId
    ? await supabase
        .from("mock_test_attempts")
        .select("id", { count: "exact", head: true })
        .eq("user_id", user.id)
        .eq("college_id", collegeId)
        .not("completed_at", "is", null)
    : { count: 0 };

  const { data: planRow } = collegeId
    ? await supabase.from("study_plans").select("*").eq("user_id", user.id).eq("college_id", collegeId).maybeSingle()
    : { data: null };

  const plan = planRow as StudyPlan | null;

  const today = new Date();
  today.setHours(0, 0, 0, 0);
  const flattened = plan ? flattenPlanDays(plan) : [];
  const windowEnd = new Date(today);
  windowEnd.setDate(windowEnd.getDate() + (HIGHLIGHT_WINDOW_DAYS - 1));
  const upcoming = flattened.filter((d) => d.date >= today && d.date <= windowEnd);
  const highlightedDates = new Set(upcoming.map((d) => d.date.toDateString()));

  function ActivityRow({ act }: { act: StudyPlanActivity }) {
    const Icon = activityIcon[act.kind] ?? ListChecks;
    return (
      <Link
        href={resolveActivityHref(act, collegeSlug, college!.subjects)}
        className="flex items-center justify-between gap-3 rounded-lg border border-border p-3 transition-colors hover:border-foreground/30 hover:bg-muted/40"
      >
        <div className="flex min-w-0 items-start gap-2.5">
          <span className="mt-0.5 flex h-7 w-7 shrink-0 items-center justify-center rounded-md bg-muted text-foreground">
            <Icon className="h-3.5 w-3.5" />
          </span>
          <div className="min-w-0">
            <p className="truncate text-sm font-medium">
              {act.title} <span className="text-xs text-muted-foreground">· {act.minutes} min</span>
            </p>
            <p className="truncate text-xs text-muted-foreground">
              {act.subject} — {act.description}
            </p>
          </div>
        </div>
        <span
          className={buttonVariants({ size: "sm", variant: "outline", className: "shrink-0 rounded-lg" })}
        >
          Start
        </span>
      </Link>
    );
  }

  return (
    <div className="editorial-shell max-w-4xl py-10">
      <div className="flex flex-wrap items-end justify-between gap-4 border-b border-foreground/15 pb-6">
        <div>
          <p className="eyebrow">Study plan</p>
          <h1 className="mt-3 text-4xl font-semibold leading-tight md:text-5xl">
            Your {college.examName} study plan
          </h1>
          <p className="mt-3 max-w-2xl text-muted-foreground">
            Built from your pre-test results and subject mastery — prioritizing your weakest areas first.
          </p>
        </div>
        <DashboardExamTabs
          selectedSlug={collegeSlug}
          slugToId={slugToId}
          basePath="/study-plan"
          linkMode="path"
        />
      </div>

      {!attemptCount ? (
        <Card className="studio-card mt-6">
          <CardHeader>
            <CardTitle>Take your pre-test first</CardTitle>
            <CardDescription>
              A study plan needs something to analyze — your free {college.examName} pre-test tells us
              where to focus.
            </CardDescription>
          </CardHeader>
          <CardContent>
            <Link href={`/mock-test/${college.slug}`} className={buttonVariants({ className: "rounded-lg" })}>
              Take the pre-test
            </Link>
          </CardContent>
        </Card>
      ) : !plan ? (
        <Card className="studio-card mt-6">
          <CardHeader>
            <CardTitle>Ready when you are</CardTitle>
            <CardDescription>
              We&apos;ll analyze your subject mastery and exam date, then build a week-by-week plan with
              an AI study agent.
            </CardDescription>
          </CardHeader>
          <CardContent>
            <GenerateStudyPlanButton collegeSlug={college.slug} accent={college.color} />
          </CardContent>
        </Card>
      ) : (
        <div className="mt-6 flex flex-col gap-5">
          <Card
            className="rounded-xl border-2 bg-card"
            style={{ borderColor: `color-mix(in srgb, ${college.color.bg} 40%, transparent)` }}
          >
            <CardHeader>
              <div className="flex flex-wrap items-center justify-between gap-2">
                <CardTitle>Strategy</CardTitle>
                <Badge variant="secondary" className="rounded-full text-xs">
                  Generated {new Date(plan.generated_at).toLocaleDateString()}
                </Badge>
              </div>
              {plan.summary && <CardDescription className="text-foreground/80">{plan.summary}</CardDescription>}
            </CardHeader>
            <CardContent>
              <GenerateStudyPlanButton collegeSlug={college.slug} label="Regenerate plan" accent={college.color} />
            </CardContent>
          </Card>

          {upcoming.length > 0 && (
            <Card
              className="rounded-xl border-2 bg-card"
              style={{ borderColor: `color-mix(in srgb, ${college.color.bg} 40%, transparent)` }}
            >
              <CardHeader>
                <CardTitle>Coming up</CardTitle>
                <CardDescription>Today plus the next {HIGHLIGHT_WINDOW_DAYS - 1} days.</CardDescription>
              </CardHeader>
              <CardContent>
                <div className="flex flex-col gap-4">
                  {upcoming.map((d, i) => (
                    <div key={i}>
                      <div className="flex items-center gap-2">
                        <span
                          className="rounded-md px-2 py-0.5 text-xs font-semibold"
                          style={{
                            backgroundColor: `color-mix(in srgb, ${college.color.bg} 14%, transparent)`,
                            color: college.color.bg,
                          }}
                        >
                          {dayLabel(d.date, today)}
                        </span>
                        <Badge variant="secondary" className="rounded-full text-xs">
                          {d.day.activities.length} activit{d.day.activities.length === 1 ? "y" : "ies"}
                        </Badge>
                      </div>
                      <div className="mt-2 flex flex-col gap-2">
                        {d.day.activities.map((act, ai) => (
                          <ActivityRow key={ai} act={act} />
                        ))}
                      </div>
                    </div>
                  ))}
                </div>
              </CardContent>
            </Card>
          )}

          {plan.weeks.map((week, wi) => (
            <Card key={wi} className="studio-card">
              <CardHeader>
                <div className="flex flex-wrap items-center gap-2">
                  <span
                    className="rounded-md px-2 py-0.5 text-xs font-semibold"
                    style={{
                      backgroundColor: `color-mix(in srgb, ${college.color.bg} 14%, transparent)`,
                      color: college.color.bg,
                    }}
                  >
                    {week.label}
                  </span>
                  <CardTitle className="text-base">{week.focus}</CardTitle>
                </div>
              </CardHeader>
              <CardContent>
                <div className="flex flex-col gap-3">
                  {week.days.map((day, di) => {
                    const date = getPlanDayDate(plan.generated_at, wi, day.day);
                    const isHighlighted = date ? highlightedDates.has(date.toDateString()) : false;
                    return (
                      <div
                        key={di}
                        className={
                          isHighlighted
                            ? "rounded-lg border-2 p-3"
                            : "rounded-lg border border-border p-3"
                        }
                        style={
                          isHighlighted
                            ? { borderColor: `color-mix(in srgb, ${college.color.bg} 45%, transparent)` }
                            : undefined
                        }
                      >
                        <div className="flex items-center gap-2">
                          <p className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                            {day.day}
                          </p>
                          {date && isSameDay(date, today) && (
                            <Badge className="rounded-full text-[0.65rem]">Today</Badge>
                          )}
                        </div>
                        <div className="mt-2 flex flex-col gap-2">
                          {day.activities.map((act, ai) => {
                            const Icon = activityIcon[act.kind] ?? ListChecks;
                            return (
                              <div key={ai} className="flex items-start gap-2.5">
                                <span className="mt-0.5 flex h-6 w-6 shrink-0 items-center justify-center rounded-md bg-muted text-foreground">
                                  <Icon className="h-3.5 w-3.5" />
                                </span>
                                <div>
                                  <p className="text-sm font-medium">
                                    {act.title} <span className="text-xs text-muted-foreground">· {act.minutes} min</span>
                                  </p>
                                  <p className="text-xs text-muted-foreground">
                                    {act.subject} — {act.description}
                                  </p>
                                </div>
                              </div>
                            );
                          })}
                        </div>
                      </div>
                    );
                  })}
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      )}
    </div>
  );
}
