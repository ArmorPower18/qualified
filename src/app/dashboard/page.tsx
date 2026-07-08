import Link from "next/link";
import { redirect } from "next/navigation";
import {
  ArrowRight,
  BellRing,
  BookOpenCheck,
  CalendarClock,
  CheckCircle2,
  ClipboardList,
  Sparkles,
  Timer,
  Trophy,
} from "lucide-react";
import { createClient } from "@/lib/supabase/server";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { buttonVariants } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { MasteryChart } from "@/components/mastery-chart";
import { DashboardExamTabs } from "@/components/dashboard-exam-tabs";
import { DashboardTestDate } from "@/components/dashboard-test-date";
import { GenerateStudyPlanButton } from "@/components/generate-study-plan-button";
import { STATIC_COLLEGES, getStaticCollege } from "@/lib/colleges-static";
import { flattenPlanDays, isSameDay, resolveActivityHref } from "@/lib/study-plan";
import type { MockTestAttempt, ReviewAttempt, QuestionAttempt, StudyPlan, TargetExam } from "@/lib/types";

const modeLabels: Record<ReviewAttempt["mode"], string> = {
  flashcard: "Flashcards",
  general: "General Review",
  exam_focus: "Exam Focus Review",
};

const EXAM_NAME_TO_SLUG: Record<TargetExam, string> = {
  UPCAT: "up",
  ACET: "admu",
  DCAT: "dlsu",
  USTET: "ust",
};

function formatDuration(totalSeconds: number) {
  const hours = Math.floor(totalSeconds / 3600);
  const minutes = Math.round((totalSeconds % 3600) / 60);
  if (hours === 0 && minutes === 0) return "< 1m";
  if (hours === 0) return `${minutes}m`;
  return `${hours}h ${minutes}m`;
}

function StatTile({
  icon: Icon,
  label,
  value,
  hint,
  accent,
}: {
  icon: typeof Timer;
  label: string;
  value: string;
  hint?: string;
  accent: string;
}) {
  return (
    <Card className="studio-card">
      <CardContent className="flex items-start justify-between gap-3">
        <div>
          <p className="text-sm text-muted-foreground">{label}</p>
          <p className="mt-1.5 text-3xl font-semibold">{value}</p>
          {hint && <p className="mt-1 text-xs text-muted-foreground">{hint}</p>}
        </div>
        <span
          className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg"
          style={{ backgroundColor: `color-mix(in srgb, ${accent} 14%, transparent)`, color: accent }}
        >
          <Icon className="h-4.5 w-4.5" />
        </span>
      </CardContent>
    </Card>
  );
}

