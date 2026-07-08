-- AI-generated study plans: one per user per college, built from the
-- student's pre-test result and subject mastery data, aimed at their exam
-- date. Regenerating overwrites the previous plan for that college (hence
-- the unique constraint + upsert-friendly shape) rather than accumulating
-- history — the plan is meant to reflect where the student stands *now*.

create table study_plans (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  college_id uuid not null references colleges(id) on delete cascade,
  summary text,
  weeks jsonb not null,
  generated_at timestamptz not null default now(),
  unique (user_id, college_id)
);

create index on study_plans (user_id, college_id);

alter table study_plans enable row level security;

create policy "users can view own study plans" on study_plans for select using (auth.uid() = user_id);
create policy "users can insert own study plans" on study_plans for insert with check (auth.uid() = user_id);
create policy "users can update own study plans" on study_plans for update using (auth.uid() = user_id);
create policy "users can delete own study plans" on study_plans for delete using (auth.uid() = user_id);
