-- Re-enables RLS on public content tables after seeding.
-- These tables are meant to be publicly READABLE only (see the public-select
-- policies already created in 0001_init.sql). No INSERT/UPDATE/DELETE policies
-- exist for anon/authenticated on purpose — only an admin running SQL directly
-- (which bypasses RLS) should ever write to these tables.

alter table colleges enable row level security;
alter table subjects enable row level security;
alter table questions enable row level security;
alter table videos enable row level security;
alter table mock_tests enable row level security;
