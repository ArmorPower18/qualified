-- Subject mastery tracking: per-question correctness, tagged with a denormalized
-- subject label so it can roll up across two different taxonomies (CET practice
-- subjects like "Mathematics" for a specific college, and review lessons which
-- belong to a subject_area like "Mathematics (ACTs Math Reviewer)"). Flashcards are
-- intentionally excluded — "knew it / still learning" is self-reported, not a
-- graded answer, so it doesn't feed mastery accuracy.

create table question_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  source text not null check (source in ('practice', 'general_review', 'exam_focus_review')),
  subject_label text not null,
  is_correct boolean not null,
  answered_at timestamptz not null default now()
);

create index on question_attempts (user_id);
create index on question_attempts (user_id, subject_label);

alter table question_attempts enable row level security;

create policy "users can view own question attempts" on question_attempts for select using (auth.uid() = user_id);
create policy "users can create own question attempts" on question_attempts for insert with check (auth.uid() = user_id);

-- Time tracking for review sessions (flashcards, general review, exam focus review).
alter table review_attempts add column duration_seconds int;
