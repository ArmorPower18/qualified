-- Qualified initial schema

create extension if not exists "pgcrypto";

-- Colleges (UP, AdMU, DLSU, UST, + custom user-defined ones)
create table colleges (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  name text not null,
  exam_name text not null,
  description text,
  is_custom boolean not null default false,
  owner_id uuid references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);

create table subjects (
  id uuid primary key default gen_random_uuid(),
  college_id uuid not null references colleges(id) on delete cascade,
  slug text not null,
  name text not null,
  description text,
  sort_order int not null default 0,
  unique (college_id, slug)
);

create table questions (
  id uuid primary key default gen_random_uuid(),
  subject_id uuid not null references subjects(id) on delete cascade,
  topic text not null,
  prompt text not null,
  choices jsonb not null, -- [{ "key": "A", "text": "..." }, ...]
  correct_answer text not null, -- matches a choice key
  explanation text,
  difficulty text not null default 'medium' check (difficulty in ('easy', 'medium', 'hard')),
  source text,
  is_ai_generated boolean not null default false,
  created_at timestamptz not null default now()
);

create table videos (
  id uuid primary key default gen_random_uuid(),
  subject_id uuid not null references subjects(id) on delete cascade,
  topic text not null,
  youtube_id text not null,
  title text not null,
  sort_order int not null default 0
);

create table profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  target_college_id uuid references colleges(id),
  test_date date,
  created_at timestamptz not null default now()
);

create table comments (
  id uuid primary key default gen_random_uuid(),
  question_id uuid not null references questions(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  parent_id uuid references comments(id) on delete cascade,
  body text not null,
  created_at timestamptz not null default now()
);

create table mock_tests (
  id uuid primary key default gen_random_uuid(),
  college_id uuid not null references colleges(id) on delete cascade,
  name text not null,
  time_limit_minutes int not null,
  section_config jsonb not null, -- [{ "subject_id": "...", "name": "...", "minutes": 40, "question_count": 30 }]
  created_at timestamptz not null default now()
);

create table mock_test_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  mock_test_id uuid not null references mock_tests(id) on delete cascade,
  score numeric,
  total_questions int,
  answers jsonb, -- { "question_id": "chosen_key" }
  started_at timestamptz not null default now(),
  completed_at timestamptz
);

create index on subjects (college_id);
create index on questions (subject_id);
create index on videos (subject_id);
create index on comments (question_id);
create index on comments (parent_id);
create index on mock_test_attempts (user_id);
create index on mock_test_attempts (mock_test_id);

-- Row Level Security
alter table colleges enable row level security;
alter table subjects enable row level security;
alter table questions enable row level security;
alter table videos enable row level security;
alter table profiles enable row level security;
alter table comments enable row level security;
alter table mock_tests enable row level security;
alter table mock_test_attempts enable row level security;

-- Public read access for content tables
create policy "colleges are publicly readable" on colleges for select using (true);
create policy "subjects are publicly readable" on subjects for select using (true);
create policy "questions are publicly readable" on questions for select using (true);
create policy "videos are publicly readable" on videos for select using (true);
create policy "mock_tests are publicly readable" on mock_tests for select using (true);

-- Custom colleges: owner can manage their own
create policy "users can create custom colleges" on colleges for insert with check (auth.uid() = owner_id);
create policy "owners can update their custom colleges" on colleges for update using (auth.uid() = owner_id);
create policy "owners can delete their custom colleges" on colleges for delete using (auth.uid() = owner_id);

-- Profiles: user manages their own
create policy "users can view own profile" on profiles for select using (auth.uid() = id);
create policy "users can insert own profile" on profiles for insert with check (auth.uid() = id);
create policy "users can update own profile" on profiles for update using (auth.uid() = id);

-- Comments: publicly readable, only authenticated users manage their own
create policy "comments are publicly readable" on comments for select using (true);
create policy "authenticated users can post comments" on comments for insert with check (auth.uid() = user_id);
create policy "users can update own comments" on comments for update using (auth.uid() = user_id);
create policy "users can delete own comments" on comments for delete using (auth.uid() = user_id);

-- Mock test attempts: user manages their own
create policy "users can view own attempts" on mock_test_attempts for select using (auth.uid() = user_id);
create policy "users can create own attempts" on mock_test_attempts for insert with check (auth.uid() = user_id);
create policy "users can update own attempts" on mock_test_attempts for update using (auth.uid() = user_id);
