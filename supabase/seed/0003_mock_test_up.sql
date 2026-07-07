-- Mock test config for UPCAT, based on publicly reported UPCAT subtest timings/item counts:
--   Reading Comprehension: 30 items / 30 minutes
--   Language Proficiency:  40 items / 30 minutes
--   Mathematics:           60 items / 75 minutes
--   Science:               60 items / 50 minutes
--   Total: 190 items / 185 minutes of actual testing time
--   (Actual on-site UPCAT day runs ~4-5 hours including registration, orientation,
--    and breaks between subtests; the time_limit_minutes below reflects testing time only.)
--
-- LIMITATION: "subject_id" in section_config is left null because subject UUIDs are
-- generated at insert time and unknown here. After seeding subjects (0001) and running
-- this file, manually update mock_tests.section_config to set each subject_id via:
--   select id, slug from subjects s join colleges c on c.id = s.college_id where c.slug = 'up';
-- and then patching the jsonb array entries accordingly.

insert into mock_tests (college_id, name, time_limit_minutes, section_config)
select id, 'UPCAT Full Mock Test', 185,
  '[
    {"subject_id": null, "name": "Reading Comprehension", "minutes": 30, "question_count": 30},
    {"subject_id": null, "name": "Language Proficiency", "minutes": 30, "question_count": 40},
    {"subject_id": null, "name": "Mathematics", "minutes": 75, "question_count": 60},
    {"subject_id": null, "name": "Science", "minutes": 50, "question_count": 60}
  ]'::jsonb
from colleges where slug = 'up';
