"use client";

import Image from "next/image";
import { useRouter } from "next/navigation";
import { useTransition } from "react";
import { createClient } from "@/lib/supabase/client";
import { cn } from "@/lib/utils";
import { STATIC_COLLEGES } from "@/lib/colleges-static";

export function DashboardExamTabs({
  selectedSlug,
  slugToId,
}: {
  selectedSlug: string;
  slugToId: Record<string, string>;
}) {
  const router = useRouter();
  const supabase = createClient();
  const [isPending, startTransition] = useTransition();

  function selectExam(slug: string) {
    if (slug === selectedSlug || isPending) return;
    startTransition(() => {
      router.push(`/dashboard?exam=${slug}`);
    });
    const collegeId = slugToId[slug];
    if (!collegeId) return;
    supabase.auth.getUser().then(({ data }) => {
      if (!data.user) return;
      supabase.from("profiles").upsert({ id: data.user.id, target_college_id: collegeId });
    });
  }

  return (
    <div className="inline-flex flex-wrap items-center gap-1 rounded-lg border border-foreground/15 bg-card/70 p-1">
      {STATIC_COLLEGES.map((college) => {
        const active = college.slug === selectedSlug;
        return (
          <button
            key={college.slug}
            type="button"
            onClick={() => selectExam(college.slug)}
            disabled={isPending}
            className={cn(
              "flex items-center gap-1.5 rounded-md px-3 py-1.5 text-sm font-medium transition-colors disabled:pointer-events-none disabled:opacity-60",
              !active && "text-muted-foreground hover:bg-muted hover:text-foreground"
            )}
            style={active ? { backgroundColor: college.color.bg, color: college.color.fg } : undefined}
          >
            <Image src={college.logo} alt="" width={16} height={16} className="h-4 w-4 object-contain" />
            {college.examName}
          </button>
        );
      })}
    </div>
  );
}
