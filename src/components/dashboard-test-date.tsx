"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import type { CollegeColor } from "@/lib/colleges-static";

export function DashboardTestDate({
  initialDate,
  collegeId,
  accent,
}: {
  initialDate: string | null;
  // Which exam this date belongs to — each college gets its own row so
  // setting one exam's date doesn't overwrite another's.
  collegeId: string | null;
  accent: CollegeColor;
}) {
  const router = useRouter();
  const supabase = createClient();
  const [editing, setEditing] = useState(false);
  const [value, setValue] = useState(initialDate ?? "");
  const [saving, setSaving] = useState(false);

  async function save() {
    if (!value || !collegeId) return;
    setSaving(true);
    const { data } = await supabase.auth.getUser();
    if (data.user) {
      await supabase
        .from("exam_test_dates")
        .upsert(
          { user_id: data.user.id, college_id: collegeId, test_date: value, updated_at: new Date().toISOString() },
          { onConflict: "user_id,college_id" }
        );
    }
    setSaving(false);
    setEditing(false);
    router.refresh();
  }

  if (editing) {
    return (
      <div className="flex flex-wrap items-center gap-2">
        <Input
          type="date"
          value={value}
          onChange={(e) => setValue(e.target.value)}
          className="h-8 w-auto"
          style={{
            colorScheme: accent.scheme,
            borderColor: `color-mix(in srgb, ${accent.fg} 30%, transparent)`,
            backgroundColor: `color-mix(in srgb, ${accent.fg} 10%, transparent)`,
            color: accent.fg,
          }}
        />
        <Button
          size="sm"
          onClick={save}
          disabled={saving || !value || !collegeId}
          className="border-transparent"
          style={{ backgroundColor: accent.fg, color: accent.bg }}
        >
          {saving ? "Saving…" : "Save"}
        </Button>
        <Button
          size="sm"
          variant="ghost"
          className="hover:bg-transparent"
          style={{ color: `color-mix(in srgb, ${accent.fg} 70%, transparent)` }}
          onClick={() => setEditing(false)}
          disabled={saving}
        >
          Cancel
        </Button>
      </div>
    );
  }

  return (
    <Button
      size="sm"
      onClick={() => setEditing(true)}
      className="border-transparent hover:opacity-90"
      style={{ backgroundColor: `color-mix(in srgb, ${accent.fg} 16%, transparent)`, color: accent.fg }}
    >
      {initialDate ? "Use a different date" : "Set your test date"}
    </Button>
  );
}
