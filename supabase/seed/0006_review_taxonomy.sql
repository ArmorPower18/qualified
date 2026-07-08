-- Review-system taxonomy: subject areas, modules, and lessons.
-- Two kinds of trees, distinguished by subject_areas.scope:
--   'general'   -- the full cross-textbook topic list (topics.docx) used by
--                  General Review and Flashcards (not exam-specific).
--   '<college>' -- one tree per Big-4 college (matches colleges.slug: up, admu,
--                  dlsu, ust), containing only that exam's priority topics, used
--                  by Exam Focus Review.
-- Auto-generated from the uploaded reference docs — do not hand-edit structure.

insert into subject_areas (scope, slug, name, sort_order) values
  ('general', 'biology', 'Biology', 0),
  ('general', 'chemistry', 'Chemistry', 1),
  ('general', 'earth-science', 'Earth Science', 2),
  ('general', 'physics', 'Physics', 3),
  ('general', 'mathematics', 'Mathematics (ACTs Math Reviewer)', 4),
  ('general', 'reading-and-writing', 'Reading & Writing', 5),
  ('general', 'reasoning', 'Reasoning', 6),
  ('general', 'communication', 'Communication', 7),
  ('general', 'language', 'Language (Filipino & English Grammar)', 8),
  ('up', 'language-and-reading', 'Language & Reading', 0),
  ('up', 'earth-science', 'Earth Science', 1),
  ('up', 'biology', 'Biology', 2),
  ('up', 'chemistry', 'Chemistry', 3),
  ('up', 'physics', 'Physics', 4),
  ('up', 'mathematics', 'Mathematics', 5),
  ('ust', 'english', 'English', 0),
  ('ust', 'communication', 'Communication', 1),
  ('ust', 'science', 'Science', 2),
  ('admu', 'english-and-reading', 'English & Reading', 0),
  ('admu', 'mathematical-proficiency', 'Mathematical Proficiency', 1),
  ('admu', 'logical-reasoning', 'Logical Reasoning', 2),
  ('dlsu', 'writing-and-reading', 'Writing & Reading', 0),
  ('dlsu', 'mathematics', 'Mathematics', 1),
  ('dlsu', 'statistics', 'Statistics', 2),
  ('dlsu', 'earth-science', 'Earth Science', 3),
  ('dlsu', 'biology', 'Biology', 4),
  ('dlsu', 'chemistry', 'Chemistry', 5),
  ('dlsu', 'physics', 'Physics', 6);

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('evolution-and-taxonomy', 'Evolution & Taxonomy', 0),
  ('animal-anatomy-and-physiology-i', 'Animal Anatomy & Physiology I', 1),
  ('ecology', 'Ecology', 2),
  ('plant-anatomy-and-physiology', 'Plant Anatomy & Physiology', 3),
  ('metabolism', 'Metabolism', 4),
  ('genetics-i', 'Genetics I', 5),
  ('biology-the-study-of-life', 'Biology, The Study of Life', 6),
  ('genetics-ii', 'Genetics II', 7),
  ('the-cell', 'The Cell', 8),
  ('animal-anatomy-and-physiology-ii', 'Animal Anatomy & Physiology II', 9),
  ('the-cell-cycle', 'The Cell Cycle', 10)
) as m(slug, name, sort_order)
where sa.scope = 'general' and sa.slug = 'biology';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('names-and-formulas-of-chemical-compounds', 'Names & Formulas of Chemical Compounds', 0),
  ('chemical-accounting-stoichiometry', 'Chemical Accounting - Stoichiometry', 1),
  ('elements-and-compounds', 'Elements and Compounds', 2),
  ('mixture-of-substances', 'Mixture of Substances', 3),
  ('acids-and-bases', 'Acids and Bases', 4),
  ('mole-concept', 'Mole Concept', 5),
  ('chemical-bonding', 'Chemical Bonding', 6),
  ('the-periodic-table-of-elements', 'The Periodic Table of Elements', 7),
  ('chemical-reactions', 'Chemical Reactions', 8),
  ('solids-liquids-and-gases', 'Solids, Liquids, and Gases', 9),
  ('electron-configuration', 'Electron Configuration', 10)
) as m(slug, name, sort_order)
where sa.scope = 'general' and sa.slug = 'chemistry';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('the-universe', 'The Universe', 0),
  ('the-spheres-of-the-earth', 'The Spheres of the Earth', 1),
  ('plate-tectonics', 'Plate Tectonics', 2),
  ('earth-s-dynamic-atmosphere', 'Earth''s Dynamic Atmosphere', 3),
  ('earth-s-crust', 'Earth''s Crust', 4),
  ('the-earth-and-the-moon', 'The Earth and the Moon', 5)
) as m(slug, name, sort_order)
where sa.scope = 'general' and sa.slug = 'earth-science';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('fluids', 'Fluids', 0),
  ('forces-and-newton-s-laws-of-motion', 'Forces and Newton''s Laws of Motion', 1),
  ('motion-along-a-straight-line', 'Motion Along a Straight Line', 2),
  ('scalars-and-vectors', 'Scalars and Vectors', 3),
  ('work-power-and-energy', 'Work, Power, and Energy', 4),
  ('circular-motion-and-gravitation', 'Circular Motion and Gravitation', 5),
  ('projectile-motion', 'Projectile Motion', 6),
  ('electric-circuits-and-magnets', 'Electric Circuits and Magnets', 7),
  ('momentum-and-collisions', 'Momentum and Collisions', 8),
  ('waves-mirrors-and-lenses', 'Waves, Mirrors, and Lenses', 9)
) as m(slug, name, sort_order)
where sa.scope = 'general' and sa.slug = 'physics';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('trigonometry', 'Trigonometry', 0),
  ('calculus', 'Calculus', 1),
  ('functions', 'Functions', 2),
  ('statistics', 'Statistics', 3),
  ('geometry', 'Geometry', 4),
  ('word-problems', 'Word Problems', 5),
  ('algebra', 'Algebra', 6)
) as m(slug, name, sort_order)
where sa.scope = 'general' and sa.slug = 'mathematics';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('essay-writing', 'Essay Writing', 0),
  ('reading-comprehension', 'Reading Comprehension', 1),
  ('organization', 'Organization', 2),
  ('academic-writing', 'Academic Writing', 3)
) as m(slug, name, sort_order)
where sa.scope = 'general' and sa.slug = 'reading-and-writing';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('math-logic', 'Math Logic', 0),
  ('number-and-letter-sequences', 'Number and Letter Sequences', 1),
  ('rules-of-inference-and-methods-of-proof', 'Rules of Inference & Methods of Proof', 2),
  ('logical-fallacies', 'Logical Fallacies', 3),
  ('abstract-reasoning', 'Abstract Reasoning', 4),
  ('general-information', 'General Information', 5),
  ('propositions', 'Propositions', 6),
  ('induction-and-abduction', 'Induction & Abduction', 7),
  ('deduction', 'Deduction', 8)
) as m(slug, name, sort_order)
where sa.scope = 'general' and sa.slug = 'reasoning';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('communicative-functions-and-strategies', 'Communicative Functions & Strategies', 0),
  ('letters-and-resumes', 'Letters & Resumes', 1),
  ('types-of-speeches', 'Types of Speeches', 2),
  ('nature-and-elements-of-communication', 'Nature & Elements of Communication', 3),
  ('culture-and-communication', 'Culture & Communication', 4)
) as m(slug, name, sort_order)
where sa.scope = 'general' and sa.slug = 'communication';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('vocabulary', 'Vocabulary', 0),
  ('subject-verb-agreement', 'Subject-Verb Agreement', 1),
  ('modifiers', 'Modifiers', 2),
  ('contractions-pagdadaglat', 'Contractions (Pagdadaglat)', 3),
  ('articles-nouns-and-pronouns', 'Articles, Nouns & Pronouns', 4),
  ('conjunctions-and-transitions', 'Conjunctions and Transitions', 5),
  ('ingklitik', 'Ingklitik', 6),
  ('verbs', 'Verbs', 7),
  ('punctuation', 'Punctuation', 8),
  ('parallelism', 'Parallelism', 9),
  ('prepositions', 'Prepositions', 10),
  ('filipino-word-transitions', 'Filipino Word Transitions', 11)
) as m(slug, name, sort_order)
where sa.scope = 'general' and sa.slug = 'language';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('prepositions', 'Prepositions', 0),
  ('contractions', 'Contractions', 1),
  ('verbs', 'Verbs', 2),
  ('reading-comprehension', 'Reading Comprehension', 3),
  ('conjunctions-and-transitions', 'Conjunctions & Transitions', 4),
  ('subject-verb-agreement', 'Subject-Verb Agreement', 5),
  ('modifiers', 'Modifiers', 6),
  ('vocabulary', 'Vocabulary', 7),
  ('parallelism', 'Parallelism', 8),
  ('filipino-word-transition', 'Filipino Word Transition', 9),
  ('punctuation', 'Punctuation', 10),
  ('ingklitik', 'Ingklitik', 11),
  ('articles-nouns-and-pronouns', 'Articles, Nouns & Pronouns', 12),
  ('organization', 'Organization', 13)
) as m(slug, name, sort_order)
where sa.scope = 'up' and sa.slug = 'language-and-reading';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('the-earth-and-the-moon', 'The Earth and the Moon', 0),
  ('earth-s-dynamic-atmosphere', 'Earth''s Dynamic Atmosphere', 1),
  ('plate-tectonics', 'Plate Tectonics', 2),
  ('the-spheres-of-the-earth', 'The Spheres of the Earth', 3),
  ('geological-forces', 'Geological Forces', 4),
  ('the-earth-s-crust', 'The Earth''s Crust', 5)
) as m(slug, name, sort_order)
where sa.scope = 'up' and sa.slug = 'earth-science';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('genetics-i', 'Genetics I', 0),
  ('biology-the-study-of-life', 'Biology, The Study of Life', 1),
  ('the-cell', 'The Cell', 2),
  ('genetics-ii', 'Genetics II', 3),
  ('evolution-and-taxonomy', 'Evolution & Taxonomy', 4),
  ('plant-anatomy-and-physiology', 'Plant Anatomy & Physiology', 5),
  ('animal-anatomy-and-physiology-i', 'Animal Anatomy & Physiology I', 6)
) as m(slug, name, sort_order)
where sa.scope = 'up' and sa.slug = 'biology';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('naming-compounds', 'Naming Compounds', 0),
  ('organic-chemistry', 'Organic Chemistry', 1),
  ('chemical-reactions', 'Chemical Reactions', 2),
  ('stoichiometry', 'Stoichiometry', 3),
  ('periodic-table-of-elements', 'Periodic Table of Elements', 4),
  ('solids-liquids-and-gases', 'Solids, Liquids, and Gases', 5),
  ('mole-concept', 'Mole Concept', 6),
  ('electron-configuration', 'Electron Configuration', 7),
  ('the-language-of-science', 'The Language of Science', 8),
  ('elements-and-compounds', 'Elements and Compounds', 9),
  ('mixture-of-substances', 'Mixture of Substances', 10)
) as m(slug, name, sort_order)
where sa.scope = 'up' and sa.slug = 'chemistry';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('electric-circuits-and-magnets', 'Electric Circuits and Magnets', 0),
  ('forces-and-newton-s-laws-of-motion', 'Forces and Newton''s Laws of Motion', 1),
  ('circular-motion-and-gravitation', 'Circular Motion and Gravitation', 2),
  ('scalars-and-vectors', 'Scalars and Vectors', 3),
  ('waves-mirrors-and-lenses', 'Waves, Mirrors, and Lenses', 4),
  ('motion-along-a-straight-line', 'Motion Along a Straight Line', 5),
  ('fluids', 'Fluids', 6),
  ('projectile-motion', 'Projectile Motion', 7),
  ('work-power-and-energy', 'Work, Power, and Energy', 8),
  ('momentum-and-collisions', 'Momentum and Collisions', 9)
) as m(slug, name, sort_order)
where sa.scope = 'up' and sa.slug = 'physics';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('algebra', 'Algebra', 0),
  ('statistics', 'Statistics', 1),
  ('word-problems', 'Word Problems', 2),
  ('geometry', 'Geometry', 3),
  ('functions', 'Functions', 4),
  ('calculus', 'Calculus', 5),
  ('trigonometry', 'Trigonometry', 6)
) as m(slug, name, sort_order)
where sa.scope = 'up' and sa.slug = 'mathematics';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('vocabulary', 'Vocabulary', 0),
  ('verbs', 'Verbs', 1),
  ('academic-writing', 'Academic Writing', 2),
  ('reading-comprehension', 'Reading Comprehension', 3),
  ('logical-fallacies', 'Logical Fallacies', 4),
  ('parallelism', 'Parallelism', 5),
  ('prepositions', 'Prepositions', 6),
  ('conjunctions-and-transitions', 'Conjunctions & Transitions', 7),
  ('articles-nouns-and-pronouns', 'Articles, Nouns & Pronouns', 8),
  ('punctuation', 'Punctuation', 9),
  ('modifiers', 'Modifiers', 10),
  ('subject-verb-agreement', 'Subject-Verb Agreement', 11),
  ('essay-writing', 'Essay Writing', 12)
) as m(slug, name, sort_order)
where sa.scope = 'ust' and sa.slug = 'english';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('letters-and-resumes', 'Letters & Resumes', 0),
  ('communicative-functions-and-strategies', 'Communicative Functions & Strategies', 1),
  ('types-of-speeches', 'Types of Speeches', 2),
  ('culture-and-communication', 'Culture & Communication', 3),
  ('nature-and-element-of-communication', 'Nature & Element of Communication', 4)
) as m(slug, name, sort_order)
where sa.scope = 'ust' and sa.slug = 'communication';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('physics', 'Physics', 0),
  ('biology', 'Biology', 1),
  ('earth-science', 'Earth Science', 2),
  ('chemistry', 'Chemistry', 3)
) as m(slug, name, sort_order)
where sa.scope = 'ust' and sa.slug = 'science';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('parallelism', 'Parallelism', 0),
  ('modifiers', 'Modifiers', 1),
  ('prepositions', 'Prepositions', 2),
  ('articles-nouns-and-pronouns', 'Articles, Nouns & Pronouns', 3),
  ('reading-comprehension', 'Reading Comprehension', 4),
  ('subject-verb-agreement', 'Subject-Verb Agreement', 5),
  ('conjunctions-and-transitions', 'Conjunctions & Transitions', 6),
  ('vocabulary', 'Vocabulary', 7),
  ('punctuation', 'Punctuation', 8),
  ('verbs', 'Verbs', 9)
) as m(slug, name, sort_order)
where sa.scope = 'admu' and sa.slug = 'english-and-reading';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('algebra-modules', 'Algebra Modules', 0),
  ('geometry-modules', 'Geometry Modules', 1),
  ('word-problem-modules', 'Word Problem Modules', 2),
  ('statistics-modules', 'Statistics Modules', 3),
  ('trigonometry-modules', 'Trigonometry Modules', 4),
  ('function-modules', 'Function Modules', 5)
) as m(slug, name, sort_order)
where sa.scope = 'admu' and sa.slug = 'mathematical-proficiency';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('deduction', 'Deduction', 0),
  ('induction-and-abduction', 'Induction & Abduction', 1)
) as m(slug, name, sort_order)
where sa.scope = 'admu' and sa.slug = 'logical-reasoning';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('vocabulary', 'Vocabulary', 0),
  ('modifiers', 'Modifiers', 1),
  ('conjunctions-and-transitions', 'Conjunctions & Transitions', 2),
  ('reading-comprehension', 'Reading Comprehension', 3),
  ('articles-nouns-and-pronouns', 'Articles, Nouns & Pronouns', 4),
  ('punctuation', 'Punctuation', 5),
  ('academic-writing', 'Academic Writing', 6),
  ('prepositions', 'Prepositions', 7),
  ('parallelism', 'Parallelism', 8),
  ('subject-verb-agreement', 'Subject-Verb Agreement', 9),
  ('verbs', 'Verbs', 10)
) as m(slug, name, sort_order)
where sa.scope = 'dlsu' and sa.slug = 'writing-and-reading';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('word-problems', 'Word Problems', 0),
  ('trigonometry', 'Trigonometry', 1)
) as m(slug, name, sort_order)
where sa.scope = 'dlsu' and sa.slug = 'mathematics';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('organizing-data', 'Organizing Data', 0),
  ('interpreting-data', 'Interpreting Data', 1),
  ('analyzing-data-fundamental-skills', 'Analyzing Data - Fundamental Skills', 2),
  ('describing-data-one-variable', 'Describing Data - One Variable', 3),
  ('describing-data-ii-two-variables', 'Describing Data II - Two Variables', 4),
  ('analyzing-data-ii-probability-distribution', 'Analyzing Data II - Probability Distribution', 5)
) as m(slug, name, sort_order)
where sa.scope = 'dlsu' and sa.slug = 'statistics';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('the-earth-and-the-moon', 'The Earth and the Moon', 0),
  ('the-spheres-of-the-earth', 'The Spheres of the Earth', 1),
  ('earth-s-dynamic-atmosphere', 'Earth''s Dynamic Atmosphere', 2),
  ('the-earth-s-crust', 'The Earth''s Crust', 3),
  ('geological-forces', 'Geological Forces', 4),
  ('plate-tectonics', 'Plate Tectonics', 5)
) as m(slug, name, sort_order)
where sa.scope = 'dlsu' and sa.slug = 'earth-science';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('animal-anatomy-and-physiology-ii', 'Animal Anatomy & Physiology II', 0),
  ('animal-anatomy-and-physiology-i', 'Animal Anatomy & Physiology I', 1),
  ('ecology', 'Ecology', 2),
  ('plant-anatomy-and-physiology', 'Plant Anatomy & Physiology', 3),
  ('the-cell', 'The Cell', 4),
  ('the-cell-cycle', 'The Cell Cycle', 5),
  ('biology-the-study-of-life', 'Biology, The Study of Life', 6),
  ('metabolism', 'Metabolism', 7),
  ('evolution-and-taxonomy', 'Evolution & Taxonomy', 8)
) as m(slug, name, sort_order)
where sa.scope = 'dlsu' and sa.slug = 'biology';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('chemical-reactions', 'Chemical Reactions', 0),
  ('mixture-of-substances', 'Mixture of Substances', 1),
  ('periodic-table-of-elements', 'Periodic Table of Elements', 2),
  ('stoichiometry', 'Stoichiometry', 3),
  ('naming-compounds', 'Naming Compounds', 4),
  ('elements-and-compounds', 'Elements and Compounds', 5),
  ('electron-configuration', 'Electron Configuration', 6)
) as m(slug, name, sort_order)
where sa.scope = 'dlsu' and sa.slug = 'chemistry';

