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
      logo: "",
    };
  } catch {
    return null;
  }
}

export type MockTestSectionConfig = {
  subjectSlug: string;
  name: string;
  minutes: number;
  questionCount: number;
  questions: Question[];
};

export type MockTestConfig = {
  name: string;
  totalMinutes: number;
  sections: MockTestSectionConfig[];
};

// Reads section config from the mock_tests table in Supabase.
// Each section in section_config has a name, minutes, and question_count.
// We map section names back to a subject slug by fuzzy-matching against the
// college's known subjects, falling back to the first subject if no match found.
// Falls back to a synthesized config (static subjects, 10 min, sample questions)
// when no mock_tests row exists for this college.
export async function getMockTestConfig(collegeSlug: string): Promise<MockTestConfig | null> {
  const college = getStaticCollege(collegeSlug);
  if (!college) return null;

  try {
    const supabase = await createClient();

    // Try to load from the mock_tests table first
    const { data: mockTest } = await supabase
      .from("mock_tests")
      .select("name, time_limit_minutes, section_config")
      .eq("college_id", (
        await supabase.from("colleges").select("id").eq("slug", collegeSlug).single()
      ).data?.id)
      .single();

    if (mockTest?.section_config) {
      const rawSections = mockTest.section_config as Array<{
        name: string;
        minutes: number;
        question_count: number;
        subject_id: string | null;
      }>;

      // Map each section to the best-matching subject slug for question fetching.
      // Matching priority: subject name contains section keyword, or section name contains subject keyword.
      const sections = await Promise.all(
        rawSections.map(async (sec) => {
          const secNameLower = sec.name.toLowerCase();
          const matchedSubject = college.subjects.find((sub) => {
            const subNameLower = sub.name.toLowerCase();
            return secNameLower.includes(subNameLower.split(" ")[0]) ||
              subNameLower.includes(secNameLower.split(" ")[0]);
          }) ?? college.subjects[0];

          return {
            subjectSlug: matchedSubject.slug,
            name: sec.name,
            minutes: sec.minutes,
            questionCount: sec.question_count,
            questions: await getSubjectQuestions(collegeSlug, matchedSubject.slug),
          };
        })
      );

      return {
        name: mockTest.name,
        totalMinutes: mockTest.time_limit_minutes,
        sections,
      };
    }
  } catch {
    // Fall through to static fallback
  }

  // Fallback: synthesize from static college subjects
  const sections = await Promise.all(
    college.subjects.map(async (subject) => ({
      subjectSlug: subject.slug,
      name: subject.name,
      minutes: 10,
      questionCount: 0,
      questions: await getSubjectQuestions(collegeSlug, subject.slug),
    }))
  );

  return {
    name: `${college.examName} Mock Test`,
    totalMinutes: college.subjects.length * 10,
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
