-- Mock test seed for DLSU / DCAT.
-- Public sources describe the DCAT as a multiple-choice exam lasting roughly 2 to 3 hours total,
-- covering aptitude/verbal-logical reasoning, quantitative reasoning (math), reading comprehension
-- (including data analysis), and science, plus a values/situational component. Exact current
-- per-section item counts and minute allocations are not published by DLSU, so the section_config
-- below is a reasonable representative approximation (not an official DLSU document) built from the
-- ~2.5 hour total duration and typical CET section sizes. Review and adjust against official DCAT
-- guidelines before treating this as exam-accurate.
--
-- NOTE: "subject_id" is intentionally left null in each section below because subject UUIDs are not
-- known at seed time. After running this seed, manually update mock_tests.section_config to set each
-- subject_id to the matching row in `subjects` (join on slug: reading-comprehension, verbal-reasoning,
-- quantitative-reasoning, science) for college slug 'dlsu'.

insert into mock_tests (college_id, name, time_limit_minutes, section_config)
select id, 'DCAT Full Mock Test', 150,
  '[
    {"subject_id": null, "name": "Reading Comprehension", "minutes": 35, "question_count": 30},
    {"subject_id": null, "name": "Verbal Reasoning", "minutes": 40, "question_count": 40},
    {"subject_id": null, "name": "Quantitative Reasoning", "minutes": 45, "question_count": 35},
    {"subject_id": null, "name": "Science", "minutes": 30, "question_count": 30}
  ]'::jsonb
from colleges where slug = 'dlsu';
