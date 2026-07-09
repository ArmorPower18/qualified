"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Loader2, Sparkles } from "lucide-react";
import { Button } from "@/components/ui/button";

export function GenerateStudyPlanButton({
  collegeSlug,
  label = "Build my study plan",
  accent,
  fullWidth = false,
}: {
  collegeSlug: string;
  label?: string;
  accent?: { bg: string; fg: string };
  fullWidth?: boolean;
}) {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function generate() {
    setLoading(true);
    setError(null);
    try {
      const res = await fetch("/api/generate-study-plan", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ collegeSlug }),
      });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error ?? "Couldn't generate a study plan.");
        setLoading(false);
        return;
      }
      router.push(`/study-plan/${collegeSlug}`);
      router.refresh();
    } catch {
      setError("Couldn't reach the AI agent. Try again in a moment.");
      setLoading(false);
    }
  }

  return (
    <div className="flex flex-col gap-2">
      <Button
        onClick={generate}
        disabled={loading}
        className={fullWidth ? "w-full rounded-lg border-transparent" : "rounded-lg border-transparent"}
        style={accent ? { backgroundColor: accent.bg, color: accent.fg } : undefined}
      >
        {loading ? (
          <>
            <Loader2 className="h-4 w-4 animate-spin" /> Analyzing your results…
          </>
        ) : (
          <>
            <Sparkles className="h-4 w-4" /> {label}
          </>
        )}
      </Button>
      {error && <p className="text-xs text-destructive">{error}</p>}
    </div>
  );
}
