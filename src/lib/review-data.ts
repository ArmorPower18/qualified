import { createClient } from "@/lib/supabase/server";
import type { SubjectArea, ReviewModule, Lesson, Flashcard, ReviewQuestion, Difficulty } from "@/lib/types";

export type SubjectAreaTree = SubjectArea & {
  modules: (ReviewModule & { lessons: Lesson[] })[];
};

// Fetches the full subject > module > lesson tree for a given scope
// ('general' or a college slug), used to render the selection UI.
export async function getSubjectTree(scope: string): Promise<SubjectAreaTree[]> {
  try {
    const supabase = await createClient();

    const { data: subjectAreas } = await supabase
      .from("subject_areas")
      .select("*")
      .eq("scope", scope)
      .order("sort_order");
    if (!subjectAreas || subjectAreas.length === 0) return [];

    const subjectIds = subjectAreas.map((s) => s.id);
    const { data: modules } = await supabase
      .from("modules")
      .select("*")
      .in("subject_area_id", subjectIds)
      .order("sort_order");

    const moduleIds = (modules ?? []).map((m) => m.id);
    const { data: lessons } = moduleIds.length
      ? await supabase.from("lessons").select("*").in("module_id", moduleIds).order("sort_order")
      : { data: [] as Lesson[] };

    return subjectAreas.map((subject) => ({
      ...subject,
      modules: (modules ?? [])
        .filter((m) => m.subject_area_id === subject.id)
        .map((mod) => ({
          ...mod,
          lessons: (lessons ?? []).filter((l) => l.module_id === mod.id),
        })),
    }));
  } catch {
    return [];
  }
}

export async function getFlashcards(lessonIds: string[], difficulty: Difficulty | null, limit: number): Promise<Flashcard[]> {
  if (lessonIds.length === 0) return [];
  try {
    const supabase = await createClient();
    let query = supabase.from("flashcards").select("*").in("lesson_id", lessonIds);
    if (difficulty) query = query.eq("difficulty", difficulty);
    const { data } = await query.limit(limit);
    return (data as Flashcard[]) ?? [];
  } catch {
    return [];
  }
}

export async function getReviewQuestions(
  lessonIds: string[],
  difficulty: Difficulty | null,
  limit: number
): Promise<ReviewQuestion[]> {
  if (lessonIds.length === 0) return [];
  try {
    const supabase = await createClient();
    let query = supabase.from("review_questions").select("*").in("lesson_id", lessonIds);
    if (difficulty) query = query.eq("difficulty", difficulty);
    const { data } = await query.limit(limit);
    return (data as ReviewQuestion[]) ?? [];
  } catch {
    return [];
  }
}

// Maps each lesson id to its parent subject_area name (e.g. "Mathematics"), so review
// sessions can tag question attempts with a subject label for mastery tracking.
export async function getLessonSubjectNames(lessonIds: string[]): Promise<Record<string, string>> {
  if (lessonIds.length === 0) return {};
  try {
    const supabase = await createClient();
    const { data: lessons } = await supabase.from("lessons").select("id, module_id").in("id", lessonIds);
    if (!lessons || lessons.length === 0) return {};

    const moduleIds = [...new Set(lessons.map((l) => l.module_id))];
    const { data: modules } = await supabase
      .from("modules")
      .select("id, subject_area_id")
      .in("id", moduleIds);
    if (!modules) return {};

    const subjectAreaIds = [...new Set(modules.map((m) => m.subject_area_id))];
    const { data: subjectAreas } = await supabase.from("subject_areas").select("id, name").in("id", subjectAreaIds);
    if (!subjectAreas) return {};

    const moduleToSubjectName = new Map(
      modules.map((m) => [m.id, subjectAreas.find((s) => s.id === m.subject_area_id)?.name ?? "General"])
    );
    const lessonToSubjectName: Record<string, string> = {};
    for (const lesson of lessons) {
      lessonToSubjectName[lesson.id] = moduleToSubjectName.get(lesson.module_id) ?? "General";
    }
    return lessonToSubjectName;
  } catch {
    return {};
  }
}
