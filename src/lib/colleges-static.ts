// Static metadata for the Big 4 colleges — mirrors supabase/seed/0001_colleges_subjects.sql.
// Used for navigation/routing so core pages render even before Supabase content is seeded.

export type StaticSubject = { slug: string; name: string; description: string };

export type StaticCollege = {
  slug: string;
  name: string;
  examName: string;
  description: string;
  subjects: StaticSubject[];
  // Official crest, provided by the site owner (public/logos/*.png).
  logo: string;
};

export const STATIC_COLLEGES: StaticCollege[] = [
  {
    slug: "up",
    name: "University of the Philippines",
    examName: "UPCAT",
    description: "UP College Admission Test",
    logo: "/logos/up.png",
    subjects: [
      { slug: "language-proficiency",    name: "Language Proficiency",    description: "Grammar, vocabulary, reading, and Filipino language" },
      { slug: "science-proficiency",     name: "Science Proficiency",     description: "Biology, chemistry, physics, and earth science" },
      { slug: "mathematics-proficiency", name: "Mathematics Proficiency", description: "Algebra, geometry, statistics, and word problems" },
      { slug: "reading-comprehension",   name: "Reading Comprehension",   description: "English and Filipino reading passages with inference questions" },
    ],
  },
  {
    slug: "admu",
    name: "Ateneo de Manila University",
    examName: "ACET",
    description: "Ateneo College Entrance Test",
    logo: "/logos/admu.png",
    subjects: [
      { slug: "english-proficiency",    name: "English Proficiency",    description: "Vocabulary, grammar, and sentence construction" },
      { slug: "mathematics-proficiency", name: "Mathematics Proficiency", description: "Algebra, geometry, and quantitative reasoning" },
      { slug: "abstract-reasoning",      name: "Abstract Reasoning",      description: "Pattern recognition and non-verbal reasoning" },
      { slug: "reading-comprehension",   name: "Reading Comprehension",   description: "Passage-based reading and critical analysis" },
      { slug: "verbal-analogy",          name: "Verbal Analogy",          description: "Word relationships and analogical reasoning" },
      { slug: "logical-reasoning",       name: "Logical Reasoning",       description: "Deductive and inductive reasoning" },
      { slug: "numerical-ability",       name: "Numerical Ability",       description: "Number sense and arithmetic fluency" },
    ],
  },
  {
    slug: "dlsu",
    name: "De La Salle University",
    examName: "DCAT",
    description: "DLSU College Admission Test",
    logo: "/logos/dlsu.png",
    subjects: [
      { slug: "mental-ability",          name: "Mental Ability",                        description: "Logical, abstract, and analytical thinking" },
      { slug: "writing-skills-language", name: "Writing Skills & Language Proficiency", description: "Grammar, writing, and language use" },
      { slug: "mathematics-proficiency", name: "Mathematics Proficiency",               description: "Algebra, geometry, and word problems" },
      { slug: "science-proficiency",     name: "Science Proficiency",                   description: "Biology, chemistry, physics, and earth science" },
      { slug: "reading-comprehension",   name: "Reading Comprehension",                 description: "English passages and critical reading" },
      { slug: "statistics-probability",  name: "Statistics & Probability",              description: "Data analysis, probability, and statistics" },
    ],
  },
  {
    slug: "ust",
    name: "University of Santo Tomas",
    examName: "USTET",
    description: "UST Entrance Test",
    logo: "/logos/ust.png",
    subjects: [
      { slug: "mental-ability",          name: "Mental Ability",          description: "Reasoning, logic, and abstract thinking" },
      { slug: "english-proficiency",     name: "English Proficiency",     description: "Grammar, vocabulary, and English comprehension" },
      { slug: "mathematics-proficiency", name: "Mathematics Proficiency", description: "Arithmetic, algebra, and geometry" },
      { slug: "science-proficiency",     name: "Science Proficiency",     description: "General biology, chemistry, physics, and earth science" },
    ],
  },
];

export function getStaticCollege(slug: string) {
  return STATIC_COLLEGES.find((c) => c.slug === slug);
}
