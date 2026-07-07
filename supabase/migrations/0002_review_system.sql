-- Review system: flashcards, general (topic-based) review, and exam-focused review.
--
-- Taxonomy is a 3-level tree (subject_areas -> modules -> lessons), stored as TWO kinds
-- of forests distinguished by subject_areas.scope:
--   'general'    -- cross-textbook topic list, used by General Review and Flashcards
--                   (not tied to any single exam).
--   '<college>'  -- one tree per Big-4 college (matches colleges.slug: up, admu, dlsu,
--                   ust), containing only that exam's priority topics, used by Exam
--                   Focus Review.
--
-- Flashcards and review_questions attach to a lesson regardless of which forest it
-- belongs to, so the same session/rendering logic works for all three review modes.

create table subject_areas (
  id uuid primary key default gen_random_uuid(),
  scope text not null, -- 'general' or a colleges.slug value
  slug text not null,
  name text not null,
  sort_order int not null default 0,
  unique (scope, slug)
);

create table modules (
  id uuid primary key default gen_random_uuid(),
  subject_area_id uuid not null references subject_areas(id) on delete cascade,
  slug text not null,
  name text not null,
  sort_order int not null default 0,
  unique (subject_area_id, slug)
);

create table lessons (
  id uuid primary key default gen_random_uuid(),
  module_id uuid not null references modules(id) on delete cascade,
  slug text not null,
  name text not null,
  sort_order int not null default 0,
  priority_notes text, -- optional: specific sub-topics an exam doc called out for this lesson
  unique (module_id, slug)
);

create table flashcards (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references lessons(id) on delete cascade,
  front text not null,
  back text not null,
  difficulty text not null default 'medium' check (difficulty in ('easy', 'medium', 'hard')),
  created_at timestamptz not null default now()
);

create table review_questions (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references lessons(id) on delete cascade,
  prompt text not null,
  choices jsonb not null,
  correct_answer text not null,
  explanation text,
  difficulty text not null default 'medium' check (difficulty in ('easy', 'medium', 'hard')),
  is_ai_generated boolean not null default false,
  created_at timestamptz not null default now()
);

create table review_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  mode text not null check (mode in ('flashcard', 'general', 'exam_focus')),
  college_id uuid references colleges(id), -- set only for exam_focus attempts
  lesson_ids uuid[] not null,
  difficulty text, -- null means "any difficulty" was selected
  question_count int not null,
  score numeric,
  total_questions int,
  started_at timestamptz not null default now(),
  completed_at timestamptz
);

create index on modules (subject_area_id);
create index on lessons (module_id);
create index on flashcards (lesson_id);
create index on review_questions (lesson_id);
create index on review_attempts (user_id);

alter table subject_areas enable row level security;
alter table modules enable row level security;
alter table lessons enable row level security;
alter table flashcards enable row level security;
alter table review_questions enable row level security;
alter table review_attempts enable row level security;

-- Content tables: publicly readable, no public write policies (admin-managed).
create policy "subject_areas are publicly readable" on subject_areas for select using (true);
create policy "modules are publicly readable" on modules for select using (true);
create policy "lessons are publicly readable" on lessons for select using (true);
create policy "flashcards are publicly readable" on flashcards for select using (true);
create policy "review_questions are publicly readable" on review_questions for select using (true);

-- Review attempts: user manages their own, same pattern as mock_test_attempts.
create policy "users can view own review attempts" on review_attempts for select using (auth.uid() = user_id);
create policy "users can create own review attempts" on review_attempts for insert with check (auth.uid() = user_id);
create policy "users can update own review attempts" on review_attempts for update using (auth.uid() = user_id);
