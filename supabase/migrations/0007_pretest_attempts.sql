-- Free diagnostic "pre-test": a student's first mock test attempt for a given
-- college is always free and doesn't count against their plan's mock test
-- quota (see /pricing — Free is limited to 2 scheduled attempts per college).
-- This flag lets the app tell that free diagnostic apart from a quota-consuming
-- attempt without having to re-derive it from attempt ordering every time.

alter table mock_test_attempts
  add column if not exists is_pretest boolean not null default false;