export default async function DashboardPage({
  searchParams,
}: {
  searchParams: Promise<{ exam?: string }>;
}) {
  const { exam: examParam } = await searchParams;
  const supabase = await createClient();
  const user = await supabase.auth
    .getUser()
    .then(({ data }) => data.user)
    .catch(() => null);

  if (!user) redirect("/login");

  const [{ data: profile }, { data: onboarding }, { data: collegeRows }] = await Promise.all([
    supabase.from("profiles").select("target_college_id").eq("id", user.id).maybeSingle(),
    supabase.from("onboarding_responses").select("target_exams").eq("user_id", user.id).maybeSingle(),
    supabase.from("colleges").select("id, slug").eq("is_custom", false),
  ]);

  const idToSlug = new Map((collegeRows ?? []).map((c) => [c.id as string, c.slug as string]));
  const slugToId = new Map((collegeRows ?? []).map((c) => [c.slug as string, c.id as string]));

  let selectedSlug =
    examParam && STATIC_COLLEGES.some((c) => c.slug === examParam) ? examParam : undefined;
  if (!selectedSlug && profile?.target_college_id) {
    selectedSlug = idToSlug.get(profile.target_college_id);
  }
  if (!selectedSlug && onboarding?.target_exams?.length) {
    selectedSlug = EXAM_NAME_TO_SLUG[onboarding.target_exams[0] as TargetExam];
  }
  if (!selectedSlug) selectedSlug = "up";

  const selectedCollege = getStaticCollege(selectedSlug) ?? STATIC_COLLEGES[0];
  const selectedCollegeId = slugToId.get(selectedSlug) ?? null;

  // Test date is per-exam, not per-user — each college gets its own row so
  // setting UPCAT's date doesn't overwrite ACET's.
  const { data: examTestDate } = selectedCollegeId
    ? await supabase
        .from("exam_test_dates")
        .select("test_date")
        .eq("user_id", user.id)
        .eq("college_id", selectedCollegeId)
        .maybeSingle()
    : { data: null };

  const { data: attempts } = await supabase
    .from("mock_test_attempts")
    .select("*")
    .eq("user_id", user.id)
    .eq("college_id", selectedCollegeId)
    .not("completed_at", "is", null)
    .order("completed_at", { ascending: true });

  const typedAttempts = (attempts as MockTestAttempt[]) ?? [];
  const testsCompleted = typedAttempts.length;
  const totalQuestionsAnswered = typedAttempts.reduce((sum, a) => sum + (a.total_questions ?? 0), 0);
  const totalScore = typedAttempts.reduce((sum, a) => sum + (a.score ?? 0), 0);
  const averageScorePct = totalQuestionsAnswered > 0 ? Math.round((totalScore / totalQuestionsAnswered) * 100) : 0;

  const { data: reviewAttempts } = await supabase
    .from("review_attempts")
    .select("*")
    .eq("user_id", user.id)
    .order("completed_at", { ascending: false });

  const typedReviewAttempts = (reviewAttempts as ReviewAttempt[]) ?? [];
  const totalStudySeconds = typedReviewAttempts.reduce((sum, a) => sum + (a.duration_seconds ?? 0), 0);

  const { data: studyPlanRow } = selectedCollegeId
    ? await supabase
        .from("study_plans")
        .select("id, summary, generated_at, weeks")
        .eq("user_id", user.id)
        .eq("college_id", selectedCollegeId)
        .maybeSingle()
    : { data: null };
  const studyPlan = studyPlanRow as StudyPlan | null;

  const todaysFocus = studyPlan
    ? flattenPlanDays(studyPlan).find((d) => isSameDay(d.date, new Date()))
    : undefined;

  // Subject mastery: accuracy per subject from practice + review questions only.
  // Flashcards never write to question_attempts (self-reported, not graded), so they're
  // excluded automatically. This spans every exam a student has practiced, not just the
  // one currently focused in the tabs above.
  const { data: questionAttempts } = await supabase
    .from("question_attempts")
    .select("*")
    .eq("user_id", user.id);

  const typedQuestionAttempts = (questionAttempts as QuestionAttempt[]) ?? [];
  const masteryBySubject = new Map<string, { correct: number; total: number }>();
  for (const a of typedQuestionAttempts) {
    const bucket = masteryBySubject.get(a.subject_label) ?? { correct: 0, total: 0 };
    bucket.total += 1;
    if (a.is_correct) bucket.correct += 1;
    masteryBySubject.set(a.subject_label, bucket);
  }
  // Confidence Factor: dampens mastery for low-volume subjects so a 3-question
  // quiz can't read as 100% mastery. CF = N / (N + K); raw accuracy is scaled by
  // it, so mastery only climbs toward the raw score once a subject has enough
  // attempts behind it (CF -> 1 as N grows). K=5 is the reliability constant.
  const RELIABILITY_CONSTANT = 5;
  const subjectMastery = Array.from(masteryBySubject.entries())
    .map(([subject, { correct, total }]) => {
      const rawPct = Math.round((correct / total) * 100);
      const confidence = total / (total + RELIABILITY_CONSTANT);
      return {
        subject,
        correct,
        total,
        rawPct,
        pct: Math.round(rawPct * confidence),
      };
    })
    .sort((a, b) => b.total - a.total);

  const weakestSubjects = subjectMastery
    .slice()
    .sort((a, b) => a.pct - b.pct)
    .slice(0, 2);

  // Countdown to this exam's test date (editable inline, one per college); no
  // fabricated default — an empty state prompts them to set one.
  const testDate = examTestDate?.test_date ? new Date(`${examTestDate.test_date}T00:00:00`) : null;
  // Server Components render fresh per request rather than being memoized, so reading
  // the current time here doesn't create the staleness the purity rule guards against.
  // eslint-disable-next-line react-hooks/purity
  const now = Date.now();
  const daysRemaining = testDate ? Math.ceil((testDate.getTime() - now) / (1000 * 60 * 60 * 24)) : null;

  const displayName = (() => {
    const local = user.email?.split("@")[0] ?? "there";
    const first = local.split(/[._\-+0-9]/).filter(Boolean)[0] ?? local;
    return first.charAt(0).toUpperCase() + first.slice(1);
  })();

  // Next milestone: a small, honestly-computed nudge rather than a fabricated plan.
  // Baseline first (need >=3 attempts for a reliable average), then the weakest
  // tracked subject, then a generic "stay sharp" nudge once both are healthy.
  const milestone = (() => {
    if (testsCompleted < 3) {
      const remaining = 3 - testsCompleted;
      return {
        title: "Build a three-test baseline",
        description: `Complete ${remaining} more mock test${remaining === 1 ? "" : "s"} to see a more reliable average.`,
        progress: Math.round((testsCompleted / 3) * 100),
      };
    }
    const weakest = weakestSubjects[0];
    if (weakest && weakest.pct < 70) {
      return {
        title: `Push ${weakest.subject} past 70%`,
        description: `You're at ${weakest.pct}% there — keep practicing to close the gap.`,
        progress: Math.round((weakest.pct / 70) * 100),
      };
    }
    return {
      title: "Keep the streak going",
      description: "You're on track across every tracked subject — take another mock test to stay sharp.",
      progress: 100,
    };
  })();

  return (
    <div className="editorial-shell max-w-4xl py-10">
      <div className="flex flex-wrap items-end justify-between gap-4 border-b border-foreground/15 pb-6">
        <div>
          <p className="eyebrow">Progress</p>
          <h1 className="mt-3 text-4xl font-semibold leading-tight md:text-5xl">
            Good to see you, {displayName}.
          </h1>
          <p className="mt-3 max-w-2xl text-muted-foreground">
            Choose an exam, then take one useful step forward.
          </p>
        </div>
        <DashboardExamTabs selectedSlug={selectedSlug} slugToId={Object.fromEntries(slugToId)} />
      </div>

      {/* Focus hero — tinted with the selected school's brand color */}
      <div
        className="mt-6 grid gap-5 overflow-hidden rounded-xl md:grid-cols-[1.4fr_1fr]"
        style={{ backgroundColor: selectedCollege.color.bg, color: selectedCollege.color.fg }}
      >
        <div className="p-6 md:p-8">
          <p className="eyebrow" style={{ color: `color-mix(in srgb, ${selectedCollege.color.fg} 60%, transparent)` }}>
            Focusing on {selectedCollege.examName}
          </p>
          <h2 className="mt-3 text-3xl font-semibold leading-tight md:text-4xl">
            {daysRemaining !== null
              ? daysRemaining >= 0
                ? `${daysRemaining} day${daysRemaining === 1 ? "" : "s"} to turn preparation into confidence.`
                : "Test day has passed — log it and set your next one."
              : "Set a test date to start your countdown."}
          </h2>
          <p className="mt-3 max-w-md text-sm" style={{ color: `color-mix(in srgb, ${selectedCollege.color.fg} 75%, transparent)` }}>
            {selectedCollege.description}, organized into questions, lessons, and realistic mock tests.
          </p>
          <div className="mt-5 flex flex-wrap gap-3">
            <Link
              href={`/colleges/${selectedCollege.slug}`}
              className={buttonVariants({ className: "rounded-lg border-transparent hover:opacity-90" })}
              style={{ backgroundColor: selectedCollege.color.fg, color: selectedCollege.color.bg }}
            >
              Start a study session
            </Link>
            <Link
              href={`/mock-test/${selectedCollege.slug}`}
              className="inline-flex items-center gap-1.5 rounded-lg px-2.5 py-1.5 text-sm font-medium transition-opacity hover:opacity-80"
              style={{
                backgroundColor: `color-mix(in srgb, ${selectedCollege.color.fg} 16%, transparent)`,
                color: selectedCollege.color.fg,
              }}
            >
              Browse mock tests <ArrowRight className="h-3.5 w-3.5" />
            </Link>
          </div>
        </div>
        <div
          className="flex flex-col justify-between gap-6 p-6 md:p-8"
          style={{ borderTop: `1px solid color-mix(in srgb, ${selectedCollege.color.fg} 15%, transparent)` }}
        >
          <div>
            <p
              className="flex items-center gap-1.5 text-xs font-medium"
              style={{ color: `color-mix(in srgb, ${selectedCollege.color.fg} 60%, transparent)` }}
            >
              <CalendarClock className="h-3.5 w-3.5" /> {selectedCollege.examName} test date
            </p>
            <p className="mt-2 text-xl font-semibold">
              {testDate
                ? testDate.toLocaleDateString(undefined, { month: "long", day: "numeric", year: "numeric" })
                : "Not set yet"}
            </p>
            <div className="mt-4">
              <DashboardTestDate
                initialDate={examTestDate?.test_date ?? null}
                collegeId={selectedCollegeId}
                accent={selectedCollege.color}
              />
            </div>
          </div>
          {daysRemaining !== null && daysRemaining >= 0 && (
            <div
              className="flex items-center gap-3 rounded-lg px-4 py-3"
              style={{ backgroundColor: `color-mix(in srgb, ${selectedCollege.color.fg} 12%, transparent)` }}
            >
              <Timer className="h-4 w-4" style={{ color: `color-mix(in srgb, ${selectedCollege.color.fg} 70%, transparent)` }} />
              <div>
                <p className="text-xs" style={{ color: `color-mix(in srgb, ${selectedCollege.color.fg} 60%, transparent)` }}>
                  Countdown
                </p>
                <p className="text-lg font-semibold">{daysRemaining} days remaining</p>
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Stat tiles */}
      <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <StatTile
          icon={CheckCircle2}
          label="Tests completed"
          value={String(testsCompleted)}
          hint={`${selectedCollege.examName} mock tests submitted`}
          accent={selectedCollege.color.bg}
        />
        <StatTile
          icon={Trophy}
          label="Average score"
          value={testsCompleted > 0 ? `${averageScorePct}%` : "—"}
          hint={`Across ${selectedCollege.examName} attempts`}
          accent={selectedCollege.color.bg}
        />
        <StatTile
          icon={BookOpenCheck}
          label="Questions answered"
          value={String(totalQuestionsAnswered)}
          hint={`${selectedCollege.examName} mock tests`}
          accent={selectedCollege.color.bg}
        />
        <StatTile
          icon={ClipboardList}
          label="Current exam"
          value={selectedCollege.examName}
          hint={selectedCollege.name}
          accent={selectedCollege.color.bg}
        />
      </div>

      {/* Mastery + time studied */}
      <div className="mt-6 grid gap-5 md:grid-cols-[1.3fr_0.7fr]">
        <Card className="studio-card">
          <CardHeader>
            <CardTitle>Subject mastery</CardTitle>
            <CardDescription>
              Accuracy from practice questions and review sessions, confidence-adjusted so a
              handful of questions can&apos;t read as full mastery (Flashcards don&apos;t count —
              they&apos;re self-graded, not scored).
            </CardDescription>
          </CardHeader>
          <CardContent>
            {subjectMastery.length === 0 ? (
              <p className="text-sm text-muted-foreground">
                Answer some practice or review questions to see your accuracy by subject here.
              </p>
            ) : (
              <div className="flex flex-col gap-4">
                {subjectMastery.map((s) => (
                  <div key={s.subject}>
                    <div className="flex items-center justify-between text-sm">
                      <span className="font-medium">{s.subject}</span>
                      <span className="text-muted-foreground">
                        {s.correct}/{s.total} correct · {s.pct}% mastery
                        {s.pct !== s.rawPct && ` (${s.rawPct}% raw)`}
                      </span>
                    </div>
                    <Progress value={s.pct} className="mt-1.5" />
                  </div>
                ))}
              </div>
            )}
          </CardContent>
        </Card>

        <Card className="studio-card">
          <CardHeader>
            <CardTitle>Time studied</CardTitle>
            <CardDescription>Across all review sessions</CardDescription>
          </CardHeader>
          <CardContent>
            <p className="text-4xl font-semibold text-primary">{formatDuration(totalStudySeconds)}</p>
            <p className="mt-1 text-sm text-muted-foreground">
              {typedReviewAttempts.length} session{typedReviewAttempts.length === 1 ? "" : "s"} completed
            </p>
          </CardContent>
        </Card>
      </div>

      {/* Study plan */}
      {testsCompleted > 0 && (
        <Card
          className="mt-6 rounded-xl border-2 bg-card"
          style={{ borderColor: `color-mix(in srgb, ${selectedCollege.color.bg} 30%, transparent)` }}
        >
          <CardContent className="flex flex-wrap items-center justify-between gap-4">
            <div className="flex items-start gap-3">
              <span
                className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg"
                style={{
                  backgroundColor: `color-mix(in srgb, ${selectedCollege.color.bg} 14%, transparent)`,
                  color: selectedCollege.color.bg,
                }}
              >
                <Sparkles className="h-4.5 w-4.5" />
              </span>
              <div>
                <p className="font-semibold">
                  {studyPlan ? `Your ${selectedCollege.examName} study plan` : "Build your study plan"}
                </p>
                <p className="mt-0.5 max-w-md text-sm text-muted-foreground">
                  {studyPlan
                    ? (studyPlan.summary ?? `Updated ${new Date(studyPlan.generated_at).toLocaleDateString()}.`)
                    : "AI-built from your pre-test results and weakest subjects, paced against your test date."}
                </p>
              </div>
            </div>
            {studyPlan ? (
              <Link
                href={`/study-plan/${selectedCollege.slug}`}
                className={buttonVariants({ variant: "outline", className: "shrink-0 rounded-lg" })}
              >
                View plan
              </Link>
            ) : (
              <GenerateStudyPlanButton collegeSlug={selectedCollege.slug} accent={selectedCollege.color} />
            )}
          </CardContent>
        </Card>
      )}

      {/* Today's focus, pulled from the study plan */}
      {studyPlan && (
        <Card className="studio-card mt-6">
          <CardHeader>
            <div className="flex flex-wrap items-center justify-between gap-2">
              <div>
                <p className="eyebrow">Study plan</p>
                <CardTitle className="mt-1 text-xl">Today&apos;s focus</CardTitle>
              </div>
              <Link href={`/study-plan/${selectedCollege.slug}`} className={buttonVariants({ variant: "outline", size: "sm", className: "rounded-lg" })}>
                Full plan <ArrowRight className="h-3.5 w-3.5" />
              </Link>
            </div>
            <CardDescription>
              {todaysFocus ? todaysFocus.weekFocus : "Nothing scheduled for today — check the full plan for what's next."}
            </CardDescription>
          </CardHeader>
          {todaysFocus && (
            <CardContent>
              <div className="flex flex-col gap-3">
                {todaysFocus.day.activities.map((act, i) => (
                  <Link
                    key={i}
                    href={resolveActivityHref(act, selectedCollege.slug, selectedCollege.subjects)}
                    className="flex items-center justify-between gap-3 rounded-lg border border-border p-3 transition-colors hover:border-foreground/30 hover:bg-muted/40"
                  >
                    <div className="min-w-0">
                      <div className="flex items-center gap-2">
                        <Badge variant="secondary" className="rounded-full text-[0.65rem] capitalize">
                          {act.kind}
                        </Badge>
                        <span className="text-xs text-muted-foreground">{act.minutes} min</span>
                      </div>
                      <p className="mt-1 truncate text-sm font-medium">{act.title}</p>
                      <p className="truncate text-xs text-muted-foreground">
                        {act.subject} — {act.description}
                      </p>
                    </div>
                    <span
                      className={buttonVariants({ size: "sm", className: "shrink-0 rounded-lg border-transparent" })}
                      style={{ backgroundColor: selectedCollege.color.bg, color: selectedCollege.color.fg }}
                    >
                      Start
                    </span>
                  </Link>
                ))}
              </div>
            </CardContent>
          )}
        </Card>
      )}

      {/* Focus areas + milestone */}
      <div className="mt-6 grid gap-5 md:grid-cols-[1.3fr_0.7fr]">
        <Card className="studio-card">
          <CardHeader>
            <CardTitle>Focus areas</CardTitle>
            <CardDescription>Your lowest-accuracy subjects, worth prioritizing next.</CardDescription>
          </CardHeader>
          <CardContent>
            {weakestSubjects.length === 0 ? (
              <div className="flex flex-col items-start gap-3">
                <p className="text-sm text-muted-foreground">
                  No graded attempts yet — practice a few questions to surface where to focus.
                </p>
                <Link href={`/colleges/${selectedCollege.slug}`} className={buttonVariants({ variant: "outline", className: "rounded-lg" })}>
                  Go to {selectedCollege.examName}
                </Link>
              </div>
            ) : (
              <div className="flex flex-col gap-4">
                {weakestSubjects.map((s) => (
                  <div key={s.subject} className="flex items-center justify-between gap-3 border-b border-border pb-3 last:border-b-0 last:pb-0">
                    <div>
                      <p className="text-sm font-medium">{s.subject}</p>
                      <p className="text-xs text-muted-foreground">
                        {s.correct}/{s.total} correct
                      </p>
                    </div>
                    <span className="text-sm font-semibold text-primary">{s.pct}%</span>
                  </div>
                ))}
                <div className="flex flex-wrap gap-3 pt-1">
                  <Link href="/review" className={buttonVariants({ size: "sm", variant: "outline", className: "rounded-lg" })}>
                    Go to Review
                  </Link>
                  <Link
                    href={`/colleges/${selectedCollege.slug}`}
                    className={buttonVariants({ size: "sm", variant: "outline", className: "rounded-lg" })}
                  >
                    Practice {selectedCollege.examName}
                  </Link>
                </div>
              </div>
            )}
          </CardContent>
        </Card>

        <div className="flex flex-col overflow-hidden rounded-xl bg-foreground text-background">
          <div className="flex flex-1 flex-col justify-between p-5">
            <div className="flex items-center gap-2 text-background/60">
              <Trophy className="h-4 w-4" />
              <p className="text-xs font-medium">Next milestone</p>
            </div>
            <div className="mt-3">
              <p className="text-lg font-semibold leading-snug">{milestone.title}</p>
              <p className="mt-1.5 text-sm text-background/70">{milestone.description}</p>
            </div>
            <div className="mt-5 h-1.5 w-full overflow-hidden rounded-full bg-background/15">
              <div
                className="h-full rounded-full bg-background transition-all"
                style={{ width: `${Math.min(100, Math.max(0, milestone.progress))}%` }}
              />
            </div>
          </div>
        </div>
      </div>

      {/* Score history + recent attempts */}
      {testsCompleted === 0 ? (
        <Card
          className="mt-6 rounded-xl border-2 bg-card"
          style={{ borderColor: `color-mix(in srgb, ${selectedCollege.color.bg} 45%, transparent)` }}
        >
          <CardContent className="flex flex-wrap items-center justify-between gap-4">
            <div className="flex items-start gap-3">
              <span
                className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg"
                style={{
                  backgroundColor: `color-mix(in srgb, ${selectedCollege.color.bg} 14%, transparent)`,
                  color: selectedCollege.color.bg,
                }}
              >
                <BellRing className="h-4.5 w-4.5" />
              </span>
              <div>
                <p className="font-semibold">Your {selectedCollege.examName} pre-test is waiting</p>
                <p className="mt-0.5 text-sm text-muted-foreground">
                  A free diagnostic mock test — see your starting point before you study. It won&apos;t
                  count against your plan&apos;s mock test limit.
                </p>
              </div>
            </div>
            <Link
              href={`/mock-test/${selectedCollege.slug}`}
              className={buttonVariants({ className: "shrink-0 rounded-lg" })}
              style={{ backgroundColor: selectedCollege.color.bg, color: selectedCollege.color.fg }}
            >
              Take the pre-test
            </Link>
          </CardContent>
        </Card>
      ) : (
        <div className="mt-6 flex flex-col gap-5">
          <Card className="studio-card">
            <CardHeader>
              <CardTitle>Score over time</CardTitle>
              <CardDescription>Percentage correct per completed {selectedCollege.examName} attempt</CardDescription>
            </CardHeader>
            <CardContent>
              <MasteryChart attempts={typedAttempts} color={selectedCollege.color.bg} />
            </CardContent>
          </Card>

          <Card className="studio-card">
            <CardHeader>
              <CardTitle>Recent test results</CardTitle>
              <CardDescription>Your completed mock tests, newest first</CardDescription>
            </CardHeader>
            <CardContent>
              <ul className="flex flex-col gap-2">
                {typedAttempts
                  .slice()
                  .reverse()
                  .map((a) => (
                    <li key={a.id} className="flex items-center justify-between border-b py-2 text-sm last:border-b-0">
                      <span className="flex items-center gap-2 text-muted-foreground">
                        {a.completed_at ? new Date(a.completed_at).toLocaleDateString() : "In progress"}
                        {a.is_pretest && (
                          <Badge variant="secondary" className="rounded-full text-[0.65rem]">
                            Pre-test
                          </Badge>
                        )}
                      </span>
                      <span className="font-semibold text-primary">
                        {a.score ?? 0}/{a.total_questions ?? 0} (
                        {a.total_questions ? Math.round(((a.score ?? 0) / a.total_questions) * 100) : 0}%)
                      </span>
                    </li>
                  ))}
              </ul>
            </CardContent>
          </Card>
        </div>
      )}

      <div className="mt-6">
        <Card className="studio-card">
          <CardHeader>
            <CardTitle>Recent review sessions</CardTitle>
            <CardDescription>Flashcards, General Review, and Exam Focus Review activity</CardDescription>
          </CardHeader>
          <CardContent>
            {typedReviewAttempts.length === 0 ? (
              <div className="flex flex-col items-start gap-3">
                <p className="text-sm text-muted-foreground">
                  No review sessions yet — General Review and Exam Focus Review count toward your
                  subject mastery above; flashcard time is tracked here too.
                </p>
                <Link href="/review" className={buttonVariants({ variant: "outline", className: "rounded-lg" })}>
                  Go to Review
                </Link>
              </div>
            ) : (
              <ul className="flex flex-col gap-2">
                {typedReviewAttempts.map((a) => (
                  <li key={a.id} className="flex items-center justify-between border-b py-2 text-sm last:border-b-0">
                    <span className="text-muted-foreground">
                      {modeLabels[a.mode]} ·{" "}
                      {a.completed_at ? new Date(a.completed_at).toLocaleDateString() : "In progress"}
                    </span>
                    <span className="font-semibold text-primary">
                      {a.mode === "flashcard"
                        ? `${a.score ?? 0}/${a.total_questions ?? 0} knew it`
                        : `${a.question_count} question${a.question_count === 1 ? "" : "s"}`}
                    </span>
                  </li>
                ))}
              </ul>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
