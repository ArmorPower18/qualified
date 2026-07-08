import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import type { TargetExam } from "@/lib/types";

const EXAM_NAME_TO_SLUG: Record<TargetExam, string> = {
  UPCAT: "up",
  ACET: "admu",
  DCAT: "dlsu",
  USTET: "ust",
};

// Resolves to whichever exam the student is currently focused on (same logic
// the dashboard uses), so "/study-plan" always lands somewhere useful.
export default async function StudyPlanIndexPage() {
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
  let slug = profile?.target_college_id ? idToSlug.get(profile.target_college_id) : undefined;
  if (!slug && onboarding?.target_exams?.length) {
    slug = EXAM_NAME_TO_SLUG[onboarding.target_exams[0] as TargetExam];
  }
  redirect(`/study-plan/${slug ?? "up"}`);
}
