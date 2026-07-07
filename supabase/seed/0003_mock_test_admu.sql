-- ACET Full Mock Test.
-- Research note: publicly available sources (ateneo.edu admissions FAQ, upcatchampion.com,
-- review.ahead.edu.ph, collegedunia ACET exam pattern, assorted reviewer PDFs) consistently
-- describe the ACET as a timed, multiple-choice test spanning roughly half a day when combined
-- with the essay and testing logistics, with commonly cited approximate figures of ~90-100
-- multiple-choice items across Verbal Ability, Mathematical Ability, and Science, plus one timed
-- essay (often cited around 30 minutes). Exact minute-by-minute section breakdowns are NOT
-- consistently published and vary by test-taker account/year, so the section_config below is a
-- best-effort, internally consistent approximation for seed/demo purposes and should be verified
-- against the latest official ACET bulletin before being treated as authoritative.
--
-- NOTE: subject_id is intentionally left null in each section_config entry below because subject
-- UUIDs are not known at seed-authoring time. After running this seed, manually update each
-- section's "subject_id" to the corresponding row in `subjects` (college slug 'admu': slugs
-- verbal-ability, mathematical-ability, science, essay-writing).

insert into mock_tests (college_id, name, time_limit_minutes, section_config)
select id, 'ACET Full Mock Test', 180,
  '[
    {"subject_id": null, "name": "Verbal Ability", "minutes": 50, "question_count": 40},
    {"subject_id": null, "name": "Mathematical Ability", "minutes": 50, "question_count": 35},
    {"subject_id": null, "name": "Science", "minutes": 40, "question_count": 25},
    {"subject_id": null, "name": "Essay Writing", "minutes": 40, "question_count": 1}
  ]'::jsonb
from colleges where slug = 'admu';
