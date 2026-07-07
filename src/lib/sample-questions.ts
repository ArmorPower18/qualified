import type { Question } from "@/lib/types";

// Fallback sample questions shown when Supabase has no seeded content yet for a subject,
// so the practice flow is demonstrable before the real question bank is populated.
export function getSampleQuestions(subjectSlug: string): Question[] {
  const base: Omit<Question, "id" | "subject_id">[] = [
    {
      topic: "Sample",
      prompt: "Choose the word that is most nearly OPPOSITE in meaning to 'FRUGAL'.",
      choices: [
        { key: "A", text: "Thrifty" },
        { key: "B", text: "Extravagant" },
        { key: "C", text: "Modest" },
        { key: "D", text: "Careful" },
      ],
      correct_answer: "B",
      explanation: "'Frugal' means careful with money or resources; 'extravagant' is its opposite.",
      difficulty: "easy",
      source: "Qualified sample",
      is_ai_generated: true,
    },
    {
      topic: "Sample",
      prompt: "If 3x - 7 = 14, what is the value of x?",
      choices: [
        { key: "A", text: "5" },
        { key: "B", text: "7" },
        { key: "C", text: "9" },
        { key: "D", text: "21" },
      ],
      correct_answer: "B",
      explanation: "3x - 7 = 14 → 3x = 21 → x = 7.",
      difficulty: "easy",
      source: "Qualified sample",
      is_ai_generated: true,
    },
    {
      topic: "Sample",
      prompt: "Which part of the cell is primarily responsible for producing ATP?",
      choices: [
        { key: "A", text: "Nucleus" },
        { key: "B", text: "Ribosome" },
        { key: "C", text: "Mitochondrion" },
        { key: "D", text: "Golgi apparatus" },
      ],
      correct_answer: "C",
      explanation: "Mitochondria carry out cellular respiration, producing most of the cell's ATP.",
      difficulty: "medium",
      source: "Qualified sample",
      is_ai_generated: true,
    },
  ];

  return base.map((q, i) => ({
    ...q,
    id: `sample-${subjectSlug}-${i}`,
    subject_id: `sample-${subjectSlug}`,
  }));
}
