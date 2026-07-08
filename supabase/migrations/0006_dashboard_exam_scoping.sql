-- Dashboard exam scoping: lets mock test stats be filtered by the student's
-- currently-focused exam (UPCAT/ACET/DCAT/USTET), matching the new dashboard.
--
-- mock_test_runner.tsx has always written mock_test_id as a synthetic string
-- like 'synthetic:up' (there's no per-college mock_tests row wired up yet),
-- which never matched the original `uuid references mock_tests(id)` column —
-- so we widen the column to text and drop the now-invalid FK. A real
-- college_id column is added alongside it so attempts can be filtered/joined
-- by exam without depending on that synthetic string.

do $$
begin
  if exists (
    select 1 from information_schema.table_constraints
    where constraint_name = 'mock_test_attempts_mock_test_id_fkey'
  ) then
    alter table mock_test_attempts drop constraint mock_test_attempts_mock_test_id_fkey;
  end if;
end $$;

alter table mock_test_attempts
  alter column mock_test_id type text using mock_test_id::text;

alter table mock_test_attempts
  add column if not exists college_id uuid references colleges(id) on delete set null;

create index if not exists mock_test_attempts_college_id_idx on mock_test_attempts (college_id);
