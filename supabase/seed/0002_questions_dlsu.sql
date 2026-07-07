-- Practice questions for DLSU / DCAT (De La Salle University College Admission Test).
-- Sourced from public research on DCAT format (aptitude/verbal-logical reasoning, quantitative reasoning,
-- reading comprehension, and science sections). Questions below are original, AI-drafted items written to be
-- representative of publicly documented DCAT topics/difficulty -- they are NOT copied from any DCAT reviewer.
-- All rows must be reviewed by a human before being treated as exam-accurate.

-- =========================================================
-- Reading Comprehension
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Main Idea', 'Read the passage: "Urban gardens have grown popular in Metro Manila not simply because they supply fresh produce, but because they give residents of dense neighborhoods a shared outdoor space that fosters community ties." What is the main idea of the passage?', '[{"key":"A","text":"Urban gardens are mainly a source of income for city residents."},{"key":"B","text":"Urban gardens are valued for both food production and building community."},{"key":"C","text":"Metro Manila lacks outdoor space for its residents."},{"key":"D","text":"Community ties are only formed through shared meals."}]'::jsonb, 'B', 'The passage explicitly states urban gardens matter for two reasons: fresh produce and fostering community ties, making B the most complete main idea.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'Passage: "Although the museum''s new wing was completed on schedule, curators delayed its opening for three months, citing the need to properly climate-control the fragile textile exhibits." What can be inferred about the curators?', '[{"key":"A","text":"They were indifferent to the exhibits'' condition."},{"key":"B","text":"They prioritized preserving the artifacts over an on-time opening."},{"key":"C","text":"They ran out of funding to open on time."},{"key":"D","text":"They disagreed with the museum''s original schedule."}]'::jsonb, 'B', 'The curators chose to delay the opening specifically to protect fragile textiles, showing they valued preservation over punctuality.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Tone', 'Passage: "It is baffling that city planners would once again approve a mall in a flood-prone area, ignoring years of resident complaints and clear hydrological data." The author''s tone can best be described as:', '[{"key":"A","text":"Indifferent"},{"key":"B","text":"Critical"},{"key":"C","text":"Celebratory"},{"key":"D","text":"Neutral"}]'::jsonb, 'B', 'Words like "baffling" and "ignoring" signal disapproval, making the tone critical.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Data Interpretation', 'A short article states: "Enrollment in the university''s online certificate programs rose from 1,200 in 2021 to 3,000 in 2024, while enrollment in traditional evening classes fell by 15% over the same period." Which conclusion is best supported?', '[{"key":"A","text":"Total university enrollment declined between 2021 and 2024."},{"key":"B","text":"Online certificate programs grew while evening class enrollment shrank."},{"key":"C","text":"Evening classes are being phased out entirely."},{"key":"D","text":"Online programs are cheaper than evening classes."}]'::jsonb, 'B', 'The passage gives two separate trends -- online growth and evening-class decline -- without claiming anything about total enrollment, cost, or elimination of evening classes.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'Passage: "The negotiator''s conciliatory remarks defused what had threatened to become a heated dispute." As used here, "conciliatory" most nearly means:', '[{"key":"A","text":"Aggressive"},{"key":"B","text":"Appeasing"},{"key":"C","text":"Confusing"},{"key":"D","text":"Formal"}]'::jsonb, 'B', 'Conciliatory means intended to placate or pacify, matching "appeasing" and fitting the context of defusing a dispute.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Purpose', 'A passage explains the steps a barangay took to reduce flooding, then ends: "Other local governments facing similar drainage issues would do well to study this model." What is the author''s primary purpose?', '[{"key":"A","text":"To criticize other local governments"},{"key":"B","text":"To recommend a successful approach as a model for others"},{"key":"C","text":"To entertain readers with a local story"},{"key":"D","text":"To argue that flooding cannot be solved"}]'::jsonb, 'B', 'The closing line explicitly recommends the model to others, showing the purpose is persuasive/informative recommendation.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Supporting Detail', 'Passage: "Coral bleaching occurs when stressed corals expel the algae living in their tissues, causing them to turn white. Rising sea temperatures are the most common cause of this stress." According to the passage, coral turns white because:', '[{"key":"A","text":"The coral dies immediately when temperatures rise."},{"key":"B","text":"The coral expels the algae that live within it."},{"key":"C","text":"Algae multiply rapidly inside the coral."},{"key":"D","text":"Ocean pollution bleaches the coral directly."}]'::jsonb, 'B', 'The passage states directly that bleaching happens when corals expel their algae, which is the supporting detail asked for.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

