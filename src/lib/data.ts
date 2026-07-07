import { createClient } from "@/lib/supabase/server";
import { getSampleQuestions } from "@/lib/sample-questions";
import { getStaticCollege, type StaticCollege } from "@/lib/colleges-static";
import type { Question, Video } from "@/lib/types";

// User-submitted custom CETs only store coverage/samples as free text (no structured
// subjects yet), so they render with an empty subjects list on the college page.
export async function getCustomCollege(collegeSlug: string): Promise<StaticCollege | null> {
  try {
    const supabase = await createClient();
    const { data } = await supabase
      .from("colleges")
      .select("*")
      .eq("slug", collegeSlug)
      .eq("is_custom", true)
      .single();
    if (!data) return null;

    return {
      slug: data.slug,
      name: data.name,
      examName: data.exam_name,
      description: data.description ?? "",
      subjects: [],
    };
  } catch {
    return null;
  }
}

export type MockTestSectionConfig = {
  subjectSlug: string;
  name: string;
  minutes: number;
  questions: Question[];
};

export type MockTestConfig = {
  name: string;
  sections: MockTestSectionConfig[];
};

// Falls back to a synthesized mock test (10 min per subject, sample questions) when no
// mock_tests row exists yet in Supabase for this college.
export async function getMockTestConfig(collegeSlug: string): Promise<MockTestConfig | null> {
  const college = getStaticCollege(collegeSlug);
  if (!college) return null;

  const sections = await Promise.all(
    college.subjects.map(async (subject) => ({
      subjectSlug: subject.slug,
      name: subject.name,
      minutes: 10,
      questions: await getSubjectQuestions(collegeSlug, subject.slug),
    }))
  );

  return {
    name: `${college.examName} Mock Test`,
    sections,
  };
}

export async function getSubjectQuestions(collegeSlug: string, subjectSlug: string): Promise<Question[]> {
  try {
    const supabase = await createClient();
    const { data: college } = await supabase.from("colleges").select("id").eq("slug", collegeSlug).single();
    if (!college) return getSampleQuestions(subjectSlug);

    const { data: subject } = await supabase
      .from("subjects")
      .select("id")
      .eq("college_id", college.id)
      .eq("slug", subjectSlug)
      .single();
    if (!subject) return getSampleQuestions(subjectSlug);

    const { data: questions } = await supabase.from("questions").select("*").eq("subject_id", subject.id);
    if (!questions || questions.length === 0) return getSampleQuestions(subjectSlug);

    return questions as Question[];
  } catch {
    return getSampleQuestions(subjectSlug);
  }
}

export async function getSubjectVideos(collegeSlug: string, subjectSlug: string): Promise<Video[]> {
  try {
    const supabase = await createClient();
    const { data: college } = await supabase.from("colleges").select("id").eq("slug", collegeSlug).single();
    if (!college) return [];

    const { data: subject } = await supabase
      .from("subjects")
      .select("id")
      .eq("college_id", college.id)
      .eq("slug", subjectSlug)
      .single();
    if (!subject) return [];

    const { data: videos } = await supabase
      .from("videos")
      .select("*")
      .eq("subject_id", subject.id)
      .order("sort_order");
    return (videos as Video[]) ?? [];
  } catch {
    return [];
  }
}
