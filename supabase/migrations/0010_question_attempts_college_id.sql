-- Lets subject mastery be scoped per exam. Nullable — general review and
-- flashcard-adjacent practice stay exam-agnostic (null), same convention as
-- review_attempts.college_id ("set only for exam_focus attempts"); practice
-- and exam-focused attempts get the specific college so they only count
-- toward that exam's dashboard.

alter table question_attempts
  add column if not exists college_id uuid references colleges(id) on delete set null;

create index if not exists question_attempts_college_id_idx on question_attempts (college_id);
