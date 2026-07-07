-- Practice questions for UPCAT (UP College Admission Test) subjects.
-- All questions below are AI-drafted originals inspired by publicly known UPCAT
-- format/topics research; they are NOT copied from any copyrighted reviewer material.
-- Mark for human review before treating as authoritative.

-- =========================================================
-- Reading Comprehension
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Main Idea', 'A short passage describes how mangrove forests along coastal towns slow down storm surges by absorbing wave energy before it reaches inland communities. Which sentence best captures the main idea of the passage?', '[{"key":"A","text":"Mangroves are difficult to plant in sandy soil."},{"key":"B","text":"Mangrove forests protect coastal communities by reducing the force of storm surges."},{"key":"C","text":"Storm surges are the leading cause of coastal erosion in the Philippines."},{"key":"D","text":"Fishermen rely on mangroves for their daily catch."}]'::jsonb, 'B', 'The passage centers on the protective function of mangroves against storm surges, not on planting difficulty, erosion causes in general, or fishing.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'In a passage, a scientist notes that a newly discovered insect species is found only on a single isolated island and nowhere else in the world. What can be reasonably inferred about this species?', '[{"key":"A","text":"It migrated recently from a nearby continent."},{"key":"B","text":"It is likely endemic to that island."},{"key":"C","text":"It was introduced by human traders."},{"key":"D","text":"It can survive in any climate."}]'::jsonb, 'B', 'A species found only in one specific location and nowhere else is, by definition, endemic to that location.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Tone', 'An essay describes a city government''s new recycling program in detail, praising its early results but also questioning whether funding will continue past the pilot year. The author''s tone can best be described as', '[{"key":"A","text":"cautiously optimistic"},{"key":"B","text":"deeply cynical"},{"key":"C","text":"completely indifferent"},{"key":"D","text":"outright hostile"}]'::jsonb, 'A', 'The author praises the results (optimism) while raising a concern about future funding (caution), which together indicate a cautiously optimistic tone.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Detail/Fact Recall', 'Sa isang talata, sinabi na ang bulkang Mayon ay kilala dahil sa halos perpektong hugis-kono nito. Ayon sa talata, bakit sikat ang Bulkang Mayon?', '[{"key":"A","text":"Dahil ito ang pinakamataas na bundok sa Pilipinas."},{"key":"B","text":"Dahil sa halos perpektong hugis-kono nito."},{"key":"C","text":"Dahil ito ay matatagpuan sa Maynila."},{"key":"D","text":"Dahil hindi na ito aktibong bulkan."}]'::jsonb, 'B', 'Direktang nakasaad sa talata na ang Mayon ay kilala dahil sa halos perpektong hugis-kono nito.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Purpose', 'A writer compares three brands of study planners, listing prices, page layouts, and durability for each. The primary purpose of this passage is most likely to', '[{"key":"A","text":"persuade readers that studying is unnecessary"},{"key":"B","text":"help readers make an informed purchase decision"},{"key":"C","text":"entertain readers with a fictional story"},{"key":"D","text":"argue against the use of planners altogether"}]'::jsonb, 'B', 'A comparison of features across products is typically written to inform a purchase decision, which is an informative/persuasive purpose distinct from entertainment or argument against the product category.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'In the sentence "The committee''s decision was met with vehement objections from the residents," the word "vehement" most nearly means', '[{"key":"A","text":"mild"},{"key":"B","text":"intense"},{"key":"C","text":"silent"},{"key":"D","text":"delayed"}]'::jsonb, 'B', '"Vehement" means showing strong, forceful feeling, which is closest to "intense."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Logical Structure', 'A passage first presents a problem (declining fish catch), then presents two competing explanations, and finally evaluates evidence for each. This passage is organized primarily using which structure?', '[{"key":"A","text":"Chronological narrative"},{"key":"B","text":"Problem-and-evaluation of causes"},{"key":"C","text":"Simple description of a place"},{"key":"D","text":"Persuasive call to action only"}]'::jsonb, 'B', 'The passage moves from stating a problem to weighing possible causes, which is a problem/cause-evaluation structure rather than narrative, description, or pure persuasion.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

