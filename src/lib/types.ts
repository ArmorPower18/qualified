export type College = {
  id: string;
  slug: string;
  name: string;
  exam_name: string;
  description: string | null;
  is_custom: boolean;
  owner_id: string | null;
};

export type Subject = {
  id: string;
  college_id: string;
  slug: string;
  name: string;
  description: string | null;
  sort_order: number;
};

export type QuestionChoice = { key: string; text: string };

export type Question = {
  id: string;
  subject_id: string;
  topic: string;
  prompt: string;
  choices: QuestionChoice[];
  correct_answer: string;
  explanation: string | null;
  difficulty: "easy" | "medium" | "hard";
  source: string | null;
  is_ai_generated: boolean;
};

export type Video = {
  id: string;
  subject_id: string;
  topic: string;
  youtube_id: string;
  title: string;
  sort_order: number;
};

export type Comment = {
  id: string;
  question_id: string;
  user_id: string;
  parent_id: string | null;
  body: string;
  created_at: string;
};

export type MockTestSection = {
  subject_id: string;
  name: string;
  minutes: number;
  question_count: number;
};

export type MockTest = {
  id: string;
  college_id: string;
  name: string;
  time_limit_minutes: number;
  section_config: MockTestSection[];
};

export type MockTestAttempt = {
  id: string;
  user_id: string;
  mock_test_id: string;
  score: number | null;
  total_questions: number | null;
  answers: Record<string, string>;
  started_at: string;
  completed_at: string | null;
};

// Review system: general (topic-based) review, exam-focused review, and flashcards.
// Two kinds of trees, distinguished by `scope`: 'general' (cross-textbook, exam-agnostic)
// or a college slug like 'up'/'admu'/'dlsu'/'ust' (that exam's priority topics only).

export type SubjectArea = {
  id: string;
  scope: string;
  slug: string;
  name: string;
  sort_order: number;
};

export type ReviewModule = {
  id: string;
  subject_area_id: string;
  slug: string;
  name: string;
  sort_order: number;
};

export type Lesson = {
  id: string;
  module_id: string;
  slug: string;
  name: string;
  sort_order: number;
  priority_notes: string | null;
};

export type Difficulty = "easy" | "medium" | "hard";

export type Flashcard = {
  id: string;
  lesson_id: string;
  front: string;
  back: string;
  difficulty: Difficulty;
};

export type ReviewQuestion = {
  id: string;
  lesson_id: string;
  prompt: string;
  choices: QuestionChoice[];
  correct_answer: string;
  explanation: string | null;
  difficulty: Difficulty;
  is_ai_generated: boolean;
};

export type ReviewMode = "flashcard" | "general" | "exam_focus";

export type ReviewAttempt = {
  id: string;
  user_id: string;
  mode: ReviewMode;
  college_id: string | null;
  lesson_ids: string[];
  difficulty: Difficulty | null;
  question_count: number;
  score: number | null;
  total_questions: number | null;
  started_at: string;
  completed_at: string | null;
};
