"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { ChevronDown } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import type { SubjectAreaTree } from "@/lib/review-data";
import type { Difficulty } from "@/lib/types";
import { cn } from "@/lib/utils";

const COUNT_OPTIONS = [5, 10, 15, 20, 30];

export function LessonSelector({
  tree,
  sessionHref,
  submitLabel,
}: {
  tree: SubjectAreaTree[];
  sessionHref: string;
  submitLabel: string;
}) {
  const router = useRouter();
  const [selected, setSelected] = useState<Set<string>>(new Set());
  const [difficulty, setDifficulty] = useState<Difficulty | "any">("any");
  const [count, setCount] = useState(10);

  const allLessonIds = useMemo(
    () => tree.flatMap((s) => s.modules.flatMap((m) => m.lessons.map((l) => l.id))),
    [tree]
  );

  function toggleLesson(id: string) {
    setSelected((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  }

  function toggleModule(lessonIds: string[]) {
    setSelected((prev) => {
      const next = new Set(prev);
      const allSelected = lessonIds.every((id) => next.has(id));
      lessonIds.forEach((id) => (allSelected ? next.delete(id) : next.add(id)));
      return next;
    });
  }

  function selectAll() {
    setSelected(new Set(allLessonIds));
  }

  function clearAll() {
    setSelected(new Set());
  }

  function handleSubmit() {
    const params = new URLSearchParams();
    params.set("lessons", Array.from(selected).join(","));
    if (difficulty !== "any") params.set("difficulty", difficulty);
    params.set("count", String(count));
    router.push(`${sessionHref}?${params.toString()}`);
  }

  if (tree.length === 0) {
    return (
      <Card className="studio-card">
        <CardContent className="py-10 text-center text-muted-foreground">
          No lessons available for this selection yet. Check back soon.
        </CardContent>
      </Card>
    );
  }

  return (
    <div className="flex flex-col gap-6">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <p className="text-sm text-muted-foreground">
          {selected.size} lesson{selected.size === 1 ? "" : "s"} selected
        </p>
        <div className="flex gap-2">
          <Button variant="outline" size="sm" onClick={selectAll} className="rounded-md">
            Select all
          </Button>
          <Button variant="ghost" size="sm" onClick={clearAll} className="rounded-md">
            Clear
          </Button>
        </div>
      </div>

      <div className="flex flex-col gap-3">
        {tree.map((subject) => {
          const subjectLessonIds = subject.modules.flatMap((m) => m.lessons.map((l) => l.id));
          const subjectSelectedCount = subjectLessonIds.filter((id) => selected.has(id)).length;
          return (
            <details
              key={subject.id}
              className="group rounded-lg border border-foreground/15 bg-card/85 open:shadow-sm"
            >
              <summary className="flex cursor-pointer list-none items-center justify-between px-4 py-3">
                <span className="font-medium">{subject.name}</span>
                <span className="flex items-center gap-2 text-sm text-muted-foreground">
                  {subjectSelectedCount > 0 && `${subjectSelectedCount} selected`}
                  <ChevronDown className="h-4 w-4 transition-transform group-open:rotate-180" />
                </span>
              </summary>
              <div className="flex flex-col gap-4 border-t border-foreground/15 px-4 py-4">
                {subject.modules.map((mod) => {
                  const lessonIds = mod.lessons.map((l) => l.id);
                  const allChecked = lessonIds.length > 0 && lessonIds.every((id) => selected.has(id));
                  const someChecked = lessonIds.some((id) => selected.has(id));
                  return (
                    <div key={mod.id}>
                      <label className="flex items-center gap-2 text-sm font-medium">
                        <input
                          type="checkbox"
                          checked={allChecked}
                          ref={(el) => {
                            if (el) el.indeterminate = !allChecked && someChecked;
                          }}
                          onChange={() => toggleModule(lessonIds)}
                          className="h-4 w-4 rounded border-border accent-primary"
                        />
                        {mod.name}
                      </label>
                      <div className="mt-2 ml-6 flex flex-wrap gap-x-4 gap-y-1.5">
                        {mod.lessons.map((lesson) => (
                          <label
                            key={lesson.id}
                            className={cn(
                              "flex items-center gap-1.5 text-sm text-muted-foreground",
                              selected.has(lesson.id) && "text-foreground"
                            )}
                          >
                            <input
                              type="checkbox"
                              checked={selected.has(lesson.id)}
                              onChange={() => toggleLesson(lesson.id)}
                              className="h-3.5 w-3.5 rounded border-border accent-primary"
                            />
                            {lesson.name}
                          </label>
                        ))}
                      </div>
                    </div>
                  );
                })}
              </div>
            </details>
          );
        })}
      </div>

      <Card className="studio-card">
        <CardContent className="flex flex-col gap-4 py-5 sm:flex-row sm:items-end sm:justify-between">
          <div className="flex flex-1 gap-4">
            <div className="flex flex-1 flex-col gap-1.5">
              <Label>Difficulty</Label>
              <Select value={difficulty} onValueChange={(v) => setDifficulty(v as Difficulty | "any")}>
                <SelectTrigger>
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="any">Any</SelectItem>
                  <SelectItem value="easy">Easy</SelectItem>
                  <SelectItem value="medium">Medium</SelectItem>
                  <SelectItem value="hard">Hard</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div className="flex flex-1 flex-col gap-1.5">
              <Label>Number of questions</Label>
              <Select value={String(count)} onValueChange={(v) => setCount(Number(v))}>
                <SelectTrigger>
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  {COUNT_OPTIONS.map((n) => (
                    <SelectItem key={n} value={String(n)}>
                      {n}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
          </div>
          <Button size="lg" disabled={selected.size === 0} onClick={handleSubmit} className="rounded-md">
            {submitLabel}
          </Button>
        </CardContent>
      </Card>
    </div>
  );
}
