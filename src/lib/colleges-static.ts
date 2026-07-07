// Static metadata for the Big 4 colleges — mirrors supabase/seed/0001_colleges_subjects.sql.
// Used for navigation/routing so core pages render even before Supabase content is seeded.

export type StaticSubject = { slug: string; name: string; description: string };

export type StaticCollege = {
  slug: string;
  name: string;
  examName: string;
  description: string;
  subjects: StaticSubject[];
};

export const STATIC_COLLEGES: StaticCollege[] = [
  {
    slug: "up",
    name: "University of the Philippines",
    examName: "UPCAT",
    description: "UP College Admission Test",
    subjects: [
      { slug: "reading-comprehension", name: "Reading Comprehension", description: "English and Filipino reading passages with inference questions" },
      { slug: "language-proficiency", name: "Language Proficiency", description: "Grammar, vocabulary, and sentence construction" },
      { slug: "mathematics", name: "Mathematics", description: "Algebra, geometry, and word problems" },
      { slug: "science", name: "Science", description: "General biology, chemistry, physics, and earth science" },
    ],
  },
  {
    slug: "admu",
    name: "Ateneo de Manila University",
    examName: "ACET",
    description: "Ateneo College Entrance Test",
    subjects: [
      { slug: "verbal-ability", name: "Verbal Ability", description: "Vocabulary, analogies, and reading comprehension" },
      { slug: "mathematical-ability", name: "Mathematical Ability", description: "Algebra, geometry, and quantitative reasoning" },
      { slug: "science", name: "Science", description: "Biology, chemistry, and physics concepts" },
      { slug: "essay-writing", name: "Essay Writing", description: "Timed essay prompts assessing written communication" },
    ],
  },
  {
    slug: "dlsu",
    name: "De La Salle University",
    examName: "DCAT",
    description: "DLSU College Admission Test",
    subjects: [
      { slug: "reading-comprehension", name: "Reading Comprehension", description: "English passages and critical reading" },
      { slug: "verbal-reasoning", name: "Verbal Reasoning", description: "Vocabulary, analogies, and logic" },
      { slug: "quantitative-reasoning", name: "Quantitative Reasoning", description: "Math word problems and numerical reasoning" },
      { slug: "science", name: "Science", description: "General science concepts" },
    ],
  },
  {
    slug: "ust",
    name: "University of Santo Tomas",
    examName: "USTET",
    description: "UST Entrance Test",
    subjects: [
      { slug: "language-proficiency", name: "Language Proficiency", description: "English and Filipino grammar and comprehension" },
      { slug: "mathematics", name: "Mathematics", description: "Arithmetic, algebra, and geometry" },
      { slug: "science", name: "Science", description: "General science concepts" },
      { slug: "reading-comprehension", name: "Reading Comprehension", description: "Passage-based comprehension questions" },
    ],
  },
];

export function getStaticCollege(slug: string) {
  return STATIC_COLLEGES.find((c) => c.slug === slug);
}
