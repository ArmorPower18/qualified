-- Per-exam test dates: profiles.test_date was a single column shared across
-- every exam, so setting a date for one college (e.g. DLSU) overwrote it for
-- all four. This table lets each user/college pair have its own date.

create table exam_test_dates (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  college_id uuid not null references colleges(id) on delete cascade,
  test_date date not null,
  updated_at timestamptz not null default now(),
  unique (user_id, college_id)
);

create index on exam_test_dates (user_id, college_id);

alter table exam_test_dates enable row level security;

create policy "users can view own exam test dates" on exam_test_dates for select using (auth.uid() = user_id);
create policy "users can insert own exam test dates" on exam_test_dates for insert with check (auth.uid() = user_id);
create policy "users can update own exam test dates" on exam_test_dates for update using (auth.uid() = user_id);
create policy "users can delete own exam test dates" on exam_test_dates for delete using (auth.uid() = user_id);