-- =========================================================
-- Verbal Reasoning (vocabulary, analogies, grammar, and logical/abstract reasoning)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'THERMOMETER is to TEMPERATURE as BAROMETER is to:', '[{"key":"A","text":"Humidity"},{"key":"B","text":"Pressure"},{"key":"C","text":"Wind speed"},{"key":"D","text":"Altitude"}]'::jsonb, 'B', 'A thermometer measures temperature; a barometer measures atmospheric pressure -- the analogy is instrument-to-measured-quantity.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word that is most nearly OPPOSITE in meaning to "frugal":', '[{"key":"A","text":"Thrifty"},{"key":"B","text":"Extravagant"},{"key":"C","text":"Modest"},{"key":"D","text":"Cautious"}]'::jsonb, 'B', 'Frugal means careful with money; extravagant, meaning wasteful spending, is its opposite.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Letter/Number Series', 'Find the next term in the series: B2, D4, F8, H16, ___', '[{"key":"A","text":"I24"},{"key":"B","text":"J32"},{"key":"C","text":"J24"},{"key":"D","text":"K32"}]'::jsonb, 'B', 'Letters skip one each time (B, D, F, H, J) and numbers double each time (2, 4, 8, 16, 32), giving J32.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar and Usage', 'Choose the sentence that is grammatically correct:', '[{"key":"A","text":"Neither of the students have submitted their project."},{"key":"B","text":"Neither of the students has submitted their project."},{"key":"C","text":"Neither of the student have submitted its project."},{"key":"D","text":"Neither of the students has submit their project."}]'::jsonb, 'B', '"Neither" takes a singular verb ("has"), so option B correctly pairs the singular subject with the singular verb form.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Logical Reasoning', 'All Lasallians value discipline. Maria is a Lasallian. Which statement must be true?', '[{"key":"A","text":"Maria values discipline."},{"key":"B","text":"Maria does not value discipline."},{"key":"C","text":"All disciplined people are Lasallians."},{"key":"D","text":"Maria is the most disciplined Lasallian."}]'::jsonb, 'A', 'This is a straightforward syllogism: if all Lasallians value discipline and Maria is a Lasallian, then Maria values discipline.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Blood Relations', 'Pointing to a photograph, Ana says, "Her mother is the only daughter of my mother." How is Ana related to the girl in the photograph?', '[{"key":"A","text":"Mother"},{"key":"B","text":"Sister"},{"key":"C","text":"Grandmother"},{"key":"D","text":"Aunt"}]'::jsonb, 'A', '"The only daughter of my mother" is Ana herself, so the girl''s mother is Ana, making Ana the girl''s mother.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'AUTHOR is to NOVEL as COMPOSER is to:', '[{"key":"A","text":"Orchestra"},{"key":"B","text":"Symphony"},{"key":"C","text":"Piano"},{"key":"D","text":"Audience"}]'::jsonb, 'B', 'An author creates a novel; a composer creates a symphony -- the analogy is creator-to-created-work.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Coding-Decoding', 'In a certain code, "TABLE" is written as "UBCMF". How would "CHAIR" be written in the same code?', '[{"key":"A","text":"DIBJS"},{"key":"B","text":"DIBJT"},{"key":"C","text":"BGZHQ"},{"key":"D","text":"DJBIS"}]'::jsonb, 'A', 'Each letter is shifted forward by one in the alphabet (T->U, A->B, B->C, L->M, E->F), so CHAIR becomes DIBJS.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

-- =========================================================
-- Quantitative Reasoning
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra', 'If 3x - 7 = 2x + 5, what is the value of x?', '[{"key":"A","text":"10"},{"key":"B","text":"12"},{"key":"C","text":"14"},{"key":"D","text":"8"}]'::jsonb, 'B', 'Subtract 2x from both sides: x - 7 = 5, so x = 12.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem - Age', 'Five years ago, Rico was twice as old as his sister. If Rico is currently 25 years old, how old is his sister now?', '[{"key":"A","text":"12"},{"key":"B","text":"15"},{"key":"C","text":"17"},{"key":"D","text":"20"}]'::jsonb, 'C', 'Five years ago Rico was 25 - 5 = 20, and he was twice his sister''s age then, so his sister was 10. Adding the 5 years back, her current age is 10 + 5 = 15.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry', 'A rectangular garden has a length of 15 meters and a width of 8 meters. What is its area?', '[{"key":"A","text":"46 square meters"},{"key":"B","text":"120 square meters"},{"key":"C","text":"92 square meters"},{"key":"D","text":"60 square meters"}]'::jsonb, 'B', 'Area of a rectangle = length x width = 15 x 8 = 120 square meters.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Percentages', 'A jacket originally priced at Php 2,400 is on sale for 25% off. What is the sale price?', '[{"key":"A","text":"Php 1,600"},{"key":"B","text":"Php 1,800"},{"key":"C","text":"Php 2,000"},{"key":"D","text":"Php 2,100"}]'::jsonb, 'B', '25% of 2,400 is 600. Subtracting from the original price: 2,400 - 600 = 1,800.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Work-Rate Problem', 'Worker A can finish a task in 6 hours, and Worker B can finish the same task in 3 hours. Working together, how many hours will they take to finish the task?', '[{"key":"A","text":"1 hour"},{"key":"B","text":"1.5 hours"},{"key":"C","text":"2 hours"},{"key":"D","text":"4.5 hours"}]'::jsonb, 'C', 'Combined rate = 1/6 + 1/3 = 1/6 + 2/6 = 3/6 = 1/2 task per hour, so together they finish in 2 hours.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Statistics', 'The scores of five students on a quiz are 8, 9, 7, 10, and 6. What is the median score?', '[{"key":"A","text":"6"},{"key":"B","text":"7"},{"key":"C","text":"8"},{"key":"D","text":"9"}]'::jsonb, 'C', 'Sorted, the scores are 6, 7, 8, 9, 10. The middle value (median) is 8.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Probability', 'A bag contains 4 red balls and 6 blue balls. If one ball is drawn at random, what is the probability that it is red?', '[{"key":"A","text":"2/5"},{"key":"B","text":"1/2"},{"key":"C","text":"3/5"},{"key":"D","text":"1/4"}]'::jsonb, 'A', 'There are 4 red balls out of 10 total, so the probability is 4/10 = 2/5.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Quadratic Equations', 'What are the roots of the equation x^2 - 5x + 6 = 0?', '[{"key":"A","text":"x = 2 and x = 3"},{"key":"B","text":"x = -2 and x = -3"},{"key":"C","text":"x = 1 and x = 6"},{"key":"D","text":"x = -1 and x = -6"}]'::jsonb, 'A', 'Factoring gives (x - 2)(x - 3) = 0, so x = 2 or x = 3.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

