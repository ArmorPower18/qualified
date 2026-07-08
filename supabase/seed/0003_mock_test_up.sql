-- Mock test config for UPCAT.
-- Section data from official/documented source:
--   1. Language Proficiency:   45 min,  46/80 questions
--   2. Science Proficiency:    40 min,  29/45 questions
--   3. Mathematics Proficiency:55 min,  21/45 questions
--   4. Reading Comprehension:  60 min,  48/80 questions
--   TOTAL:                    200 min, 144/250 questions
-- question_count below uses the max (denominator) from the official table.
--
-- LIMITATION: "subject_id" in section_config is left null because subject UUIDs are
-- generated at insert time and unknown here. After seeding subjects (0001) and running
-- this file, manually update mock_tests.section_config to set each subject_id via:
--   select id, slug from subjects s join colleges c on c.id = s.college_id where c.slug = 'up';
-- and then patching the jsonb array entries accordingly.

insert into mock_tests (college_id, name, time_limit_minutes, section_config)
select id, 'UPCAT Full Mock Test', 200,
  '[
    {"subject_id": null, "name": "Language Proficiency",    "minutes": 45, "question_count": 80},
    {"subject_id": null, "name": "Science Proficiency",     "minutes": 40, "question_count": 45},
    {"subject_id": null, "name": "Mathematics Proficiency", "minutes": 55, "question_count": 45},
    {"subject_id": null, "name": "Reading Comprehension",   "minutes": 60, "question_count": 80}
  ]'::jsonb
from colleges where slug = 'up';
