-- Mock test seed for DLSU / DCAT.
-- Section data from official/documented source:
--   1. Mental Ability:              40 min,  23/40 questions  → mapped to verbal-reasoning
--   2. Writing Skills & Language:   30 min,  24/40 questions  → mapped to reading-comprehension
--   3. Mathematics Proficiency:     50 min,  27/45 questions  → mapped to quantitative-reasoning
--   4. Science Proficiency:         50 min,  30/50 questions  → mapped to science
--   5. Reading Comprehension:       30 min,  22/30 questions  → mapped to reading-comprehension (combined)
--   6. Statistics & Probability:    40 min,  26/45 questions  → mapped to quantitative-reasoning (combined)
--   TOTAL:                         240 min, 152/250 questions
--
-- The DCAT has 6 sub-sections but this app models it with 4 subject slugs.
-- Sections 2 and 5 (language/reading) are consolidated into reading-comprehension.
-- Sections 1 (mental ability/logic) maps to verbal-reasoning.
-- Sections 3 and 6 (math + stats) are consolidated into quantitative-reasoning.
-- question_count uses the max (denominator) from the official table.
--
-- NOTE: "subject_id" is intentionally left null — update after seeding via:
--   select id, slug from subjects s join colleges c on c.id = s.college_id where c.slug = 'dlsu';

insert into mock_tests (college_id, name, time_limit_minutes, section_config)
select id, 'DCAT Full Mock Test', 240,
  '[
    {"subject_id": null, "name": "Mental Ability",               "minutes": 40, "question_count": 40},
    {"subject_id": null, "name": "Writing Skills & Language",    "minutes": 30, "question_count": 40},
    {"subject_id": null, "name": "Mathematics Proficiency",      "minutes": 50, "question_count": 45},
    {"subject_id": null, "name": "Science Proficiency",          "minutes": 50, "question_count": 50},
    {"subject_id": null, "name": "Reading Comprehension",        "minutes": 30, "question_count": 30},
    {"subject_id": null, "name": "Statistics & Probability",     "minutes": 40, "question_count": 45}
  ]'::jsonb
from colleges where slug = 'dlsu';
