-- Seed the Big 4 colleges and their CET subjects.
-- Question/video content is seeded separately in 0002_questions.sql (research-sourced, AI-drafted, needs human review).

insert into colleges (slug, name, exam_name, description, is_custom) values
  ('up', 'University of the Philippines', 'UPCAT', 'UP College Admission Test', false),
  ('admu', 'Ateneo de Manila University', 'ACET', 'Ateneo College Entrance Test', false),
  ('dlsu', 'De La Salle University', 'DCAT', 'DLSU College Admission Test', false),
  ('ust', 'University of Santo Tomas', 'USTET', 'UST Entrance Test', false);

-- UPCAT subjects
insert into subjects (college_id, slug, name, description, sort_order)
select id, s.slug, s.name, s.description, s.sort_order
from colleges, (values
  ('reading-comprehension', 'Reading Comprehension', 'English and Filipino reading passages with inference questions', 1),
  ('language-proficiency', 'Language Proficiency', 'Grammar, vocabulary, and sentence construction in English and Filipino', 2),
  ('mathematics', 'Mathematics', 'Algebra, geometry, and word problems', 3),
  ('science', 'Science', 'General biology, chemistry, physics, and earth science', 4)
) as s(slug, name, description, sort_order)
where colleges.slug = 'up';

-- ACET subjects
insert into subjects (college_id, slug, name, description, sort_order)
select id, s.slug, s.name, s.description, s.sort_order
from colleges, (values
  ('verbal-ability', 'Verbal Ability', 'Vocabulary, analogies, and reading comprehension', 1),
  ('mathematical-ability', 'Mathematical Ability', 'Algebra, geometry, and quantitative reasoning', 2),
  ('science', 'Science', 'Biology, chemistry, and physics concepts', 3),
  ('essay-writing', 'Essay Writing', 'Timed essay prompts assessing written communication', 4)
) as s(slug, name, description, sort_order)
where colleges.slug = 'admu';

-- DCAT subjects
insert into subjects (college_id, slug, name, description, sort_order)
select id, s.slug, s.name, s.description, s.sort_order
from colleges, (values
  ('reading-comprehension', 'Reading Comprehension', 'English passages, data-analysis reading, and critical reading', 1),
  ('verbal-reasoning', 'Verbal Reasoning', 'Vocabulary, analogies, grammar/usage, and verbal-logical reasoning (patterns, sequences, abstract/logical reasoning)', 2),
  ('quantitative-reasoning', 'Quantitative Reasoning', 'Algebra, geometry, word problems, statistics/probability, and numerical/abstract reasoning', 3),
  ('science', 'Science', 'General biology, chemistry, physics, and earth science concepts', 4)
) as s(slug, name, description, sort_order)
where colleges.slug = 'dlsu';

-- USTET subjects
-- Descriptions updated based on public USTET reviewer/coverage guides: the exam has
-- major subtests in Language Proficiency (English/Filipino grammar, vocabulary,
-- spelling), Mathematics (arithmetic through basic trigonometry/statistics), Science
-- (biology, chemistry, physics, earth science/astronomy), and a Reading
-- Comprehension / Mental Ability subtest (passage-based comprehension and logical
-- reasoning). Item counts and minutes vary by source; see 0003_mock_test_ust.sql.
insert into subjects (college_id, slug, name, description, sort_order)
select id, s.slug, s.name, s.description, s.sort_order
from colleges, (values
  ('language-proficiency', 'Language Proficiency', 'English and Filipino grammar, vocabulary, spelling, and sentence construction', 1),
  ('mathematics', 'Mathematics', 'Arithmetic, algebra, geometry, basic statistics, and trigonometry', 2),
  ('science', 'Science', 'Biology, chemistry, physics, and earth science/astronomy concepts', 3),
  ('reading-comprehension', 'Reading Comprehension', 'Passage-based comprehension, inference, and mental ability questions', 4)
) as s(slug, name, description, sort_order)
where colleges.slug = 'ust';
