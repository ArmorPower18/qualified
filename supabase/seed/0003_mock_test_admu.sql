-- ACET Full Mock Test.
-- Section data from official/documented source:
--   1. English Proficiency:    40 min,  52/75 questions  → mapped to verbal-ability
--   2. Mathematics Proficiency:60 min,  24/60 questions  → mapped to mathematical-ability
--   3. Abstract Reasoning:     10 min,  15/30 questions  → mapped to verbal-ability (combined)
--   4. Reading Comprehension:  25 min,  20/30 questions  → mapped to verbal-ability (combined)
--   5. Verbal Analogy:          5 min,   6/25 questions  → mapped to verbal-ability (combined)
--   6. Logical Reasoning:      15 min,   5/30 questions  → mapped to verbal-ability (combined)
--   7. Numerical Ability:      30 min,  14/30 questions  → mapped to mathematical-ability (combined)
--   TOTAL:                    185 min, 136/280 questions
--
-- The ACET has 7 sub-sections but this app models it with 4 subject slugs.
-- Sections 1, 3, 4, 5, 6 (all verbal/language/reasoning) are consolidated into verbal-ability.
-- Sections 2 and 7 (math) are consolidated into mathematical-ability.
-- Science and Essay Writing use their own subject slugs (no official sub-section data available
-- for those; times below are the remainder after the 7 documented sections).
-- question_count uses the max (denominator) from the official table where available.
--
-- NOTE: subject_id is intentionally left null — update after seeding via:
--   select id, slug from subjects s join colleges c on c.id = s.college_id where c.slug = 'admu';

insert into mock_tests (college_id, name, time_limit_minutes, section_config)
select id, 'ACET Full Mock Test', 185,
  '[
    {"subject_id": null, "name": "English Proficiency",    "minutes": 40, "question_count": 75},
    {"subject_id": null, "name": "Mathematics Proficiency","minutes": 60, "question_count": 60},
    {"subject_id": null, "name": "Abstract Reasoning",     "minutes": 10, "question_count": 30},
    {"subject_id": null, "name": "Reading Comprehension",  "minutes": 25, "question_count": 30},
    {"subject_id": null, "name": "Verbal Analogy",         "minutes":  5, "question_count": 25},
    {"subject_id": null, "name": "Logical Reasoning",      "minutes": 15, "question_count": 30},
    {"subject_id": null, "name": "Numerical Ability",      "minutes": 30, "question_count": 30}
  ]'::jsonb
from colleges where slug = 'admu';
