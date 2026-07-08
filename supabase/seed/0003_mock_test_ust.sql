-- USTET full-length mock test.
-- Section data from official/documented source:
--   1. Mental Ability:         30 min,  57/80 questions  → mapped to reading-comprehension
--   2. English Proficiency:    45 min,  53/80 questions  → mapped to language-proficiency
--   3. Mathematics Proficiency:45 min,  22/60 questions  → mapped to mathematics
--   4. Science Proficiency:    45 min,  41/80 questions  → mapped to science
--   TOTAL:                    165 min, 173/300 questions
-- question_count uses the max (denominator) from the official table.
--
-- Note: USTET's "Mental Ability" section covers passage-based comprehension and logical
-- reasoning items, mapped here to the reading-comprehension subject slug.
--
-- NOTE: subject_id is left null in each section_config entry below because the
-- actual subject UUIDs are only known after 0001_colleges_subjects.sql has been
-- applied. After seeding, manually update each section's "subject_id" to the
-- corresponding row from `subjects` (college slug 'ust': reading-comprehension,
-- language-proficiency, mathematics, science).

insert into mock_tests (college_id, name, time_limit_minutes, section_config)
select id, 'USTET Full Mock Test', 165,
  '[
    {"subject_id": null, "name": "Mental Ability",          "minutes": 30, "question_count": 80},
    {"subject_id": null, "name": "English Proficiency",     "minutes": 45, "question_count": 80},
    {"subject_id": null, "name": "Mathematics Proficiency", "minutes": 45, "question_count": 60},
    {"subject_id": null, "name": "Science Proficiency",     "minutes": 45, "question_count": 80}
  ]'::jsonb
from colleges where slug = 'ust';
