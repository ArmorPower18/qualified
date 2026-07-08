-- Rename exam-scoped subject_areas to match official exam section names from
-- each university's published test structure.
--
-- Strategy: use UPDATE (not delete/re-insert) so any existing lessons/modules/
-- review_questions that foreign-key to these rows are preserved untouched.
-- New subject_areas are inserted for sections that didn't exist yet.
-- Modules belonging to collapsed areas are re-parented to the new unified area.
--
-- Official structures (from screenshots):
--   UPCAT  : Language Proficiency | Science Proficiency | Mathematics Proficiency | Reading Comprehension
--   ACET   : English Proficiency | Mathematics Proficiency | Abstract Reasoning |
--             Reading Comprehension | Verbal Analogy | Logical Reasoning | Numerical Ability
--   DCAT   : Mental Ability | Writing Skills & Language Proficiency | Mathematics Proficiency |
--             Science Proficiency | Reading Comprehension | Statistics & Probability
--   USTET  : Mental Ability | English Proficiency | Mathematics Proficiency | Science Proficiency

-- ================================================================
-- UPCAT  (scope = 'up')
-- ================================================================

-- Rename existing areas to official names
update subject_areas set slug = 'language-proficiency',   name = 'Language Proficiency',   sort_order = 0 where scope = 'up' and slug = 'language-and-reading';
update subject_areas set slug = 'mathematics-proficiency', name = 'Mathematics Proficiency', sort_order = 2 where scope = 'up' and slug = 'mathematics';

-- Collapse the 4 science subjects (earth-science, biology, chemistry, physics)
-- into a single "Science Proficiency" area.
-- Keep earth-science row as the anchor, re-parent the other 3's modules to it,
-- then delete the now-empty duplicate areas.

-- Re-parent biology, chemistry, physics modules → earth-science (becoming Science Proficiency)
update modules
set subject_area_id = (select id from subject_areas where scope = 'up' and slug = 'earth-science')
where subject_area_id in (
  select id from subject_areas where scope = 'up' and slug in ('biology', 'chemistry', 'physics')
);

-- Now rename earth-science → science-proficiency
update subject_areas set slug = 'science-proficiency', name = 'Science Proficiency', sort_order = 1 where scope = 'up' and slug = 'earth-science';

-- Delete the now-empty duplicate science areas
delete from subject_areas where scope = 'up' and slug in ('biology', 'chemistry', 'physics');

-- Add Reading Comprehension (new section for UPCAT)
insert into subject_areas (scope, slug, name, sort_order)
values ('up', 'reading-comprehension', 'Reading Comprehension', 3)
on conflict (scope, slug) do update set name = excluded.name, sort_order = excluded.sort_order;


-- ================================================================
-- ACET  (scope = 'admu')
-- ================================================================

-- Rename existing areas
update subject_areas set slug = 'english-proficiency',    name = 'English Proficiency',    sort_order = 0 where scope = 'admu' and slug = 'english-and-reading';
update subject_areas set slug = 'mathematics-proficiency', name = 'Mathematics Proficiency', sort_order = 1 where scope = 'admu' and slug = 'mathematical-proficiency';

-- The old 'logical-reasoning' area gets renamed to 'Logical Reasoning' (official name)
-- and the other 3 new ACET sections are inserted fresh.
update subject_areas set slug = 'logical-reasoning', name = 'Logical Reasoning', sort_order = 5 where scope = 'admu' and slug = 'logical-reasoning';

insert into subject_areas (scope, slug, name, sort_order) values
  ('admu', 'abstract-reasoning',  'Abstract Reasoning',  2),
  ('admu', 'reading-comprehension','Reading Comprehension', 3),
  ('admu', 'verbal-analogy',       'Verbal Analogy',       4),
  ('admu', 'numerical-ability',    'Numerical Ability',    6)
on conflict (scope, slug) do update set name = excluded.name, sort_order = excluded.sort_order;


-- ================================================================
-- DCAT  (scope = 'dlsu')
-- ================================================================

-- Rename existing areas
update subject_areas set slug = 'writing-skills-language', name = 'Writing Skills & Language Proficiency', sort_order = 1 where scope = 'dlsu' and slug = 'writing-and-reading';
update subject_areas set slug = 'mathematics-proficiency',  name = 'Mathematics Proficiency',              sort_order = 2 where scope = 'dlsu' and slug = 'mathematics';
update subject_areas set slug = 'statistics-probability',   name = 'Statistics & Probability',             sort_order = 5 where scope = 'dlsu' and slug = 'statistics';

-- Collapse earth-science, biology, chemistry, physics → Science Proficiency
-- (same pattern as UPCAT above)
update modules
set subject_area_id = (select id from subject_areas where scope = 'dlsu' and slug = 'earth-science')
where subject_area_id in (
  select id from subject_areas where scope = 'dlsu' and slug in ('biology', 'chemistry', 'physics')
);

update subject_areas set slug = 'science-proficiency', name = 'Science Proficiency', sort_order = 3 where scope = 'dlsu' and slug = 'earth-science';
delete from subject_areas where scope = 'dlsu' and slug in ('biology', 'chemistry', 'physics');

-- Add new sections
insert into subject_areas (scope, slug, name, sort_order) values
  ('dlsu', 'mental-ability',       'Mental Ability',        0),
  ('dlsu', 'reading-comprehension','Reading Comprehension', 4)
on conflict (scope, slug) do update set name = excluded.name, sort_order = excluded.sort_order;


-- ================================================================
-- USTET  (scope = 'ust')
-- ================================================================

-- Rename existing areas
update subject_areas set slug = 'english-proficiency',    name = 'English Proficiency',    sort_order = 1 where scope = 'ust' and slug = 'english';
update subject_areas set slug = 'science-proficiency',    name = 'Science Proficiency',    sort_order = 3 where scope = 'ust' and slug = 'science';

-- Re-parent communication modules → mental-ability (to be created), then delete
-- communication area (Mental Ability absorbs general aptitude content).
-- First insert mental-ability, then re-parent.
insert into subject_areas (scope, slug, name, sort_order)
values ('ust', 'mental-ability', 'Mental Ability', 0)
on conflict (scope, slug) do update set name = excluded.name, sort_order = excluded.sort_order;

update modules
set subject_area_id = (select id from subject_areas where scope = 'ust' and slug = 'mental-ability')
where subject_area_id = (select id from subject_areas where scope = 'ust' and slug = 'communication');

delete from subject_areas where scope = 'ust' and slug = 'communication';

-- Add Mathematics Proficiency (new for USTET)
insert into subject_areas (scope, slug, name, sort_order)
values ('ust', 'mathematics-proficiency', 'Mathematics Proficiency', 2)
on conflict (scope, slug) do update set name = excluded.name, sort_order = excluded.sort_order;
