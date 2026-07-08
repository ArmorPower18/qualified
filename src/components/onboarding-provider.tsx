"use client";

import { useEffect, useState } from "react";
import { usePathname } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { OnboardingSurvey } from "@/components/onboarding-survey";

// Pages where we should NOT show the survey (auth pages, landing page).
const EXCLUDED_PATHS = ["/login", "/signup", "/"];

export function OnboardingProvider({ children }: { children: React.ReactNode }) {
  const pathname = usePathname();
  const [showSurvey, setShowSurvey] = useState(false);
  const [checked, setChecked] = useState(false);

  useEffect(() => {
    // Don't trigger on excluded paths
    if (EXCLUDED_PATHS.includes(pathname)) {
      setChecked(true);
      return;
    }

    let cancelled = false;

    async function checkOnboarding() {
      const supabase = createClient();

      // Get current user
      const {
        data: { user },
      } = await supabase.auth.getUser();

      if (!user || cancelled) {
        setChecked(true);
        return;
      }

      // Check if they have already completed onboarding
      const { data: profile } = await supabase
        .from("profiles")
        .select("onboarding_completed")
        .eq("id", user.id)
        .single();

      if (cancelled) return;

      // Show the survey if:
      //  - profile doesn't exist yet (new user), OR
      //  - onboarding_completed is false/null
      const completed = profile?.onboarding_completed ?? false;
      setShowSurvey(!completed);
      setChecked(true);
    }

    checkOnboarding();

    return () => {
      cancelled = true;
    };
  }, [pathname]);

  function handleComplete() {
    setShowSurvey(false);
  }

  return (
    <>
      {children}
      {checked && showSurvey && (
        <OnboardingSurvey open={showSurvey} onComplete={handleComplete} />
      )}
    </>
  );
}
