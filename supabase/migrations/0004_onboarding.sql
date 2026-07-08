-- Onboarding survey: stores a student's personalization answers after first login.
-- Keyed to auth.users via the existing profiles table (1-to-1 extension).

-- Add onboarding flag to profiles so we know whether to show the survey.
alter table profiles
  add column if not exists onboarding_completed boolean not null default false;

-- Dedicated table for the survey responses so we can query/analyze them later.
create table onboarding_responses (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null references auth.users(id) on delete cascade,

  -- Q1: exams being prepared for (multi-select)
  target_exams        text[] not null default '{}',

  -- Q2: study time commitment
  study_time          text,    -- e.g. '1-2 hours/day', '3-5 hours/week'

  -- Q3: self-assessed mastery level
  mastery_level       text check (mastery_level in ('beginner', 'intermediate', 'advanced')),

  -- Q4: preferred explanation style (multi-select)
  explanation_styles  text[] not null default '{}',
  explanation_other   text,    -- free-text when 'others' is selected

  -- Q5: subjects/topics to prioritize (free-text or structured list)
  priority_subjects   text,

  -- Q6: specific goals
  goals               text,

  -- Timestamps
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),

  unique (user_id)   -- one response set per user; upsert on re-submit
);

create index on onboarding_responses (user_id);

alter table onboarding_responses enable row level security;

create policy "users can view own onboarding response"
  on onboarding_responses for select
  using (auth.uid() = user_id);

create policy "users can insert own onboarding response"
  on onboarding_responses for insert
  with check (auth.uid() = user_id);

create policy "users can update own onboarding response"
  on onboarding_responses for update
  using (auth.uid() = user_id);