-- =========================================================
-- Science
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Cell Structure', 'Which organelle is primarily responsible for producing ATP, the cell''s main energy currency?', '[{"key":"A","text":"Ribosome"},{"key":"B","text":"Mitochondrion"},{"key":"C","text":"Golgi apparatus"},{"key":"D","text":"Lysosome"}]'::jsonb, 'B', 'Mitochondria carry out cellular respiration, converting glucose and oxygen into ATP energy.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Periodic Table', 'Which of the following elements is a noble gas?', '[{"key":"A","text":"Chlorine"},{"key":"B","text":"Neon"},{"key":"C","text":"Sodium"},{"key":"D","text":"Sulfur"}]'::jsonb, 'B', 'Neon belongs to Group 18 of the periodic table, the noble gases, which are largely unreactive.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Motion', 'A car accelerates uniformly from rest to 20 m/s in 4 seconds. What is its acceleration?', '[{"key":"A","text":"4 m/s^2"},{"key":"B","text":"5 m/s^2"},{"key":"C","text":"8 m/s^2"},{"key":"D","text":"80 m/s^2"}]'::jsonb, 'B', 'Acceleration = change in velocity / time = (20 - 0) / 4 = 5 m/s^2.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Chemical Reactions', 'In the reaction 2H2 + O2 -> 2H2O, what type of reaction is this?', '[{"key":"A","text":"Decomposition"},{"key":"B","text":"Synthesis (combination)"},{"key":"C","text":"Single replacement"},{"key":"D","text":"Double replacement"}]'::jsonb, 'B', 'Two or more reactants (hydrogen and oxygen) combine to form a single product (water), which defines a synthesis reaction.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Weather', 'Which layer of the atmosphere is closest to Earth''s surface and where most weather occurs?', '[{"key":"A","text":"Stratosphere"},{"key":"B","text":"Mesosphere"},{"key":"C","text":"Troposphere"},{"key":"D","text":"Thermosphere"}]'::jsonb, 'C', 'The troposphere is the lowest atmospheric layer and contains most of the water vapor and weather phenomena.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Genetics', 'In a monohybrid cross between two heterozygous (Aa x Aa) pea plants, what fraction of the offspring is expected to show the recessive phenotype?', '[{"key":"A","text":"1/4"},{"key":"B","text":"1/2"},{"key":"C","text":"3/4"},{"key":"D","text":"0"}]'::jsonb, 'A', 'A Punnett square for Aa x Aa gives genotype ratio 1 AA : 2 Aa : 1 aa, so 1/4 of offspring are homozygous recessive (aa) and show the recessive phenotype.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Energy', 'A ball is dropped from a height and falls freely under gravity. As it falls, what happens to its kinetic and potential energy (ignoring air resistance)?', '[{"key":"A","text":"Both increase"},{"key":"B","text":"Both decrease"},{"key":"C","text":"Kinetic energy increases while potential energy decreases"},{"key":"D","text":"Kinetic energy decreases while potential energy increases"}]'::jsonb, 'C', 'As the ball falls, height (and thus potential energy) decreases while its speed (and thus kinetic energy) increases, conserving total mechanical energy.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Acids and Bases', 'A solution has a pH of 3. Which statement about this solution is correct?', '[{"key":"A","text":"It is strongly basic"},{"key":"B","text":"It is neutral"},{"key":"C","text":"It is acidic"},{"key":"D","text":"It has no hydrogen ions"}]'::jsonb, 'C', 'A pH below 7 indicates an acidic solution; the lower the number, the more acidic it is.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';
