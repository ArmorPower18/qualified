-- Updates existing mock_test rows to reflect accurate section configs from official sources.
-- Run this against the live Supabase instance to patch the already-seeded data.

-- =========================================================
-- UPCAT — 200 min total, 144/250 max questions
-- =========================================================
update mock_tests
set
  name = 'UPCAT Full Mock Test',
  time_limit_minutes = 200,
  section_config = '[
    {"subject_id": null, "name": "Language Proficiency",    "minutes": 45, "question_count": 80},
    {"subject_id": null, "name": "Science Proficiency",     "minutes": 40, "question_count": 45},
    {"subject_id": null, "name": "Mathematics Proficiency", "minutes": 55, "question_count": 45},
    {"subject_id": null, "name": "Reading Comprehension",   "minutes": 60, "question_count": 80}
  ]'::jsonb
where college_id = (select id from colleges where slug = 'up');

-- =========================================================
-- ACET — 185 min total, 136/280 max questions (7 sections)
-- =========================================================
update mock_tests
set
  name = 'ACET Full Mock Test',
  time_limit_minutes = 185,
  section_config = '[
    {"subject_id": null, "name": "English Proficiency",     "minutes": 40, "question_count": 75},
    {"subject_id": null, "name": "Mathematics Proficiency", "minutes": 60, "question_count": 60},
    {"subject_id": null, "name": "Abstract Reasoning",      "minutes": 10, "question_count": 30},
    {"subject_id": null, "name": "Reading Comprehension",   "minutes": 25, "question_count": 30},
    {"subject_id": null, "name": "Verbal Analogy",          "minutes":  5, "question_count": 25},
    {"subject_id": null, "name": "Logical Reasoning",       "minutes": 15, "question_count": 30},
    {"subject_id": null, "name": "Numerical Ability",       "minutes": 30, "question_count": 30}
  ]'::jsonb
where college_id = (select id from colleges where slug = 'admu');

-- =========================================================
-- DCAT — 240 min total, 152/250 max questions (6 sections)
-- =========================================================
update mock_tests
set
  name = 'DCAT Full Mock Test',
  time_limit_minutes = 240,
  section_config = '[
    {"subject_id": null, "name": "Mental Ability",            "minutes": 40, "question_count": 40},
    {"subject_id": null, "name": "Writing Skills & Language", "minutes": 30, "question_count": 40},
    {"subject_id": null, "name": "Mathematics Proficiency",   "minutes": 50, "question_count": 45},
    {"subject_id": null, "name": "Science Proficiency",       "minutes": 50, "question_count": 50},
    {"subject_id": null, "name": "Reading Comprehension",     "minutes": 30, "question_count": 30},
    {"subject_id": null, "name": "Statistics & Probability",  "minutes": 40, "question_count": 45}
  ]'::jsonb
where college_id = (select id from colleges where slug = 'dlsu');

-- =========================================================
-- USTET — 165 min total, 173/300 max questions
-- =========================================================
update mock_tests
set
  name = 'USTET Full Mock Test',
  time_limit_minutes = 165,
  section_config = '[
    {"subject_id": null, "name": "Mental Ability",          "minutes": 30, "question_count": 80},
    {"subject_id": null, "name": "English Proficiency",     "minutes": 45, "question_count": 80},
    {"subject_id": null, "name": "Mathematics Proficiency", "minutes": 45, "question_count": 60},
    {"subject_id": null, "name": "Science Proficiency",     "minutes": 45, "question_count": 80}
  ]'::jsonb
where college_id = (select id from colleges where slug = 'ust');