insert into modules (subject_area_id, slug, name, sort_order)
select sa.id, m.slug, m.name, m.sort_order
from subject_areas sa, (values
  ('fluids', 'Fluids', 0),
  ('electric-circuits-and-magnets', 'Electric Circuits and Magnets', 1),
  ('work-power-and-energy', 'Work, Power, and Energy', 2),
  ('projectile-motion', 'Projectile Motion', 3),
  ('motion-along-a-straight-line', 'Motion Along a Straight Line', 4),
  ('forces-and-newton-s-laws-of-motion', 'Forces and Newton''s Laws of Motion', 5),
  ('circular-motion-and-gravitation', 'Circular Motion and Gravitation', 6),
  ('waves-mirrors-and-lenses', 'Waves, Mirrors, and Lenses', 7),
  ('scalars-and-vectors', 'Scalars and Vectors', 8),
  ('momentum-and-collisions', 'Momentum and Collisions', 9)
) as m(slug, name, sort_order)
where sa.scope = 'dlsu' and sa.slug = 'physics';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('modes-of-evolution-phyletic-branching-cladogram', 'Modes of Evolution (Phyletic, Branching, Cladogram)', 0, null),
  ('levels-of-taxonomic-classification-domain-kingdom-phylum-cla', 'Levels of Taxonomic Classification (Domain, Kingdom, Phylum, Class, Order, Family...)', 1, null),
  ('origin-of-life-chemosynthesis-theory-panspermia', 'Origin of Life (Chemosynthesis Theory, Panspermia)', 2, null),
  ('origin-of-species-theory-on-natural-selection', 'Origin of Species (Theory on Natural Selection)', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'biology' and mo.slug = 'evolution-and-taxonomy';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('integumentary-muscular-skeletal-systems', 'Integumentary, Muscular, Skeletal Systems', 0, null),
  ('tissue-types-epithelial-connective-muscular-nervous', 'Tissue Types (Epithelial, Connective, Muscular, Nervous)', 1, null),
  ('levels-of-organization-cell-tissue-organ-organ-system', 'Levels of Organization (Cell, Tissue, Organ, Organ System)', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'biology' and mo.slug = 'animal-anatomy-and-physiology-i';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('biotic-factors-roles-of-organisms-producers-consumers-decomp', 'Biotic Factors (Roles of Organisms: Producers, Consumers, Decomposers; Relationships; Behavior/Defense Mechanisms)', 0, null),
  ('levels-of-organization', 'Levels of Organization', 1, null),
  ('abiotic-factors-climate-water-energy', 'Abiotic Factors (Climate, Water, Energy)', 2, null),
  ('food-chain-food-web', 'Food Chain / Food Web', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'biology' and mo.slug = 'ecology';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('plant-kingdom-non-seed-bearing-seed-bearing-gymnosperm-angio', 'Plant Kingdom (Non-Seed Bearing, Seed Bearing: Gymnosperm, Angiosperm - Monocot/Dicot)', 0, null),
  ('plant-cells-parenchyma-collenchyma-sclerenchyma', 'Plant Cells (Parenchyma, Collenchyma, Sclerenchyma)', 1, null),
  ('plant-tissues-and-levels-of-organization-dermal-vascular-gro', 'Plant Tissues & Levels of Organization (Dermal, Vascular, Ground)', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'biology' and mo.slug = 'plant-anatomy-and-physiology';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('anabolism-photosynthesis-light-dependent-and-light-independe', 'Anabolism / Photosynthesis (Light-dependent & Light-independent Reactions)', 0, null),
  ('catabolism-cellular-respiration-glycolysis-intermediate-step', 'Catabolism / Cellular Respiration (Glycolysis, Intermediate Step, Krebs Cycle, Electron Transport Chain, Fermentation)', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'biology' and mo.slug = 'metabolism';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('mendelian-laws-complete-dominance-segregation-independent-as', 'Mendelian Laws (Complete Dominance, Segregation, Independent Assortment)', 0, null),
  ('heredity-and-variation-gene-and-allele-trait-and-character-p', 'Heredity and Variation (Gene and Allele, Trait and Character, Phenotype & Genotype)', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'biology' and mo.slug = 'genetics-i';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('chemical-basis-of-life', 'Chemical Basis of Life', 0, null),
  ('water', 'Water', 1, null),
  ('chemical-bonds', 'Chemical Bonds', 2, null),
  ('vitamins', 'Vitamins', 3, null),
  ('essential-elements', 'Essential Elements', 4, null),
  ('unifying-themes-in-biology', 'Unifying Themes in Biology', 5, null),
  ('macromolecules', 'Macromolecules', 6, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'biology' and mo.slug = 'biology-the-study-of-life';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('genetic-deviation-mutation-chromosomal-aberrations-karyotypi', 'Genetic Deviation (Mutation, Chromosomal Aberrations, Karyotyping)', 0, null),
  ('non-mendelian-laws-sex-linked-sex-limited-sex-influenced-let', 'Non-Mendelian Laws (Sex-linked, Sex-limited, Sex-Influenced, Lethal genes)', 1, null),
  ('genetic-engineering-gel-electrophoresis-plasmid-mapping', 'Genetic Engineering (Gel Electrophoresis, Plasmid Mapping)', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'biology' and mo.slug = 'genetics-ii';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('types-of-cells-prokaryote-eukaryote', 'Types of Cells (Prokaryote, Eukaryote)', 0, null),
  ('the-cell-theory', 'The Cell Theory', 1, null),
  ('parts-of-a-cell-cell-surface-cytoplasm-nucleus', 'Parts of a Cell (Cell Surface, Cytoplasm, Nucleus)', 2, null),
  ('movement-of-material-passive-active', 'Movement of Material (Passive, Active)', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'biology' and mo.slug = 'the-cell';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('levels-of-organization-continued', 'Levels of Organization (continued)', 0, null),
  ('additional-organ-systems', 'Additional Organ Systems', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'biology' and mo.slug = 'animal-anatomy-and-physiology-ii';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('gametogenesis', 'Gametogenesis', 0, null),
  ('cell-division', 'Cell Division', 1, null),
  ('meiosis-i-and-ii', 'Meiosis I & II', 2, null),
  ('mitosis-prophase-metaphase-anaphase-telophase', 'Mitosis (Prophase, Metaphase, Anaphase, Telophase)', 3, null),
  ('interphase-stages-central-dogma-dna-replication-transcriptio', 'Interphase (Stages, Central Dogma: DNA Replication, Transcription, Translation)', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'biology' and mo.slug = 'the-cell-cycle';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('naming-molecular-compounds', 'Naming Molecular Compounds', 0, null),
  ('naming-ionic-compounds', 'Naming Ionic Compounds', 1, null),
  ('naming-acids-bases-and-hydrates', 'Naming Acids, Bases, and Hydrates', 2, null),
  ('ionic-and-molecular-compounds', 'Ionic and Molecular Compounds', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'chemistry' and mo.slug = 'names-and-formulas-of-chemical-compounds';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('energy-in-chemical-reactions-exothermic-and-endothermic-reac', 'Energy in Chemical Reactions (Exothermic and Endothermic Reactions, Reaction Profiles)', 0, null),
  ('limiting-and-excess-reactants-reagents', 'Limiting and Excess Reactants/Reagents', 1, null),
  ('stoichiometry-of-chemical-reactions', 'Stoichiometry of Chemical Reactions', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'chemistry' and mo.slug = 'chemical-accounting-stoichiometry';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('the-composition-of-atoms-protons-neutrons-electrons', 'The Composition of Atoms (Protons, Neutrons, Electrons)', 0, null),
  ('brief-history-and-definitions', 'Brief History and Definitions', 1, null),
  ('chemical-elements-stable-radioactive-half-life', 'Chemical Elements (Stable, Radioactive/Half-life)', 2, null),
  ('allotropes-and-isotopes', 'Allotropes and Isotopes', 3, null),
  ('chemical-compounds', 'Chemical Compounds', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'chemistry' and mo.slug = 'elements-and-compounds';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('mixtures-and-their-properties', 'Mixtures and Their Properties', 0, null),
  ('ways-to-separate-components-of-mixtures', 'Ways to Separate Components of Mixtures', 1, null),
  ('solubility', 'Solubility', 2, null),
  ('colligative-properties', 'Colligative Properties', 3, null),
  ('units-of-concentration-for-solutions', 'Units of Concentration for Solutions', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'chemistry' and mo.slug = 'mixture-of-substances';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('definitions-of-acids-and-bases-arrhenius-bronsted-lowry-lewi', 'Definitions of Acids and Bases (Arrhenius, Bronsted-Lowry, Lewis, Amphoteric Compounds)', 0, null),
  ('strengths-of-acids-and-bases-strong-weak-ph-scale-neutraliza', 'Strengths of Acids and Bases (Strong/Weak, pH Scale, Neutralization Reaction)', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'chemistry' and mo.slug = 'acids-and-bases';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('atomic-mass-and-molecular-mass', 'Atomic Mass and Molecular Mass', 0, null),
  ('avogadro-s-number-and-mole', 'Avogadro''s Number and Mole', 1, null),
  ('empirical-and-molecular-formulas', 'Empirical and Molecular Formulas', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'chemistry' and mo.slug = 'mole-concept';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('molecular-geometry-vsepr-intermolecular-forces', 'Molecular Geometry (VSEPR, Intermolecular Forces)', 0, null),
  ('lewis-electron-dot-structure', 'Lewis Electron Dot Structure', 1, null),
  ('intramolecular-forces-ionic-covalent-metallic-bond', 'Intramolecular Forces (Ionic, Covalent, Metallic Bond)', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'chemistry' and mo.slug = 'chemical-bonding';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('periodic-table-arrangement-groups-families-periods-blocks-me', 'Periodic Table Arrangement (Groups/Families, Periods, Blocks, Metals/Nonmetals/Metalloids)', 0, null),
  ('periodic-trends-atomic-size-radius-ionization-energies-elect', 'Periodic Trends (Atomic Size/Radius, Ionization Energies, Electron Affinities, Electronegativities)', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'chemistry' and mo.slug = 'the-periodic-table-of-elements';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('chemical-equation-law-of-conservation-of-mass', 'Chemical Equation / Law of Conservation of Mass', 0, null),
  ('physical-change-and-chemical-change', 'Physical Change and Chemical Change', 1, null),
  ('writing-and-balancing-chemical-equations', 'Writing & Balancing Chemical Equations', 2, null),
  ('types-of-chemical-reactions-combination-synthesis-decomposit', 'Types of Chemical Reactions (Combination/Synthesis, Decomposition, Single/Double Replacement)', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'chemistry' and mo.slug = 'chemical-reactions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('properties-of-matter', 'Properties of Matter', 0, null),
  ('gas-laws-boyle-s-charles-s-gay-lussac-s-avogadro-s-ideal-gas', 'Gas Laws (Boyle''s, Charles''s, Gay-Lussac''s, Avogadro''s, Ideal Gas Law)', 1, null),
  ('changes-in-state-of-matter-melting-freezing-evaporating-boil', 'Changes in State of Matter (Melting/Freezing, Evaporating/Boiling/Condensation, Heating & Cooling Curves, Phase Diagram)', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'chemistry' and mo.slug = 'solids-liquids-and-gases';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('aufbau-principle-hund-s-rule-pauli-exclusion-principle', 'Aufbau Principle, Hund''s Rule, Pauli Exclusion Principle', 0, null),
  ('electron-configuration-of-ions', 'Electron Configuration of Ions', 1, null),
  ('quantum-numbers-principal-angular-magnetic-spin', 'Quantum Numbers (Principal, Angular, Magnetic, Spin)', 2, null),
  ('electron-configuration-notations', 'Electron Configuration Notations', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'chemistry' and mo.slug = 'electron-configuration';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('composition-star-nebula-galaxy', 'Composition (Star, Nebula, Galaxy)', 0, null),
  ('origin-the-big-bang-theory', 'Origin (The Big Bang Theory)', 1, null),
  ('planetary-systems-planets-moons-minor-members', 'Planetary Systems (Planets, Moons, Minor Members)', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'earth-science' and mo.slug = 'the-universe';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('the-geosphere', 'The Geosphere', 0, null),
  ('the-atmosphere-composition-functions-layers', 'The Atmosphere (Composition, Functions, Layers)', 1, null),
  ('the-hydrosphere-distribution-of-water-hydrologic-cycle-movem', 'The Hydrosphere (Distribution of Water, Hydrologic Cycle, Movement of Water)', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'earth-science' and mo.slug = 'the-spheres-of-the-earth';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('origins-continental-drift-theory-seafloor-spreading-theory', 'Origins (Continental Drift Theory, Seafloor Spreading Theory)', 0, null),
  ('evidences-matching-shorelines-etc', 'Evidences (Matching Shorelines, etc.)', 1, null),
  ('plate-movement-causes-of-movement-plate-boundaries', 'Plate Movement (Causes of Movement, Plate Boundaries)', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'earth-science' and mo.slug = 'plate-tectonics';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('global-climate-change', 'Global Climate Change', 0, null),
  ('moisture-cloud-and-precipitation-humidity-cloud-formation-an', 'Moisture, Cloud, & Precipitation (Humidity, Cloud Formation & Types, Fog, Types of Precipitation)', 1, null),
  ('weather-vs-climate', 'Weather vs. Climate', 2, null),
  ('air-temperature-factors-affecting-air-temperature', 'Air Temperature (Factors Affecting Air Temperature)', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'earth-science' and mo.slug = 'earth-s-dynamic-atmosphere';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('rocks-rock-cycle-types', 'Rocks (Rock Cycle, Types)', 0, null),
  ('soil-sediment-properties-types-properties', 'Soil (Sediment Properties, Types, Properties)', 1, null),
  ('geologic-laws-and-significances', 'Geologic Laws and Significances', 2, null),
  ('minerals-characteristics-properties', 'Minerals (Characteristics, Properties)', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'earth-science' and mo.slug = 'earth-s-crust';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('essentials-of-a-habitable-planet', 'Essentials of a Habitable Planet', 0, null),
  ('evolution-of-earth', 'Evolution of Earth', 1, null),
  ('movement-of-earth-rotation-revolution-precession', 'Movement of Earth (Rotation, Revolution, Precession)', 2, null),
  ('the-moon-phases-eclipses-revolution', 'The Moon (Phases, Eclipses, Revolution)', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'earth-science' and mo.slug = 'the-earth-and-the-moon';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('archimedes-principle', 'Archimedes'' Principle', 0, null),
  ('density-and-specific-gravity', 'Density and Specific Gravity', 1, null),
  ('flow-rate', 'Flow Rate', 2, null),
  ('hydrostatic-pressure', 'Hydrostatic Pressure', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'physics' and mo.slug = 'fluids';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('forces-and-types-of-forces-normal-weight-applied-frictional-', 'Forces and Types of Forces (Normal, Weight, Applied, Frictional, Tension)', 0, null),
  ('torque', 'Torque', 1, null),
  ('newton-s-third-law-law-of-interaction', 'Newton''s Third Law (Law of Interaction)', 2, null),
  ('resultant-force', 'Resultant Force', 3, null),
  ('newton-s-first-law-inertia', 'Newton''s First Law (Inertia)', 4, null),
  ('newton-s-second-law-law-of-acceleration', 'Newton''s Second Law (Law of Acceleration)', 5, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'physics' and mo.slug = 'forces-and-newton-s-laws-of-motion';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('constant-velocity-and-acceleration-uarm', 'Constant Velocity and Acceleration (UARM)', 0, null),
  ('graphical-representation-of-motion', 'Graphical Representation of Motion', 1, null),
  ('free-fall', 'Free Fall', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'physics' and mo.slug = 'motion-along-a-straight-line';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('distance-vs-displacement', 'Distance vs. Displacement', 0, null),
  ('scalars-vs-vectors', 'Scalars vs. Vectors', 1, null),
  ('components-of-a-vector-vector-addition-resolution-of-vectors', 'Components of a Vector, Vector Addition, Resolution of Vectors', 2, null),
  ('speed-and-velocity', 'Speed and Velocity', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'physics' and mo.slug = 'scalars-and-vectors';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('quantity-of-heat-and-heat-exchange-temperature-and-thermal-e', 'Quantity of Heat and Heat Exchange, Temperature and Thermal Expansion', 0, null),
  ('work-and-power', 'Work and Power', 1, null),
  ('mechanical-energy-kinetic-potential-work-energy-theorem', 'Mechanical Energy (Kinetic, Potential), Work-Energy Theorem', 2, null),
  ('conservation-of-energy', 'Conservation of Energy', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'physics' and mo.slug = 'work-power-and-energy';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('newton-s-universal-law-of-gravitation', 'Newton''s Universal Law of Gravitation', 0, null),
  ('uniform-circular-motion-instantaneous-velocity-centripetal-a', 'Uniform Circular Motion (Instantaneous Velocity, Centripetal Acceleration & Force)', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'physics' and mo.slug = 'circular-motion-and-gravitation';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('an-object-projected-at-an-angle', 'An Object Projected at an Angle', 0, null),
  ('an-object-projected-horizontally', 'An Object Projected Horizontally', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'physics' and mo.slug = 'projectile-motion';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('series-and-parallel-circuits', 'Series and Parallel Circuits', 0, null),
  ('electric-power-and-electrical-energy', 'Electric Power and Electrical Energy', 1, null),
  ('electrical-charges-coulomb-s-law', 'Electrical Charges, Coulomb''s Law', 2, null),
  ('current-voltage-and-resistance-ohm-s-law', 'Current, Voltage, and Resistance (Ohm''s Law)', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'physics' and mo.slug = 'electric-circuits-and-magnets';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('types-of-collisions-elastic-inelastic-perfectly-inelastic', 'Types of Collisions (Elastic, Inelastic, Perfectly Inelastic)', 0, null),
  ('momentum-and-conservation-of-momentum', 'Momentum and Conservation of Momentum', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'physics' and mo.slug = 'momentum-and-collisions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('characteristics-of-waves-wavelength-period-frequency-amplitu', 'Characteristics of Waves (Wavelength, Period, Frequency, Amplitude, Velocity)', 0, null),
  ('types-of-waves-mechanical-vs-electromagnetic-transverse-vs-l', 'Types of Waves (Mechanical vs. Electromagnetic, Transverse vs. Longitudinal)', 1, null),
  ('law-of-reflection-mirrors-and-lenses', 'Law of Reflection, Mirrors and Lenses', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'physics' and mo.slug = 'waves-mirrors-and-lenses';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('trigonometric-functions-of-angles', 'Trigonometric Functions of Angles', 0, null),
  ('properties-of-trigonometric-functions', 'Properties of Trigonometric Functions', 1, null),
  ('trigonometric-identities', 'Trigonometric Identities', 2, null),
  ('angle-measure-in-trigonometry', 'Angle Measure in Trigonometry', 3, null),
  ('trigonometric-functions-of-special-angles', 'Trigonometric Functions of Special Angles', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'mathematics' and mo.slug = 'trigonometry';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('the-limit-of-a-function', 'The Limit of a Function', 0, null),
  ('integration', 'Integration', 1, null),
  ('differentiation', 'Differentiation', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'mathematics' and mo.slug = 'calculus';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('functions-and-their-graphs', 'Functions and Their Graphs', 0, null),
  ('exponential-and-logarithmic-functions', 'Exponential and Logarithmic Functions', 1, null),
  ('conic-sections-i', 'Conic Sections I', 2, null),
  ('conic-sections-ii', 'Conic Sections II', 3, null),
  ('characteristics-of-a-function', 'Characteristics of a Function', 4, null),
  ('definition-of-a-function', 'Definition of a Function', 5, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'mathematics' and mo.slug = 'functions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('organizing-data', 'Organizing Data', 0, null),
  ('analyzing-data-i-fundamental-skills', 'Analyzing Data I: Fundamental Skills', 1, null),
  ('describing-data-i-one-variable', 'Describing Data I: One Variable', 2, null),
  ('analyzing-data-ii-probability-distribution', 'Analyzing Data II: Probability Distribution', 3, null),
  ('describing-data-ii-two-variables', 'Describing Data II: Two Variables', 4, null),
  ('interpreting-data', 'Interpreting Data', 5, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'mathematics' and mo.slug = 'statistics';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('congruent-and-similar-triangles', 'Congruent and Similar Triangles', 0, null),
  ('measurements-of-geometric-segments', 'Measurements of Geometric Segments', 1, null),
  ('circles-i-measure-of-angles', 'Circles I - Measure of Angles', 2, null),
  ('measurements-of-geometric-angles', 'Measurements of Geometric Angles', 3, null),
  ('mensuration', 'Mensuration', 4, null),
  ('circles-ii-measure-of-segments', 'Circles II - Measure of Segments', 5, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'mathematics' and mo.slug = 'geometry';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('motion-problems-i', 'Motion Problems I', 0, null),
  ('motion-problems-ii', 'Motion Problems II', 1, null),
  ('number-problems', 'Number Problems', 2, null),
  ('business-math-problems-i', 'Business Math Problems I', 3, null),
  ('age-problems', 'Age Problems', 4, null),
  ('work-problems', 'Work Problems', 5, null),
  ('mixture-and-solution-problems', 'Mixture and Solution Problems', 6, null),
  ('business-math-problems-ii', 'Business Math Problems II', 7, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'mathematics' and mo.slug = 'word-problems';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('proportion-and-variation', 'Proportion and Variation', 0, null),
  ('number-system', 'Number System', 1, null),
  ('factoring-polynomials-and-rational-expressions', 'Factoring Polynomials & Rational Expressions', 2, null),
  ('sequences-and-series', 'Sequences and Series', 3, null),
  ('two-points-and-a-line', 'Two Points and a Line', 4, null),
  ('other-equations', 'Other Equations', 5, null),
  ('operations-on-polynomials', 'Operations on Polynomials', 6, null),
  ('operations-on-numbers', 'Operations on Numbers', 7, null),
  ('linear-and-quadratic-equations', 'Linear and Quadratic Equations', 8, null),
  ('other-inequalities', 'Other Inequalities', 9, null),
  ('exponents-and-radicals', 'Exponents and Radicals', 10, null),
  ('linear-quadratic-and-rational-inequalities', 'Linear, Quadratic & Rational Inequalities', 11, null),
  ('system-of-equations-and-inequalities', 'System of Equations and Inequalities', 12, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'mathematics' and mo.slug = 'algebra';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('general-writing-techniques', 'General Writing Techniques', 0, null),
  ('parts-of-an-essay', 'Parts of an Essay', 1, null),
  ('essay-types', 'Essay Types', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reading-and-writing' and mo.slug = 'essay-writing';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('figures-of-speech', 'Figures of Speech', 0, null),
  ('general-tactics', 'General Tactics', 1, null),
  ('forms-of-literature', 'Forms of Literature', 2, null),
  ('question-types', 'Question Types', 3, null),
  ('reading-materials', 'Reading Materials', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reading-and-writing' and mo.slug = 'reading-comprehension';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('sentence-structure-simple-compound-complex-compound-complex', 'Sentence Structure (Simple, Compound, Complex, Compound-Complex)', 0, null),
  ('word-order-and-sentence-order', 'Word Order & Sentence Order', 1, null),
  ('criteria-of-a-good-paragraph', 'Criteria of a Good Paragraph', 2, null),
  ('inverted-triangle-method', 'Inverted Triangle Method', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reading-and-writing' and mo.slug = 'organization';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('parts-of-a-research-paper', 'Parts of a Research Paper', 0, null),
  ('academic-formality', 'Academic Formality', 1, null),
  ('summarizing-and-paraphrasing', 'Summarizing and Paraphrasing', 2, null),
  ('types-of-academic-papers', 'Types of Academic Papers', 3, null),
  ('outlines', 'Outlines', 4, null),
  ('apa-referencing-style', 'APA Referencing Style', 5, null),
  ('rhetorical-modes', 'Rhetorical Modes', 6, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reading-and-writing' and mo.slug = 'academic-writing';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('logic-problem-solving-techniques-assumption-diagram-list', 'Logic Problem-Solving Techniques (Assumption, Diagram, List)', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reasoning' and mo.slug = 'math-logic';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('letter-sequences', 'Letter Sequences', 0, null),
  ('number-sequences', 'Number Sequences', 1, null),
  ('number-letter-sequences', 'Number-Letter Sequences', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reasoning' and mo.slug = 'number-and-letter-sequences';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('addition-simplification-conjunction', 'Addition, Simplification, Conjunction', 0, null),
  ('modus-ponens-modus-tollens', 'Modus Ponens, Modus Tollens', 1, null),
  ('hypothetical-and-disjunctive-syllogism', 'Hypothetical & Disjunctive Syllogism', 2, null),
  ('direct-proof-indirect-proof-proof-by-contradiction-proof-by-', 'Direct Proof, Indirect Proof/Proof by Contradiction, Proof by Contrapositive', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reasoning' and mo.slug = 'rules-of-inference-and-methods-of-proof';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('fallacies-of-omission', 'Fallacies of Omission', 0, null),
  ('fallacies-of-ambiguity', 'Fallacies of Ambiguity', 1, null),
  ('fallacies-of-relevance', 'Fallacies of Relevance', 2, null),
  ('component-fallacies', 'Component Fallacies', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reasoning' and mo.slug = 'logical-fallacies';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('figure-grouping', 'Figure Grouping', 0, null),
  ('figure-sequences', 'Figure Sequences', 1, null),
  ('figure-analogy', 'Figure Analogy', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reasoning' and mo.slug = 'abstract-reasoning';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('world-geography', 'World Geography', 0, null),
  ('arts-and-literature', 'Arts and Literature', 1, null),
  ('philippine-geography-history-and-culture', 'Philippine Geography, History and Culture', 2, null),
  ('general-science', 'General Science', 3, null),
  ('other-fields', 'Other Fields', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reasoning' and mo.slug = 'general-information';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('conditional-propositions', 'Conditional Propositions', 0, null),
  ('compound-propositions', 'Compound Propositions', 1, null),
  ('simple-propositions', 'Simple Propositions', 2, null),
  ('tautology', 'Tautology', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reasoning' and mo.slug = 'propositions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('abduction', 'Abduction', 0, null),
  ('induction', 'Induction', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reasoning' and mo.slug = 'induction-and-abduction';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('hypothetical-syllogism', 'Hypothetical Syllogism', 0, null),
  ('categorical-syllogism', 'Categorical Syllogism', 1, null),
  ('deductive-reasoning', 'Deductive Reasoning', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'reasoning' and mo.slug = 'deduction';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('regulation-control', 'Regulation/Control', 0, null),
  ('social-interaction', 'Social Interaction', 1, null),
  ('emotional-expression', 'Emotional Expression', 2, null),
  ('motivation', 'Motivation', 3, null),
  ('information', 'Information', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'communication' and mo.slug = 'communicative-functions-and-strategies';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('types-of-resumes-executive-novice-chronological', 'Types of Resumes (Executive, Novice, Chronological)', 0, null),
  ('types-of-letters-business-career-and-employment', 'Types of Letters (Business, Career & Employment)', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'communication' and mo.slug = 'letters-and-resumes';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('according-to-purpose-expository-informative-persuasive-enter', 'According to Purpose (Expository/Informative, Persuasive, Entertainment)', 0, null),
  ('according-to-delivery-manuscript-memorized-impromptu', 'According to Delivery (Manuscript, Memorized, Impromptu)', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'communication' and mo.slug = 'types-of-speeches';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('communication-strategies', 'Communication Strategies', 0, null),
  ('process-of-communication', 'Process of Communication', 1, null),
  ('communication-models', 'Communication Models', 2, null),
  ('organizational-communication', 'Organizational Communication', 3, null),
  ('nature-of-communication', 'Nature of Communication', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'communication' and mo.slug = 'nature-and-elements-of-communication';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('high-context-vs-low-context-culture', 'High-Context vs. Low-Context Culture', 0, null),
  ('cultural-sensitivity', 'Cultural Sensitivity', 1, null),
  ('understanding-culture-components-of-culture', 'Understanding Culture (Components of Culture)', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'communication' and mo.slug = 'culture-and-communication';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('tactics-to-decipher-vocabulary-words-context-clues-morpholog', 'Tactics to Decipher Vocabulary Words (Context Clues, Morphology, Word Charge, Idioms)', 0, null),
  ('word-usage-commonly-misused-words', 'Word Usage / Commonly Misused Words', 1, null),
  ('analogy', 'Analogy', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'vocabulary';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('verbal-noun', 'Verbal Noun', 0, null),
  ('collective-noun', 'Collective Noun', 1, null),
  ('singular-and-plural-nouns', 'Singular and Plural Nouns', 2, null),
  ('compound-subject', 'Compound Subject', 3, null),
  ('personal-pronoun-agreement', 'Personal Pronoun Agreement', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'subject-verb-agreement';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('adverbs-double-negatives', 'Adverbs / Double Negatives', 0, null),
  ('modifier-placement-dangling-misplaced', 'Modifier Placement (Dangling, Misplaced)', 1, null),
  ('comparatives', 'Comparatives', 2, null),
  ('adjectives-hyphenated-adjectives-in-a-series', 'Adjectives (Hyphenated, Adjectives in a Series)', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'modifiers';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('combination-of-nang-and-a-word', 'Combination of ''nang'' and a word', 0, null),
  ('omission-of-a-in-conjunction-ay-at', 'Omission of ''a'' in conjunction ''ay'' / ''at''', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'contractions-pagdadaglat';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('personal-demonstrative-and-interrogative-pronoun', 'Personal, Demonstrative, and Interrogative Pronoun', 0, null),
  ('article-and-noun', 'Article and Noun', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'articles-nouns-and-pronouns';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('conjunction-coordinating-subordinate-correlative', 'Conjunction (Coordinating, Subordinate, Correlative)', 0, null),
  ('transition-similarity-addition-contrast-qualification-emphas', 'Transition (Similarity/Addition, Contrast, Qualification, Emphasis, Sequence, Exemplification, Conclusion)', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'conjunctions-and-transitions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('usage-of-daw-raw', 'Usage of daw/raw', 0, null),
  ('usage-of-din-rin', 'Usage of din/rin', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'ingklitik';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('verb-tenses-and-forms', 'Verb Tenses and Forms', 0, null),
  ('verb-forms-in-if-clauses', 'Verb Forms in If-Clauses', 1, null),
  ('verb-tense-consistency', 'Verb Tense Consistency', 2, null),
  ('modal-verb-usage', 'Modal Verb Usage', 3, null),
  ('tag-questions', 'Tag Questions', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'verbs';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('period-comma-apostrophe-colon-semi-colon-dash-quotation-mark', 'Period, Comma, Apostrophe, Colon, Semi-Colon, Dash, Quotation Marks', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'punctuation';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('parallelism-constructions', 'Parallelism Constructions', 0, null),
  ('parallelism-with-gerunds-infinitive-phrases-verbs-adjectives', 'Parallelism with Gerunds, Infinitive Phrases, Verbs, Adjectives', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'parallelism';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('preposition-or-adverb-prepositional-verb', 'Preposition or Adverb, Prepositional Verb', 0, null),
  ('most-common-errors-in-preposition-usage', 'Most Common Errors in Preposition Usage', 1, null),
  ('preposition-usage-time-place-movement-and-direction', 'Preposition Usage (Time, Place, Movement and Direction)', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'prepositions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('ligature-pang-angkop-usage-of-na-ng-g', 'Ligature (Pang-angkop): Usage of na, -ng, -g', 0, null),
  ('modification-of-prefixes-assimilation-replacement', 'Modification of Prefixes (Assimilation, Replacement)', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'general' and sa.slug = 'language' and mo.slug = 'filipino-word-transitions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('preposition-usage', 'Preposition Usage', 0, null),
  ('common-errors-in-preposition-usage', 'Common Errors in Preposition Usage', 1, null),
  ('proper-personal-prepositions', 'Proper Personal Prepositions', 2, null),
  ('common-prepositions', 'Common Prepositions', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'prepositions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('omission-of-a-in-ay', 'Omission of "A" in "Ay"', 0, null),
  ('omission-of-a-in-at', 'Omission of "A" in "At"', 1, null),
  ('combination-of-nang-and-a-word-ending-in-vowel', 'Combination of "Nang" and a Word Ending in Vowel', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'contractions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('verb-tense-consistency', 'Verb Tense Consistency', 0, null),
  ('filipino-verb-tenses', 'Filipino Verb Tenses', 1, null),
  ('verb-tenses', 'Verb Tenses', 2, null),
  ('modal-verb-usage', 'Modal Verb Usage', 3, null),
  ('filipino-verb-focus', 'Filipino Verb Focus', 4, null),
  ('verb-forms-in-conditional-sentences', 'Verb Forms in Conditional Sentences', 5, null),
  ('tag-questions', 'Tag Questions', 6, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'verbs';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('types-of-materials', 'Types of Materials', 0, null),
  ('fictional-and-non-fictional-materials', 'Fictional and Non-Fictional Materials', 1, null),
  ('figures-of-speech', 'Figures of Speech', 2, null),
  ('question-types', 'Question Types', 3, null),
  ('general-tactics', 'General Tactics', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'reading-comprehension';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('filipino-subordinating-conjunction', 'Filipino Subordinating Conjunction', 0, null),
  ('conjunction', 'Conjunction', 1, null),
  ('filipino-coordinating-conjunction', 'Filipino Coordinating Conjunction', 2, null),
  ('transition-words', 'Transition Words', 3, null),
  ('filipino-correlative-conjunction', 'Filipino Correlative Conjunction', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'conjunctions-and-transitions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('common-pitfalls-in-sva', 'Common Pitfalls in SVA', 0, null),
  ('general-rules-in-sva', 'General Rules in SVA', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'subject-verb-agreement';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('pang-abay', 'Pang-abay', 0, null),
  ('forming-filipino-comparatives', 'Forming Filipino Comparatives', 1, null),
  ('common-errors-with-comparatives', 'Common Errors with Comparatives', 2, null),
  ('forming-comparatives', 'Forming Comparatives', 3, null),
  ('modifier-placement', 'Modifier Placement', 4, null),
  ('adverbs', 'Adverbs', 5, null),
  ('adjectives', 'Adjectives', 6, null),
  ('pang-uri', 'Pang-uri', 7, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'modifiers';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('commonly-misused-words', 'Commonly Misused Words', 0, null),
  ('tactics-to-decipher-word-meanings', 'Tactics to Decipher Word Meanings', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'vocabulary';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('parallelism-constructions', 'Parallelism Constructions', 0, null),
  ('parallelism-application', 'Parallelism Application', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'parallelism';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('modification-of-prefixes', 'Modification of Prefixes', 0, null),
  ('ligatures', 'Ligatures', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'filipino-word-transition';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('usage-of-daw-and-raw', 'Usage of Daw and Raw', 0, null),
  ('usage-of-din-and-rin', 'Usage of Din and Rin', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'ingklitik';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('article', 'Article', 0, null),
  ('pronoun-case', 'Pronoun Case', 1, null),
  ('noun', 'Noun', 2, null),
  ('pronoun', 'Pronoun', 3, null),
  ('pronoun-antecedent-agreement', 'Pronoun-Antecedent Agreement', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'articles-nouns-and-pronouns';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('sentence-order', 'Sentence Order', 0, null),
  ('word-order', 'Word Order', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'language-and-reading' and mo.slug = 'organization';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('evolution-of-the-earth', 'Evolution of the Earth', 0, null),
  ('the-moon', 'The Moon', 1, null),
  ('movement-of-earth', 'Movement of Earth', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'earth-science' and mo.slug = 'the-earth-and-the-moon';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('moisture-cloud-precipitation', 'Moisture, Cloud, Precipitation', 0, null),
  ('storms', 'Storms', 1, null),
  ('air-movement', 'Air Movement', 2, null),
  ('basic-climate-groups', 'Basic Climate Groups', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'earth-science' and mo.slug = 'earth-s-dynamic-atmosphere';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('plate-tectonic-theory', 'Plate Tectonic Theory', 0, null),
  ('plate-movement', 'Plate Movement', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'earth-science' and mo.slug = 'plate-tectonics';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('the-geosphere', 'The Geosphere', 0, null),
  ('composition-of-the-atmosphere', 'Composition of the Atmosphere', 1, null),
  ('composition', 'Composition', 2, null),
  ('the-hydrosphere', 'The Hydrosphere', 3, null),
  ('layers-of-the-atmosphere', 'Layers of the Atmosphere', 4, null),
  ('layers-of-the-earth', 'Layers of the Earth', 5, null),
  ('distribution-of-water', 'Distribution of Water', 6, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'earth-science' and mo.slug = 'the-spheres-of-the-earth';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('effects-of-internal-forces', 'Effects of Internal Forces', 0, null),
  ('external-forces', 'External Forces', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'earth-science' and mo.slug = 'geological-forces';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('minerals', 'Minerals', 0, null),
  ('geological-laws', 'Geological Laws', 1, null),
  ('rocks', 'Rocks', 2, null),
  ('index-fossils', 'Index Fossils', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'earth-science' and mo.slug = 'the-earth-s-crust';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('mendelian-laws', 'Mendelian Laws', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'biology' and mo.slug = 'genetics-i';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('chemical-basis-of-life', 'Chemical Basis of Life', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'biology' and mo.slug = 'biology-the-study-of-life';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('types-of-cells', 'Types of Cells', 0, null),
  ('movement-of-materials', 'Movement of Materials', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'biology' and mo.slug = 'the-cell';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('non-mendelian-laws', 'Non-Mendelian Laws', 0, null),
  ('genetic-engineering', 'Genetic Engineering', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'biology' and mo.slug = 'genetics-ii';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('taxonomy', 'Taxonomy', 0, null),
  ('evolution', 'Evolution', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'biology' and mo.slug = 'evolution-and-taxonomy';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('levels-of-organization', 'Levels of Organization', 0, null),
  ('plant-development', 'Plant Development', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'biology' and mo.slug = 'plant-anatomy-and-physiology';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('animal-organ-systems', 'Animal Organ Systems', 0, null),
  ('levels-of-organization', 'Levels of Organization', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'biology' and mo.slug = 'animal-anatomy-and-physiology-i';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('ionic-and-molecular-compounds', 'Ionic and Molecular Compounds', 0, null),
  ('naming-ionic-compounds', 'Naming Ionic Compounds', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'chemistry' and mo.slug = 'naming-compounds';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('structure-and-functional-groups', 'Structure and Functional Groups', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'chemistry' and mo.slug = 'organic-chemistry';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('chemical-equation', 'Chemical Equation', 0, null),
  ('physical-change-and-chemical-change', 'Physical Change and Chemical Change', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'chemistry' and mo.slug = 'chemical-reactions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('energy-in-chemical-reactions', 'Energy in Chemical Reactions', 0, null),
  ('stoichiometry-of-chemical-reaction', 'Stoichiometry of Chemical Reaction', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'chemistry' and mo.slug = 'stoichiometry';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('periodic-trends', 'Periodic Trends', 0, null),
  ('periodic-table-arrangement', 'Periodic Table Arrangement', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'chemistry' and mo.slug = 'periodic-table-of-elements';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('gas-laws', 'Gas Laws', 0, null),
  ('properties-of-the-three-states-of-matter', 'Properties of the Three States of Matter', 1, null),
  ('changes-in-state-of-matter', 'Changes in State of Matter', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'chemistry' and mo.slug = 'solids-liquids-and-gases';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('empirical-and-molecular-formula', 'Empirical and Molecular Formula', 0, null),
  ('atomic-mass-and-molecular-mass', 'Atomic Mass and Molecular Mass', 1, null),
  ('avogadro-s-number-and-mole', 'Avogadro''s Number and Mole', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'chemistry' and mo.slug = 'mole-concept';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('quantum-numbers-and-electron-configuration', 'Quantum Numbers and Electron Configuration', 0, null),
  ('electron-configuration', 'Electron Configuration', 1, null),
  ('quantum-numbers', 'Quantum Numbers', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'chemistry' and mo.slug = 'electron-configuration';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('measurements', 'Measurements', 0, null),
  ('accuracy-and-precision', 'Accuracy and Precision', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'chemistry' and mo.slug = 'the-language-of-science';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('chemical-elements', 'Chemical Elements', 0, null),
  ('allotropes-and-isotopes', 'Allotropes and Isotopes', 1, null),
  ('radioactive-decay', 'Radioactive Decay', 2, null),
  ('chemical-compounds', 'Chemical Compounds', 3, null),
  ('composition-of-atoms', 'Composition of Atoms', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'chemistry' and mo.slug = 'elements-and-compounds';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('units-of-concentration-for-solutions', 'Units of Concentration for Solutions', 0, null),
  ('solubility', 'Solubility', 1, null),
  ('saturation', 'Saturation', 2, null),
  ('mixtures-and-their-properties', 'Mixtures and their Properties', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'chemistry' and mo.slug = 'mixture-of-substances';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('electric-circuits', 'Electric Circuits', 0, null),
  ('electric-power-and-electrical-energy', 'Electric Power & Electrical Energy', 1, null),
  ('series-and-parallel-voltage-sources', 'Series and Parallel Voltage Sources', 2, null),
  ('electric-charges', 'Electric Charges', 3, null),
  ('magnets', 'Magnets', 4, null),
  ('current-voltage-and-resistance', 'Current, Voltage & Resistance', 5, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'physics' and mo.slug = 'electric-circuits-and-magnets';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('newton-s-third-law', 'Newton''s Third Law', 0, null),
  ('newton-s-second-law', 'Newton''s Second Law', 1, null),
  ('newton-s-first-law', 'Newton''s First Law', 2, null),
  ('forces', 'Forces', 3, null),
  ('torque', 'Torque', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'physics' and mo.slug = 'forces-and-newton-s-laws-of-motion';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('uniform-circular-motion', 'Uniform Circular Motion', 0, null),
  ('newton-s-universal-law-of-gravitation', 'Newton''s Universal Law of Gravitation', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'physics' and mo.slug = 'circular-motion-and-gravitation';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('speed-vs-velocity', 'Speed vs. Velocity', 0, null),
  ('distance-vs-displacement', 'Distance vs. Displacement', 1, null),
  ('resolution-of-vectors', 'Resolution of Vectors', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'physics' and mo.slug = 'scalars-and-vectors';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('mirrors-and-lenses', 'Mirrors & Lenses', 0, null),
  ('characteristics-of-waves', 'Characteristics of Waves', 1, null),
  ('properties-of-waves', 'Properties of Waves', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'physics' and mo.slug = 'waves-mirrors-and-lenses';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('graphical-representation-of-motion', 'Graphical Representation of Motion', 0, null),
  ('constant-velocity-and-acceleration', 'Constant Velocity and Acceleration', 1, null),
  ('uarm', 'UARM', 2, null),
  ('free-fall', 'Free Fall', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'physics' and mo.slug = 'motion-along-a-straight-line';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('hydrostatic-pressure', 'Hydrostatic Pressure', 0, null),
  ('fluids-in-motion', 'Fluids in Motion', 1, null),
  ('density', 'Density', 2, null),
  ('specific-gravity', 'Specific Gravity', 3, null),
  ('archimedes-principle', 'Archimedes'' Principle', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'physics' and mo.slug = 'fluids';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('an-object-projected-at-an-angle', 'An Object Projected at an Angle', 0, null),
  ('an-object-projected-horizontally', 'An Object Projected Horizontally', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'physics' and mo.slug = 'projectile-motion';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('temperature-and-heat', 'Temperature and Heat', 0, null),
  ('thermal-expansion', 'Thermal Expansion', 1, null),
  ('energy', 'Energy', 2, null),
  ('work-and-power', 'Work and Power', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'physics' and mo.slug = 'work-power-and-energy';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('momentum', 'Momentum', 0, null),
  ('collisions', 'Collisions', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'physics' and mo.slug = 'momentum-and-collisions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('linear-and-quadratic-equations', 'Linear and Quadratic Equations', 0, 'Quadratic Equation; Nature of roots'),
  ('system-of-equations-and-inequalities', 'System of Equations and Inequalities', 1, 'System of linear Inequalities; System of linear equations'),
  ('factoring-polynomials-and-rational-expression', 'Factoring Polynomials and Rational Expression', 2, null),
  ('exponents-and-radicals', 'Exponents and Radicals', 3, 'Laws of exponents'),
  ('sequences-and-series', 'Sequences and Series', 4, 'Geometric sequence; Infinite Geometric Series; Arithmetic sequences'),
  ('operation-on-numbers', 'Operation on Numbers', 5, 'Symbol operation'),
  ('other-inequalities', 'Other Inequalities', 6, 'Absolute value inequalities'),
  ('two-point-and-a-line', 'Two Point and a Line', 7, null),
  ('equation-leading-to-linear-and-quadratic-equations', 'Equation Leading to Linear and Quadratic Equations', 8, 'Radical equation; Absolute value Equation')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'mathematics' and mo.slug = 'algebra';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('fundamental-skills', 'Fundamental Skills', 0, 'Combination; Probability'),
  ('describing-data-one-variable', 'Describing Data - One Variable', 1, 'Central Tendency')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'mathematics' and mo.slug = 'statistics';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('business-math-ii', 'Business Math II', 0, 'Simple Interest; Compound Interest'),
  ('mixture-and-solution-problems', 'Mixture and Solution Problems', 1, 'Solution Problems'),
  ('work-problems', 'Work Problems', 2, null),
  ('number-problems', 'Number Problems', 3, null),
  ('motion-problems-i', 'Motion Problems I', 4, null),
  ('age-problems', 'Age Problems', 5, null),
  ('motion-problems-ii', 'Motion Problems II', 6, 'Other Motion Problem')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'mathematics' and mo.slug = 'word-problems';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('measurements-of-geometric-segments', 'Measurements of Geometric Segments', 0, 'Segments; Properties of Parallelogram; Right triangle; Special right triangle'),
  ('circle-ii-measure-of-segments', 'Circle II - Measure of Segments', 1, null),
  ('mensuration', 'Mensuration', 2, null),
  ('circle-i-measure-of-angles', 'Circle I - Measure of Angles', 3, null),
  ('measurements-of-geometric-angles', 'Measurements of Geometric Angles', 4, 'Parallel lines cut by transversal; Triangles')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'mathematics' and mo.slug = 'geometry';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('characteristics-of-a-function', 'Characteristics of a Function', 0, 'Domain and range; Inverse function'),
  ('functions-and-their-graphs', 'Functions and Their Graphs', 1, 'Quadratic function; Remainder and factor theorem'),
  ('exponential-and-logarithmic-functions', 'Exponential and Logarithmic Functions', 2, 'Logarithmic expression; Exponential equation'),
  ('definition-of-function', 'Definition of Function', 3, 'Combining function; Evaluating function')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'mathematics' and mo.slug = 'functions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('limit-of-a-function', 'Limit of a Function', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'mathematics' and mo.slug = 'calculus';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('trigonometric-functions-of-angles', 'Trigonometric Functions of Angles', 0, null),
  ('trigonometric-functions-of-special-angles', 'Trigonometric Functions of Special Angles', 1, 'Trigonometric Equation; Trigonometric Function'),
  ('trigonometric-identities', 'Trigonometric Identities', 2, 'Trigonometric Equation; Proving Identities'),
  ('angle-measure-in-trigonometry', 'Angle Measure in Trigonometry', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'up' and sa.slug = 'mathematics' and mo.slug = 'trigonometry';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('commonly-misused-words', 'Commonly Misused Words', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'vocabulary';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('modal-verb-usage', 'Modal Verb Usage', 0, null),
  ('verb-tenses', 'Verb Tenses', 1, null),
  ('tag-questions', 'Tag Questions', 2, null),
  ('verb-tense-consistency', 'Verb Tense Consistency', 3, null),
  ('verb-forms-in-conditional-sentences', 'Verb Forms in Conditional Sentences', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'verbs';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('apa-referencing-style', 'APA Referencing Style', 0, null),
  ('research-writing', 'Research Writing', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'academic-writing';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('fictional-and-non-fictional-materials', 'Fictional and Non-Fictional Materials', 0, null),
  ('general-tactics', 'General Tactics', 1, null),
  ('question-types', 'Question Types', 2, null),
  ('figures-of-speech', 'Figures of Speech', 3, null),
  ('types-of-materials', 'Types of Materials', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'reading-comprehension';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('fallacies-of-ambiguity', 'Fallacies of Ambiguity', 0, null),
  ('fallacies-of-relevance', 'Fallacies of Relevance', 1, null),
  ('fallacies-of-omission', 'Fallacies of Omission', 2, null),
  ('component-fallacies', 'Component Fallacies', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'logical-fallacies';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('parallelism-application', 'Parallelism Application', 0, null),
  ('parallelism-constructions', 'Parallelism Constructions', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'parallelism';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('common-errors-in-preposition-usage', 'Common Errors in Preposition Usage', 0, null),
  ('preposition-usage', 'Preposition Usage', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'prepositions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('conjunction', 'Conjunction', 0, null),
  ('transition-words', 'Transition Words', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'conjunctions-and-transitions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('pronoun-antecedent-agreement', 'Pronoun-Antecedent Agreement', 0, null),
  ('pronoun-case', 'Pronoun Case', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'articles-nouns-and-pronouns';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('common-errors-with-comparatives', 'Common Errors with Comparatives', 0, null),
  ('modifier-placement', 'Modifier Placement', 1, null),
  ('forming-comparatives', 'Forming Comparatives', 2, null),
  ('adjectives', 'Adjectives', 3, null),
  ('adverbs', 'Adverbs', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'modifiers';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('common-pitfalls-in-sva', 'Common Pitfalls in SVA', 0, null),
  ('general-rules-in-sva', 'General Rules in SVA', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'subject-verb-agreement';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('parts-of-an-essay-introduction-thesis-statement', 'Parts of an Essay (Introduction, Thesis Statement)', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'english' and mo.slug = 'essay-writing';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('types-of-resumes', 'Types of Resumes', 0, null),
  ('types-of-letters', 'Types of Letters', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'communication' and mo.slug = 'letters-and-resumes';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('communicative-strategies-speech-context-speech-styles', 'Communicative Strategies (Speech Context, Speech Styles)', 0, null),
  ('functions-of-communication', 'Functions of Communication', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'communication' and mo.slug = 'communicative-functions-and-strategies';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('according-to-delivery', 'According to Delivery', 0, null),
  ('according-to-purpose', 'According to Purpose', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'communication' and mo.slug = 'types-of-speeches';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('cultural-sensitivity', 'Cultural Sensitivity', 0, null),
  ('understanding-culture', 'Understanding Culture', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'communication' and mo.slug = 'culture-and-communication';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('nature-of-communication-process-of-communication-communicati', 'Nature of Communication (Process of Communication, Communication Models, Communication Strategies, Organizational Communication)', 0, null),
  ('elements-of-communication', 'Elements of Communication', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'communication' and mo.slug = 'nature-and-element-of-communication';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('motion-along-a-straight-line', 'Motion Along a Straight Line', 0, 'Graphical Representation of Motion; UARM; Constant Velocity and Acceleration; Free Fall'),
  ('momentum-and-collisions', 'Momentum and Collisions', 1, 'Collisions'),
  ('forces-and-newton-s-laws-of-motion', 'Forces and Newton''s Laws of Motion', 2, 'Forces; Newton''s Third Law; Newton''s First Law; Torque; Newton''s Second Law'),
  ('work-power-and-energy', 'Work, Power, and Energy', 3, 'Temperature and Heat; Energy; Work and Power'),
  ('waves-mirrors-and-lenses', 'Waves, Mirrors, and Lenses', 4, 'Characteristics of Waves; Properties of Waves'),
  ('scalars-and-vectors', 'Scalars and Vectors', 5, 'Resolution of Vectors; Scalar vs. Vector'),
  ('electric-circuits-and-magnets', 'Electric Circuits and Magnets', 6, 'Series and Parallel Voltage Sources; Current, Voltage & Resistance; Electric Power & Electrical Energy; Electric Circuits; Electric Charges'),
  ('circular-motion-and-gravitation', 'Circular Motion and Gravitation', 7, 'Uniform Circular Motion; Newton''s Universal Law of Gravitation'),
  ('projectile-motion', 'Projectile Motion', 8, 'An Object Projected at an Angle; An Object Projected Horizontally'),
  ('fluids', 'Fluids', 9, 'Density; Hydrostatic Pressure; Specific Gravity; Archimedes'' Principle; Fluids in Motion')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'science' and mo.slug = 'physics';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('genetics-i', 'Genetics I', 0, 'Heredity & Variation; Mendelian Laws'),
  ('the-cell-cycle', 'The Cell Cycle', 1, 'Interphase; Cell Division'),
  ('animal-anatomy-and-physiology-i', 'Animal Anatomy & Physiology I', 2, 'Levels of Organization; Animal Organ Systems'),
  ('metabolism', 'Metabolism', 3, 'Anabolism; Catabolism'),
  ('the-cell', 'The Cell', 4, 'Parts of a Cell; Movement of Materials'),
  ('evolution-and-taxonomy', 'Evolution & Taxonomy', 5, 'Taxonomy; Evolution'),
  ('ecology', 'Ecology', 6, 'Biotic Factors; Abiotic Factors'),
  ('animal-anatomy-and-physiology-ii', 'Animal Anatomy & Physiology II', 7, 'Organ Systems'),
  ('biology-the-study-of-life', 'Biology, The Study of Life', 8, 'Chemical Basis of Life')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'science' and mo.slug = 'biology';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('the-earth-and-the-moon', 'The Earth and the Moon', 0, 'Evolution of the Earth; The Moon; Movement of Earth'),
  ('plate-tectonics', 'Plate Tectonics', 1, 'Plate Movement; Plate Tectonic Theory'),
  ('the-earth-s-crust', 'The Earth''s Crust', 2, 'Properties of Minerals; Minerals; Geological Laws; Index Fossils; Rocks'),
  ('earth-s-dynamic-atmosphere', 'Earth''s Dynamic Atmosphere', 3, 'Moisture, Cloud, Precipitation; Air Movement; Basic Climate Groups; Storms'),
  ('the-universe', 'The Universe', 4, 'Composition; Planetary System'),
  ('the-spheres-of-the-earth', 'The Spheres of the Earth', 5, 'Distribution of Water; Layers of the Earth; The Geosphere; The Hydrosphere; Composition; Composition of the Atmosphere; Layers of the Atmosphere'),
  ('geological-forces', 'Geological Forces', 6, 'Volcano; Fault; Earthquakes; External Forces; Effects of Internal Forces')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'science' and mo.slug = 'earth-science';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('electron-configuration', 'Electron Configuration', 0, 'Electron Configuration; Quantum Numbers and Electron Configuration; Quantum Numbers'),
  ('mixture-of-substances', 'Mixture of Substances', 1, 'Saturation; Solubility; Mixtures and their Properties; Units of Concentration for Solutions'),
  ('organic-chemistry', 'Organic Chemistry', 2, 'Structure and Functional Groups; Isomerism'),
  ('mole-concept', 'Mole Concept', 3, 'Atomic Mass and Molecular Mass; Empirical and Molecular Formula; Avogadro''s Number and Mole'),
  ('stoichiometry', 'Stoichiometry', 4, 'Stoichiometry of Chemical Reaction; Energy in Chemical Reactions'),
  ('periodic-table-of-elements', 'Periodic Table of Elements', 5, 'Periodic Table Arrangement; Periodic Trends'),
  ('chemical-bonding', 'Chemical Bonding', 6, 'Intramolecular Forces; Molecular Geometry; Lewis Electron Dot Structure'),
  ('naming-compounds', 'Naming Compounds', 7, 'Ionic and Molecular Compounds; Naming Ionic Compounds'),
  ('chemical-reactions', 'Chemical Reactions', 8, 'Physical Change and Chemical Change; Chemical Equation'),
  ('solids-liquids-and-gases', 'Solids, Liquids, and Gases', 9, 'Gas Laws; Changes in State of Matter; Properties of the Three States of Matter'),
  ('elements-and-compounds', 'Elements and Compounds', 10, 'Brief History of the Atom; Chemical Elements; Chemical Compounds; Allotropes and Isotopes; Composition of Atoms; Radioactive Decay')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'ust' and sa.slug = 'science' and mo.slug = 'chemistry';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('parallelism-constructions', 'Parallelism Constructions', 0, null),
  ('parallelism-application', 'Parallelism Application', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'english-and-reading' and mo.slug = 'parallelism';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('common-errors-with-comparatives', 'Common Errors with Comparatives', 0, null),
  ('forming-comparatives', 'Forming Comparatives', 1, null),
  ('adjectives', 'Adjectives', 2, null),
  ('adverbs', 'Adverbs', 3, null),
  ('modifier-placement', 'Modifier Placement', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'english-and-reading' and mo.slug = 'modifiers';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('preposition-usage', 'Preposition Usage', 0, null),
  ('common-errors-in-preposition-usage', 'Common Errors in Preposition Usage', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'english-and-reading' and mo.slug = 'prepositions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('pronoun-case', 'Pronoun Case', 0, null),
  ('pronoun-antecedent-agreement', 'Pronoun-Antecedent Agreement', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'english-and-reading' and mo.slug = 'articles-nouns-and-pronouns';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('question-types', 'Question Types', 0, null),
  ('types-of-materials', 'Types of Materials', 1, null),
  ('general-tactics', 'General Tactics', 2, null),
  ('fictional-and-non-fictional-materials', 'Fictional and Non-Fictional Materials', 3, null),
  ('figures-of-speech', 'Figures of Speech', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'english-and-reading' and mo.slug = 'reading-comprehension';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('general-rules-in-sva', 'General Rules in SVA', 0, null),
  ('common-pitfalls-in-sva', 'Common Pitfalls in SVA', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'english-and-reading' and mo.slug = 'subject-verb-agreement';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('transition-words', 'Transition Words', 0, null),
  ('conjunction', 'Conjunction', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'english-and-reading' and mo.slug = 'conjunctions-and-transitions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('commonly-misused-words', 'Commonly Misused Words', 0, null),
  ('tactics-to-decipher-word-meanings', 'Tactics to Decipher Word Meanings', 1, null),
  ('analogy', 'Analogy', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'english-and-reading' and mo.slug = 'vocabulary';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('modal-verb-usage', 'Modal Verb Usage', 0, null),
  ('verb-forms-in-conditional-sentences', 'Verb Forms in Conditional Sentences', 1, null),
  ('tag-questions', 'Tag Questions', 2, null),
  ('verb-tenses', 'Verb Tenses', 3, null),
  ('verb-tense-consistency', 'Verb Tense Consistency', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'english-and-reading' and mo.slug = 'verbs';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('linear-quadratic-and-rational-inequalities', 'Linear, Quadratic and Rational Inequalities', 0, 'Linear Inequalities; Quadratic Inequalities; Rational Inequalities'),
  ('proportion-and-variation', 'Proportion and Variation', 1, 'Proportion; Variation'),
  ('two-points-and-a-line', 'Two Points and a Line', 2, 'Analytic Geometry of Two Points; Analytic Geometry of a Line'),
  ('exponents-and-radicals', 'Exponents and Radicals', 3, 'Exponents; Radicals'),
  ('operations-on-polynomials', 'Operations on Polynomials', 4, 'Multiplication of Polynomials; Division of Polynomials'),
  ('sequences-and-series', 'Sequences and Series', 5, 'Sequences; Series'),
  ('operations-on-numbers', 'Operations on Numbers', 6, 'Series of Operations on Numbers'),
  ('factoring-polynomials-and-rational-expressions', 'Factoring Polynomials and Rational Expressions', 7, 'Rational Expressions; Factoring of Polynomials'),
  ('number-system', 'Number System', 8, 'Properties of Numbers and Inequalities; Imaginary Numbers'),
  ('other-equations', 'Other Equations', 9, 'Literal Equations'),
  ('other-inequalities', 'Other Inequalities', 10, 'Absolute Value Inequalities; Compound Inequalities'),
  ('systems-of-equations-and-inequalities', 'Systems of Equations and Inequalities', 11, 'System of Linear Equations; System of Nonlinear Equations'),
  ('linear-and-quadratic-equations', 'Linear and Quadratic Equations', 12, 'Quadratic Equations')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'mathematical-proficiency' and mo.slug = 'algebra-modules';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('mensuration', 'Mensuration', 0, 'Solids; Polygons'),
  ('measurements-of-geometric-angles', 'Measurements of Geometric Angles', 1, 'Measurements of Angles'),
  ('circles-i-measure-of-angles', 'Circles I - Measure of Angles', 2, 'Measure of Angles'),
  ('congruent-and-similar-triangles', 'Congruent and Similar Triangles', 3, 'Congruent Triangles; Similar Triangles'),
  ('measurements-of-geometric-segments', 'Measurements of Geometric Segments', 4, 'Quadrilateral; Segment; Triangle'),
  ('circles-ii-measure-of-segments', 'Circles II - Measure of Segments', 5, 'Measure of Segments (Two Circles); Measure of Segments (One Circle)')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'mathematical-proficiency' and mo.slug = 'geometry-modules';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('mixture-and-solution-problems', 'Mixture and Solution Problems', 0, 'Mixture Problems; Solution Problems'),
  ('motion-problems-i', 'Motion Problems I', 1, 'Equal Distance Problems; Difference in Distance Problems; Introduction; Total Distance Problems'),
  ('age-problems', 'Age Problems', 2, 'Age Problems'),
  ('number-problems', 'Number Problems', 3, 'Number Relationship Problems; Averaging Problems; Consecutive Integer Problems'),
  ('work-problems', 'Work Problems', 4, 'Case II: Equal Time of Work for 3 Workers; Case III: Unequal Time of Work for 2 Workers; Other Cases of Work Problems; Case I: Equal Time of Work for 2 Workers'),
  ('motion-problems-ii', 'Motion Problems II', 5, 'Upstream and Downstream Problems; Other Motion Problems'),
  ('business-math-problems-i', 'Business Math Problems I', 6, 'Percent Problems; Percent Application Problems'),
  ('business-math-problems-ii', 'Business Math Problems II', 7, 'Simple Interest; Compound Interest')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'mathematical-proficiency' and mo.slug = 'word-problem-modules';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('analyzing-data-i-fundamental-skills', 'Analyzing Data I: Fundamental Skills', 0, 'Probability of an Event; Counting Techniques; Venn Diagram'),
  ('describing-data-i-one-variable', 'Describing Data I: One Variable', 1, 'Measures of Central Tendency')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'mathematical-proficiency' and mo.slug = 'statistics-modules';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('trigonometric-functions-of-angles', 'Trigonometric Functions of Angles', 0, 'Trigonometric Functions; Trigonometric Ratio'),
  ('trigonometric-functions-of-special-angles', 'Trigonometric Functions of Special Angles', 1, 'Quadrantal Angles; Reference Angles of 30°, 45°, and 60°'),
  ('trigonometric-identities', 'Trigonometric Identities', 2, 'Trigonometric Identities'),
  ('angle-measures-in-trigonometry', 'Angle Measures in Trigonometry', 3, 'Angle Measure; Quadrant and Location of Angles; Coterminal Angles')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'mathematical-proficiency' and mo.slug = 'trigonometry-modules';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('characteristics-of-a-function', 'Characteristics of a Function', 0, 'Domain and Range of a Function; Inverse Function; Zeros of a Function'),
  ('conic-section-i', 'Conic Section I', 1, 'Introduction; Circle'),
  ('definition-of-a-function', 'Definition of a Function', 2, 'Combining Functions; Evaluation of a Function; Identification of a Function'),
  ('function-and-their-graphs', 'Function and Their Graphs', 3, 'Linear Function; Polynomial Function; Quadratic Function; Rational Function'),
  ('exponential-and-logarithmic-functions', 'Exponential and Logarithmic Functions', 4, 'Logarithmic Expression; Exponential Equations; Logarithmic Equation')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'mathematical-proficiency' and mo.slug = 'function-modules';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('hypothetical-syllogism', 'Hypothetical Syllogism', 0, null),
  ('deductive-reasoning', 'Deductive Reasoning', 1, null),
  ('categorical-syllogism', 'Categorical Syllogism', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'logical-reasoning' and mo.slug = 'deduction';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('induction', 'Induction', 0, null),
  ('abduction', 'Abduction', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'admu' and sa.slug = 'logical-reasoning' and mo.slug = 'induction-and-abduction';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('tactics-to-decipher-word-meanings-context-clues-morphology-w', 'Tactics to Decipher Word Meanings (Context Clues, Morphology, Word Charge, Idioms)', 0, null),
  ('commonly-misused-words', 'Commonly Misused Words', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'writing-and-reading' and mo.slug = 'vocabulary';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('common-errors-with-comparatives', 'Common Errors with Comparatives', 0, null),
  ('forming-comparatives', 'Forming Comparatives', 1, null),
  ('modifier-placement', 'Modifier Placement', 2, null),
  ('adverbs', 'Adverbs', 3, null),
  ('adjectives', 'Adjectives', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'writing-and-reading' and mo.slug = 'modifiers';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('conjunction', 'Conjunction', 0, null),
  ('transition-words', 'Transition Words', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'writing-and-reading' and mo.slug = 'conjunctions-and-transitions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('general-tactics', 'General Tactics', 0, null),
  ('question-types', 'Question Types', 1, null),
  ('fictional-and-non-fictional-materials', 'Fictional and Non-Fictional Materials', 2, null),
  ('types-of-materials', 'Types of Materials', 3, null),
  ('figures-of-speech', 'Figures of Speech', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'writing-and-reading' and mo.slug = 'reading-comprehension';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('pronoun-antecedent-agreement', 'Pronoun-Antecedent Agreement', 0, null),
  ('pronoun-case', 'Pronoun Case', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'writing-and-reading' and mo.slug = 'articles-nouns-and-pronouns';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('academic-formality', 'Academic Formality', 0, null),
  ('outlines', 'Outlines', 1, null),
  ('types-of-academic-paper', 'Types of Academic Paper', 2, null),
  ('research-writing', 'Research Writing', 3, null),
  ('summarizing-and-paraphrasing', 'Summarizing and Paraphrasing', 4, null),
  ('rhetorical-modes', 'Rhetorical Modes', 5, null),
  ('apa-referencing-style', 'APA Referencing Style', 6, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'writing-and-reading' and mo.slug = 'academic-writing';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('preposition-usage', 'Preposition Usage', 0, null),
  ('common-errors-in-preposition-usage', 'Common Errors in Preposition Usage', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'writing-and-reading' and mo.slug = 'prepositions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('parallelism-constructions', 'Parallelism Constructions', 0, null),
  ('parallelism-application', 'Parallelism Application', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'writing-and-reading' and mo.slug = 'parallelism';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('general-rules-in-sva', 'General Rules in SVA', 0, null),
  ('common-pitfalls-in-sva', 'Common Pitfalls in SVA', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'writing-and-reading' and mo.slug = 'subject-verb-agreement';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('tag-questions', 'Tag Questions', 0, null),
  ('verb-tense-consistency', 'Verb Tense Consistency', 1, null),
  ('verb-forms-in-conditional-sentences', 'Verb Forms in Conditional Sentences', 2, null),
  ('modal-verb-usage', 'Modal Verb Usage', 3, null),
  ('verb-tenses', 'Verb Tenses', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'writing-and-reading' and mo.slug = 'verbs';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('business-math-ii', 'Business Math II', 0, 'Simple Interest; Banker''s Rule; Investment Problems; Annuity; Compound Interest')
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'mathematics' and mo.slug = 'word-problems';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('trigonometric-identities', 'Trigonometric Identities', 0, 'Sum/Difference/Double-angle Identities; Simplifying Trigonometric Functions'),
  ('trigonometric-functions-of-special-angles', 'Trigonometric Functions of Special Angles', 1, null),
  ('properties-of-trigonometric-functions', 'Properties of Trigonometric Functions', 2, 'Domain and Range; Graph of Trigonometric Functions'),
  ('trigonometric-functions-of-angles', 'Trigonometric Functions of Angles', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'mathematics' and mo.slug = 'trigonometry';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('levels-of-measurement', 'Levels of Measurement', 0, null),
  ('types-of-graphs-charts', 'Types of Graphs/Charts', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'statistics' and mo.slug = 'organizing-data';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('type-i-and-type-ii-errors', 'Type I and Type II Errors', 0, null),
  ('interpretations-on-hypothesis-testing', 'Interpretations on Hypothesis Testing', 1, null),
  ('interpretations-on-confidence-intervals', 'Interpretations on Confidence Intervals', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'statistics' and mo.slug = 'interpreting-data';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('permutations-and-combinations', 'Permutations and Combinations', 0, null),
  ('probability-of-events', 'Probability of Events', 1, null),
  ('venn-diagram', 'Venn Diagram', 2, null),
  ('fundamental-counting-principle', 'Fundamental Counting Principle', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'statistics' and mo.slug = 'analyzing-data-fundamental-skills';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('shape-of-distribution', 'Shape of Distribution', 0, null),
  ('measures-of-central-tendency', 'Measures of Central Tendency', 1, null),
  ('measures-of-dispersion', 'Measures of Dispersion', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'statistics' and mo.slug = 'describing-data-one-variable';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('interpreting-correlation-coefficients', 'Interpreting Correlation Coefficients', 0, null),
  ('interpreting-and-analyzing-regression-equations', 'Interpreting and Analyzing Regression Equations', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'statistics' and mo.slug = 'describing-data-ii-two-variables';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('normal-distribution', 'Normal Distribution', 0, null),
  ('types-of-discrete-probability-distributions', 'Types of Discrete Probability Distributions', 1, null),
  ('z-scores', 'Z-scores', 2, null),
  ('expected-value', 'Expected Value', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'statistics' and mo.slug = 'analyzing-data-ii-probability-distribution';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('movement-of-earth', 'Movement of Earth', 0, null),
  ('the-moon', 'The Moon', 1, null),
  ('evolution-of-the-earth', 'Evolution of the Earth', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'earth-science' and mo.slug = 'the-earth-and-the-moon';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('the-hydrosphere', 'The Hydrosphere', 0, null),
  ('composition', 'Composition', 1, null),
  ('the-geosphere', 'The Geosphere', 2, null),
  ('layers-of-the-earth', 'Layers of the Earth', 3, null),
  ('layers-of-the-atmosphere', 'Layers of the Atmosphere', 4, null),
  ('distribution-of-water', 'Distribution of Water', 5, null),
  ('composition-of-the-atmosphere', 'Composition of the Atmosphere', 6, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'earth-science' and mo.slug = 'the-spheres-of-the-earth';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('moisture-cloud-precipitation', 'Moisture, Cloud, Precipitation', 0, null),
  ('air-movement', 'Air Movement', 1, null),
  ('climate-change', 'Climate Change', 2, null),
  ('basic-climate-groups', 'Basic Climate Groups', 3, null),
  ('storms', 'Storms', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'earth-science' and mo.slug = 'earth-s-dynamic-atmosphere';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('geological-laws', 'Geological Laws', 0, null),
  ('minerals', 'Minerals', 1, null),
  ('index-fossils', 'Index Fossils', 2, null),
  ('rocks', 'Rocks', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'earth-science' and mo.slug = 'the-earth-s-crust';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('external-forces', 'External Forces', 0, null),
  ('effects-of-internal-forces', 'Effects of Internal Forces', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'earth-science' and mo.slug = 'geological-forces';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('plate-movement', 'Plate Movement', 0, null),
  ('plate-tectonic-theory', 'Plate Tectonic Theory', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'earth-science' and mo.slug = 'plate-tectonics';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('organ-systems', 'Organ Systems', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'biology' and mo.slug = 'animal-anatomy-and-physiology-ii';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('animal-organ-systems', 'Animal Organ Systems', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'biology' and mo.slug = 'animal-anatomy-and-physiology-i';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('biotic-factors', 'Biotic Factors', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'biology' and mo.slug = 'ecology';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('levels-of-organization', 'Levels of Organization', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'biology' and mo.slug = 'plant-anatomy-and-physiology';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('types-of-cells', 'Types of Cells', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'biology' and mo.slug = 'the-cell';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('cell-division', 'Cell Division', 0, null),
  ('interphase', 'Interphase', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'biology' and mo.slug = 'the-cell-cycle';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('chemical-basis-of-life', 'Chemical Basis of Life', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'biology' and mo.slug = 'biology-the-study-of-life';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('anabolism', 'Anabolism', 0, null),
  ('catabolism', 'Catabolism', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'biology' and mo.slug = 'metabolism';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('taxonomy', 'Taxonomy', 0, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'biology' and mo.slug = 'evolution-and-taxonomy';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('oxidation-reduction-reaction', 'Oxidation-Reduction Reaction', 0, null),
  ('physical-change-and-chemical-change', 'Physical Change and Chemical Change', 1, null),
  ('chemical-equation', 'Chemical Equation', 2, null),
  ('type-of-chemical-reaction', 'Type of Chemical Reaction', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'chemistry' and mo.slug = 'chemical-reactions';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('units-of-concentration-for-solutions', 'Units of Concentration for Solutions', 0, null),
  ('mixtures-and-their-properties', 'Mixtures and their Properties', 1, null),
  ('solubility', 'Solubility', 2, null),
  ('saturation', 'Saturation', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'chemistry' and mo.slug = 'mixture-of-substances';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('periodic-table-arrangement', 'Periodic Table Arrangement', 0, null),
  ('periodic-trends', 'Periodic Trends', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'chemistry' and mo.slug = 'periodic-table-of-elements';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('energy-in-chemical-reactions', 'Energy in Chemical Reactions', 0, null),
  ('stoichiometry-of-chemical-reaction', 'Stoichiometry of Chemical Reaction', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'chemistry' and mo.slug = 'stoichiometry';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('ionic-and-molecular-compounds', 'Ionic and Molecular Compounds', 0, null),
  ('naming-ionic-compounds', 'Naming Ionic Compounds', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'chemistry' and mo.slug = 'naming-compounds';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('chemical-compounds', 'Chemical Compounds', 0, null),
  ('chemical-elements', 'Chemical Elements', 1, null),
  ('composition-of-atoms', 'Composition of Atoms', 2, null),
  ('allotropes-and-isotopes', 'Allotropes and Isotopes', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'chemistry' and mo.slug = 'elements-and-compounds';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('quantum-numbers-and-electron-configuration', 'Quantum Numbers and Electron Configuration', 0, null),
  ('electron-configuration', 'Electron Configuration', 1, null),
  ('quantum-numbers', 'Quantum Numbers', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'chemistry' and mo.slug = 'electron-configuration';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('hydrostatic-pressure', 'Hydrostatic Pressure', 0, null),
  ('archimedes-principle', 'Archimedes'' Principle', 1, null),
  ('specific-gravity', 'Specific Gravity', 2, null),
  ('density', 'Density', 3, null),
  ('fluids-in-motion', 'Fluids in Motion', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'physics' and mo.slug = 'fluids';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('electric-power-and-electrical-energy', 'Electric Power & Electrical Energy', 0, null),
  ('electric-circuits', 'Electric Circuits', 1, null),
  ('magnets', 'Magnets', 2, null),
  ('electric-charges', 'Electric Charges', 3, null),
  ('current-voltage-and-resistance', 'Current, Voltage & Resistance', 4, null),
  ('series-and-parallel-voltage-sources', 'Series and Parallel Voltage Sources', 5, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'physics' and mo.slug = 'electric-circuits-and-magnets';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('energy', 'Energy', 0, null),
  ('thermal-expansion', 'Thermal Expansion', 1, null),
  ('temperature-and-heat', 'Temperature and Heat', 2, null),
  ('work-and-power', 'Work and Power', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'physics' and mo.slug = 'work-power-and-energy';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('an-object-projected-at-an-angle', 'An Object Projected at an Angle', 0, null),
  ('an-object-projected-horizontally', 'An Object Projected Horizontally', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'physics' and mo.slug = 'projectile-motion';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('graphical-representation-of-motion', 'Graphical Representation of Motion', 0, null),
  ('uarm', 'UARM', 1, null),
  ('free-fall', 'Free Fall', 2, null),
  ('constant-velocity-and-acceleration', 'Constant Velocity and Acceleration', 3, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'physics' and mo.slug = 'motion-along-a-straight-line';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('newton-s-second-law', 'Newton''s Second Law', 0, null),
  ('forces', 'Forces', 1, null),
  ('newton-s-third-law', 'Newton''s Third Law', 2, null),
  ('newton-s-first-law', 'Newton''s First Law', 3, null),
  ('torque', 'Torque', 4, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'physics' and mo.slug = 'forces-and-newton-s-laws-of-motion';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('newton-s-universal-law-of-gravitation', 'Newton''s Universal Law of Gravitation', 0, null),
  ('uniform-circular-motion', 'Uniform Circular Motion', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'physics' and mo.slug = 'circular-motion-and-gravitation';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('characteristics-of-waves', 'Characteristics of Waves', 0, null),
  ('properties-of-waves', 'Properties of Waves', 1, null),
  ('mirrors-and-lenses', 'Mirrors & Lenses', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'physics' and mo.slug = 'waves-mirrors-and-lenses';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('speed-vs-velocity', 'Speed vs. Velocity', 0, null),
  ('resolution-of-vectors', 'Resolution of Vectors', 1, null),
  ('distance-vs-displacement', 'Distance vs. Displacement', 2, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'physics' and mo.slug = 'scalars-and-vectors';

insert into lessons (module_id, slug, name, sort_order, priority_notes)
select mo.id, l.slug, l.name, l.sort_order, l.priority_notes
from modules mo join subject_areas sa on sa.id = mo.subject_area_id, (values
  ('momentum', 'Momentum', 0, null),
  ('collisions', 'Collisions', 1, null)
) as l(slug, name, sort_order, priority_notes)
where sa.scope = 'dlsu' and sa.slug = 'physics' and mo.slug = 'momentum-and-collisions';