-- =========================================================
-- Language Proficiency
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar - Subject-Verb Agreement', 'Choose the sentence that is grammatically correct.', '[{"key":"A","text":"Each of the students have submitted their project."},{"key":"B","text":"Each of the students has submitted their project."},{"key":"C","text":"Each of the student have submit their project."},{"key":"D","text":"Each of the students is submitted their project."}]'::jsonb, 'B', '"Each" is singular, so it takes the singular verb "has," making option B correct.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sentence Improvement', 'Identify the best revision of the underlined portion: "Being that the weather was bad, the field trip was postponed."', '[{"key":"A","text":"Being that the weather was bad,"},{"key":"B","text":"Because the weather was bad,"},{"key":"C","text":"Being as the weather was bad,"},{"key":"D","text":"Due to the fact of bad weather,"}]'::jsonb, 'B', '"Because" is the standard, concise conjunction; "being that," "being as," and "due to the fact of" are wordy or nonstandard.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary - Synonym', 'Choose the word closest in meaning to "meticulous."', '[{"key":"A","text":"careless"},{"key":"B","text":"careful"},{"key":"C","text":"hurried"},{"key":"D","text":"generous"}]'::jsonb, 'B', '"Meticulous" means showing great attention to detail, which is closest to "careful."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary - Antonym', 'Choose the word most nearly OPPOSITE in meaning to "candid."', '[{"key":"A","text":"honest"},{"key":"B","text":"blunt"},{"key":"C","text":"evasive"},{"key":"D","text":"direct"}]'::jsonb, 'C', '"Candid" means open and truthful; "evasive" (avoiding directness) is its opposite.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino Grammar - Panghalip', 'Piliin ang pangungusap na wastong gamit ng panghalip.', '[{"key":"A","text":"Ako at siya ay pumunta sa palengke."},{"key":"B","text":"Siya at ako ay pumunta sa palengke."},{"key":"C","text":"Ako at ikaw ay pumunta kami sa palengke."},{"key":"D","text":"Kami ni siya ay pumunta sa palengke."}]'::jsonb, 'B', 'Sa magalang at wastong paggamit ng wika, inilalagay ang ibang tao bago ang sarili: "Siya at ako."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Idiomatic Usage', 'Complete the idiom: "The negotiations finally reached a ______ after months of disagreement."', '[{"key":"A","text":"dead end"},{"key":"B","text":"common ground"},{"key":"C","text":"loose end"},{"key":"D","text":"blind spot"}]'::jsonb, 'B', '"Reach common ground" is the standard idiom meaning to find shared agreement.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar - Parallelism', 'Choose the sentence with correct parallel structure.', '[{"key":"A","text":"She enjoys reading, to write, and painting."},{"key":"B","text":"She enjoys reading, writing, and painting."},{"key":"C","text":"She enjoys to read, writing, and paint."},{"key":"D","text":"She enjoys read, write, and paint."}]'::jsonb, 'B', 'Parallel structure requires all items in a list to share the same grammatical form; "reading, writing, and painting" are all gerunds.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Error Identification', 'Identify the part of the sentence that contains an error: "Neither of the answers (A) are (B) correct, so (C) we must (D) revise the question."', '[{"key":"A","text":"(A) Neither of the answers"},{"key":"B","text":"(B) are"},{"key":"C","text":"(C) so"},{"key":"D","text":"(D) revise the question"}]'::jsonb, 'B', '"Neither" is singular and requires "is," not "are," making (B) the error.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

-- =========================================================
-- Mathematics
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Linear Equations', 'Solve for x: 3x - 7 = 2x + 5', '[{"key":"A","text":"x = -12"},{"key":"B","text":"x = 2"},{"key":"C","text":"x = 12"},{"key":"D","text":"x = -2"}]'::jsonb, 'C', 'Subtract 2x from both sides: x - 7 = 5. Add 7 to both sides: x = 12.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Quadratic Equations', 'What are the roots of x^2 - 5x + 6 = 0?', '[{"key":"A","text":"x = 2 and x = 3"},{"key":"B","text":"x = -2 and x = -3"},{"key":"C","text":"x = 1 and x = 6"},{"key":"D","text":"x = -1 and x = -6"}]'::jsonb, 'A', 'Factoring gives (x-2)(x-3) = 0, so x = 2 or x = 3.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Area', 'A rectangular garden has a length of 12 meters and a width of 8 meters. What is its area?', '[{"key":"A","text":"40 square meters"},{"key":"B","text":"96 square meters"},{"key":"C","text":"20 square meters"},{"key":"D","text":"104 square meters"}]'::jsonb, 'B', 'Area of a rectangle = length x width = 12 x 8 = 96 square meters.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Triangles', 'In a right triangle, the two legs measure 6 cm and 8 cm. What is the length of the hypotenuse?', '[{"key":"A","text":"10 cm"},{"key":"B","text":"14 cm"},{"key":"C","text":"12 cm"},{"key":"D","text":"9 cm"}]'::jsonb, 'A', 'By the Pythagorean theorem, hypotenuse = sqrt(6^2 + 8^2) = sqrt(36+64) = sqrt(100) = 10 cm.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problems - Rate/Work', 'Worker A can finish a task in 6 hours, and Worker B can finish the same task in 3 hours. If they work together, how many hours will it take to finish the task?', '[{"key":"A","text":"2 hours"},{"key":"B","text":"4.5 hours"},{"key":"C","text":"1 hour"},{"key":"D","text":"9 hours"}]'::jsonb, 'A', 'Combined rate = 1/6 + 1/3 = 1/6 + 2/6 = 3/6 = 1/2 task per hour, so time = 1 / (1/2) = 2 hours.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Statistics - Mean', 'The scores of five students on a quiz are 8, 10, 6, 9, and 7. What is the mean score?', '[{"key":"A","text":"7"},{"key":"B","text":"8"},{"key":"C","text":"9"},{"key":"D","text":"8.5"}]'::jsonb, 'B', 'Sum = 8+10+6+9+7 = 40. Mean = 40 / 5 = 8.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Ratio and Proportion', 'If 4 workers can build a wall in 9 days, how many days will it take 6 workers to build the same wall, assuming the same work rate per worker?', '[{"key":"A","text":"6 days"},{"key":"B","text":"12 days"},{"key":"C","text":"13.5 days"},{"key":"D","text":"4 days"}]'::jsonb, 'A', 'Total work = 4 x 9 = 36 worker-days. With 6 workers: 36 / 6 = 6 days.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Trigonometry - Basic Ratios', 'In a right triangle, angle theta has an opposite side of 3 and a hypotenuse of 5. What is sin(theta)?', '[{"key":"A","text":"3/5"},{"key":"B","text":"4/5"},{"key":"C","text":"5/3"},{"key":"D","text":"3/4"}]'::jsonb, 'A', 'sin(theta) = opposite / hypotenuse = 3/5.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

