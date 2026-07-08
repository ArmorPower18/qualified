"use client";

import { Line, LineChart, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from "recharts";
import type { MockTestAttempt } from "@/lib/types";

export function MasteryChart({ attempts, color }: { attempts: MockTestAttempt[]; color?: string }) {
  const data = attempts.map((a, i) => ({
    label: `Attempt ${i + 1}`,
    pct: a.total_questions ? Math.round(((a.score ?? 0) / a.total_questions) * 100) : 0,
  }));

  return (
    <div className="h-64 w-full">
      <ResponsiveContainer width="100%" height="100%">
        <LineChart data={data}>
          <CartesianGrid strokeDasharray="3 3" className="stroke-border" />
          <XAxis dataKey="label" fontSize={12} tickLine={false} />
          <YAxis domain={[0, 100]} fontSize={12} tickLine={false} />
          <Tooltip />
          <Line type="monotone" dataKey="pct" stroke={color ?? "var(--color-primary)"} strokeWidth={2} dot />
        </LineChart>
      </ResponsiveContainer>
    </div>
  );
}
