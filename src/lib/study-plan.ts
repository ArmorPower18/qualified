import type { StudyPlan, StudyPlanActivity, StudyPlanDay } from "@/lib/types";
import type { StaticSubject } from "@/lib/colleges-static";

const WEEKDAY_OFFSETS: Record<string, number> = {
  mon: 0,
  tue: 1,
  wed: 2,
  thu: 3,
  fri: 4,
  sat: 5,
  sun: 6,
};

function startOfDay(date: Date) {
  const d = new Date(date);
  d.setHours(0, 0, 0, 0);
  return d;
}

function mondayOnOrBefore(date: Date) {
  const d = startOfDay(date);
  // getDay(): Sun=0..Sat=6 -> days since Monday
  const daysSinceMonday = (d.getDay() + 6) % 7;
  d.setDate(d.getDate() - daysSinceMonday);
  return d;
}

// The plan stores weekday labels ("Mon".."Sun"), not calendar dates, so we anchor
// week 1 to the Monday of the week the plan was generated in and count forward —
// this lets "today"/"next 3 days" line up without the AI needing to know real dates.
export function getPlanDayDate(generatedAt: string, weekIndex: number, dayLabel: string): Date | null {
  const offset = WEEKDAY_OFFSETS[dayLabel.trim().slice(0, 3).toLowerCase()];
  if (offset === undefined) return null;
  const weekStart = mondayOnOrBefore(new Date(generatedAt));
  const date = new Date(weekStart);
  date.setDate(date.getDate() + weekIndex * 7 + offset);
  return date;
}

export type FlattenedPlanDay = {
  date: Date;
  weekIndex: number;
  weekLabel: string;
  weekFocus: string;
  day: StudyPlanDay;
};

export function flattenPlanDays(plan: Pick<StudyPlan, "weeks" | "generated_at">): FlattenedPlanDay[] {
  const rows: FlattenedPlanDay[] = [];
  plan.weeks.forEach((week, weekIndex) => {
    week.days.forEach((day) => {
      const date = getPlanDayDate(plan.generated_at, weekIndex, day.day);
      if (!date) return;
      rows.push({ date, weekIndex, weekLabel: week.label, weekFocus: week.focus, day });
    });
  });
  return rows.sort((a, b) => a.date.getTime() - b.date.getTime());
}

export function isSameDay(a: Date, b: Date) {
  return startOfDay(a).getTime() === startOfDay(b).getTime();
}

// Where clicking an activity should take the student — best-effort match of the
// AI's free-text subject name to a real subject slug for that college.
export function resolveActivityHref(
  activity: StudyPlanActivity,
  collegeSlug: string,
  subjects: StaticSubject[]
): string {
  if (activity.kind === "mock") return `/mock-test/${collegeSlug}`;
  if (activity.kind === "review") return `/review/exam-focus/${collegeSlug}`;

  const needle = activity.subject.toLowerCase();
  const match = subjects.find(
    (s) => s.name.toLowerCase() === needle || needle.includes(s.name.toLowerCase()) || s.name.toLowerCase().includes(needle)
  );
  return match ? `/practice/${collegeSlug}/${match.slug}` : `/colleges/${collegeSlug}`;
}