-- =========================================================
-- Science
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Cell Structure', 'Which organelle is primarily responsible for producing ATP through cellular respiration?', '[{"key":"A","text":"Nucleus"},{"key":"B","text":"Mitochondrion"},{"key":"C","text":"Ribosome"},{"key":"D","text":"Golgi apparatus"}]'::jsonb, 'B', 'The mitochondrion is known as the "powerhouse of the cell" because it generates ATP through cellular respiration.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Genetics', 'In pea plants, if a heterozygous tall plant (Tt) is crossed with a homozygous recessive short plant (tt), what fraction of the offspring is expected to be tall?', '[{"key":"A","text":"1/4"},{"key":"B","text":"1/2"},{"key":"C","text":"3/4"},{"key":"D","text":"All of them"}]'::jsonb, 'B', 'A Tt x tt cross produces offspring in a 1:1 ratio of Tt (tall) to tt (short), so 1/2 are expected to be tall.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Periodic Table', 'Which of the following elements is classified as a noble gas?', '[{"key":"A","text":"Chlorine"},{"key":"B","text":"Sodium"},{"key":"C","text":"Neon"},{"key":"D","text":"Sulfur"}]'::jsonb, 'C', 'Neon belongs to Group 18 of the periodic table, the noble gases, which are generally inert.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Chemical Reactions', 'What type of reaction is represented by: 2H2 + O2 -> 2H2O?', '[{"key":"A","text":"Decomposition"},{"key":"B","text":"Single replacement"},{"key":"C","text":"Synthesis (combination)"},{"key":"D","text":"Double replacement"}]'::jsonb, 'C', 'Two or more substances (H2 and O2) combine to form a single product (H2O), which defines a synthesis reaction.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Kinematics', 'A car accelerates uniformly from rest to 20 m/s in 4 seconds. What is its acceleration?', '[{"key":"A","text":"2 m/s^2"},{"key":"B","text":"5 m/s^2"},{"key":"C","text":"8 m/s^2"},{"key":"D","text":"80 m/s^2"}]'::jsonb, 'B', 'Acceleration = change in velocity / time = (20 - 0) / 4 = 5 m/s^2.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Force and Motion', 'According to Newton''s Second Law, if a 10 kg object experiences a net force of 20 N, what is its acceleration?', '[{"key":"A","text":"200 m/s^2"},{"key":"B","text":"0.5 m/s^2"},{"key":"C","text":"2 m/s^2"},{"key":"D","text":"10 m/s^2"}]'::jsonb, 'C', 'F = ma, so a = F/m = 20 N / 10 kg = 2 m/s^2.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Plate Tectonics', 'The Philippines experiences frequent earthquakes and volcanic activity primarily because it lies along which major geological feature?', '[{"key":"A","text":"The Mid-Atlantic Ridge"},{"key":"B","text":"The Pacific Ring of Fire"},{"key":"C","text":"The Great Rift Valley"},{"key":"D","text":"The Sahara Plate boundary"}]'::jsonb, 'B', 'The Philippines sits along the Pacific Ring of Fire, a zone of intense seismic and volcanic activity caused by converging tectonic plates.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Ecology', 'In a food chain of grass -> grasshopper -> frog -> snake, which organism is the secondary consumer?', '[{"key":"A","text":"Grass"},{"key":"B","text":"Grasshopper"},{"key":"C","text":"Frog"},{"key":"D","text":"Snake"}]'::jsonb, 'C', 'The grasshopper is the primary consumer (eats producers), so the frog, which eats the grasshopper, is the secondary consumer.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';
