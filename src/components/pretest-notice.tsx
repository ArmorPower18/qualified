"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { BellRing, X } from "lucide-react";
import { Button, buttonVariants } from "@/components/ui/button";
import { createClient } from "@/lib/supabase/client";
import { STATIC_COLLEGES } from "@/lib/colleges-static";
import type { TargetExam } from "@/lib/types";

// Pages where surfacing this would be redundant or premature: auth/marketing
// pages, the mock test flow itself, and the dashboard (which already shows a
// persistent "pre-test waiting" banner for as long as it's outstanding).
const SUPPRESSED_PATHS = ["/login", "/signup", "/", "/pricing", "/dashboard"];

const EXAM_NAME_TO_SLUG: Record<TargetExam, string> = {
  UPCAT: "up",
  ACET: "admu",
  DCAT: "dlsu",
  USTET: "ust",
};

const SESSION_KEY = "qualified:pretest-notice-dismissed";

export function PretestNotice() {
  const pathname = usePathname();
  const [notice, setNotice] = useState<{ slug: string; examName: string } | null>(null);

  useEffect(() => {
    if (SUPPRESSED_PATHS.includes(pathname) || pathname.startsWith("/mock-test")) return;
    if (typeof window !== "undefined" && sessionStorage.getItem(SESSION_KEY)) return;

    let cancelled = false;

    async function check() {
      const supabase = createClient();
      const {
        data: { user },
      } = await supabase.auth.getUser();
      if (!user || cancelled) return;

      const { data: profile } = await supabase
        .from("profiles")
        .select("target_college_id, onboarding_completed")
        .eq("id", user.id)
        .maybeSingle();
      // Let the onboarding survey run its course first — don't pile on.
      if (!profile?.onboarding_completed) return;

      const [{ data: onboarding }, { data: collegeRows }] = await Promise.all([
        supabase.from("onboarding_responses").select("target_exams").eq("user_id", user.id).maybeSingle(),
        supabase.from("colleges").select("id, slug").eq("is_custom", false),
      ]);

      const idToSlug = new Map((collegeRows ?? []).map((c) => [c.id as string, c.slug as string]));
      let slug = profile.target_college_id ? idToSlug.get(profile.target_college_id) : undefined;
      if (!slug && onboarding?.target_exams?.length) {
        slug = EXAM_NAME_TO_SLUG[onboarding.target_exams[0] as TargetExam];
      }
      if (!slug || cancelled) return;

      const collegeId = (collegeRows ?? []).find((c) => c.slug === slug)?.id;
      if (!collegeId) return;

      const { count } = await supabase
        .from("mock_test_attempts")
        .select("id", { count: "exact", head: true })
        .eq("user_id", user.id)
        .eq("college_id", collegeId);
      if (cancelled || (count ?? 0) > 0) return;

      const college = STATIC_COLLEGES.find((c) => c.slug === slug);
      if (college) setNotice({ slug: college.slug, examName: college.examName });
    }

    check();
    return () => {
      cancelled = true;
    };
  }, [pathname]);

  if (!notice) return null;

  function dismiss() {
    sessionStorage.setItem(SESSION_KEY, "1");
    setNotice(null);
  }

  return (
    <div className="fixed bottom-4 right-4 z-50 w-[min(22rem,calc(100vw-2rem))] animate-enter-up rounded-xl border border-foreground/15 bg-card p-4 shadow-lg">
      <div className="flex items-start gap-3">
        <span className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-primary/10 text-primary">
          <BellRing className="h-4 w-4" />
        </span>
        <div className="flex-1">
          <p className="text-sm font-semibold">Your free {notice.examName} pre-test is ready</p>
          <p className="mt-1 text-xs text-muted-foreground">
            See where you stand before you start studying — it&apos;s free and won&apos;t count against
            your mock test limit.
          </p>
          <div className="mt-3 flex gap-2">
            <Link
              href={`/mock-test/${notice.slug}`}
              onClick={dismiss}
              className={buttonVariants({ size: "sm", className: "rounded-lg" })}
            >
              Take it now
            </Link>
            <Button size="sm" variant="ghost" className="rounded-lg" onClick={dismiss}>
              Skip for now
            </Button>
          </div>
        </div>
        <button
          type="button"
          onClick={dismiss}
          aria-label="Dismiss"
          className="text-muted-foreground transition-colors hover:text-foreground"
        >
          <X className="h-4 w-4" />
        </button>
      </div>
    </div>
  );
}
