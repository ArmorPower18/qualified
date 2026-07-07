-- Safe to run any time — re-asserts RLS is on for the security-critical
-- user-data tables. No-op if already enabled.

alter table comments enable row level security;
alter table profiles enable row level security;
alter table mock_test_attempts enable row level security;
