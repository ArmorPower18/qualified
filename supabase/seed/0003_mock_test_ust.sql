-- USTET full-length mock test, modeled on the publicly reported format of the University
-- of Santo Tomas Entrance Test: three 45-minute major subtests (Language
-- Proficiency/English, Mathematics, Science) plus a Reading Comprehension /
-- Mental Ability subtest, for a total testing time of roughly 3 hours 45 minutes.
-- Exact item counts vary across public reviewer sources; the numbers below are
-- representative approximations for mock-test purposes, not an official spec.
--
-- NOTE: subject_id is left null in each section_config entry below because the
-- actual subject UUIDs are only known after 0001_colleges_subjects.sql has been
-- applied. After seeding, manually update each section's "subject_id" to the
-- corresponding row from `subjects` (college slug 'ust': language-proficiency,
-- mathematics, science, reading-comprehension).

insert into mock_tests (college_id, name, time_limit_minutes, section_config)
select id, 'USTET Full Mock Test', 225,
  '[
    {"subject_id": null, "name": "Language Proficiency", "minutes": 45, "question_count": 50},
    {"subject_id": null, "name": "Mathematics", "minutes": 45, "question_count": 60},
    {"subject_id": null, "name": "Science", "minutes": 45, "question_count": 60},
    {"subject_id": null, "name": "Reading Comprehension", "minutes": 30, "question_count": 40}
  ]'::jsonb
from colleges where slug = 'ust';
