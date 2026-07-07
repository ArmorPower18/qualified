-- ACET (Ateneo College Entrance Test) practice questions.
-- Research summary (public sources: ateneo.edu admissions FAQ, upcatchampion.com ACET guide,
-- review.ahead.edu.ph, collegedunia ACET exam pattern, and various reviewer PDFs on Studocu/Scribd):
--   - ACET is a paper/computer-based, timed, multiple-choice test (no penalty for wrong answers)
--     plus one timed essay-writing segment.
--   - Core content areas consistently reported: Verbal Ability (vocabulary, analogy, reading
--     comprehension, grammar), Mathematical Ability (arithmetic, algebra, geometry, word problems,
--     basic trigonometry, quantitative reasoning), Science (general biology, chemistry, physics
--     concepts), and an Essay Writing segment (a single prompt, timed, no auto-grading — scored
--     holistically for organization, reasoning, and language use).
--   - Publicly available sources disagree on the exact minute-by-minute breakdown per section
--     (self-reported test-taker accounts vary year to year), so exact per-section timings used in
--     0003_mock_test_admu.sql are best-effort approximations and flagged there for human review.
-- All questions below are original, AI-drafted, and written to be representative of the reported
-- topics/difficulty — none are copied from any reviewer material found online.

-- =========================================================
-- VERBAL ABILITY
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word that is closest in meaning to "CANDID."', '[{"key":"A","text":"Frank"},{"key":"B","text":"Cautious"},{"key":"C","text":"Elaborate"},{"key":"D","text":"Timid"}]'::jsonb, 'A', '"Candid" means open and honest in expression, which is closest to "frank." The other options describe different qualities (carefulness, wordiness, shyness) that are not synonyms.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'PEN is to WRITER as SCALPEL is to ____.', '[{"key":"A","text":"Kitchen"},{"key":"B","text":"Surgeon"},{"key":"C","text":"Metal"},{"key":"D","text":"Hospital"}]'::jsonb, 'B', 'A pen is the primary tool of a writer, just as a scalpel is the primary tool of a surgeon. The relationship is tool-to-user, so "surgeon" completes the analogy.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Reading Comprehension', 'Passage: "Urban gardens do more than beautify neighborhoods. Studies show they lower local air temperatures, reduce stormwater runoff, and give city residents without yards a place to grow their own food. Yet many city governments still treat them as temporary land uses rather than permanent infrastructure." Based on the passage, the author''s main concern is that urban gardens are ____.', '[{"key":"A","text":"Not popular with residents"},{"key":"B","text":"Undervalued in long-term city planning"},{"key":"C","text":"Harmful to stormwater systems"},{"key":"D","text":"Too costly to maintain"}]'::jsonb, 'B', 'The passage lists benefits of urban gardens and then contrasts them with the fact that cities treat them as "temporary" rather than "permanent infrastructure," implying the author believes they deserve more serious, long-term planning status.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar', 'Choose the sentence that is grammatically correct.', '[{"key":"A","text":"Neither of the students have finished their project."},{"key":"B","text":"Neither of the students has finished their project."},{"key":"C","text":"Neither of the students has finished his or her project."},{"key":"D","text":"Neither of the students finish their project."}]'::jsonb, 'C', '"Neither" is singular and takes a singular verb ("has"), and the pronoun should agree in a formally correct way with a singular antecedent ("his or her"), making option C the most grammatically precise choice.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word that is most nearly OPPOSITE in meaning to "AUSTERE."', '[{"key":"A","text":"Strict"},{"key":"B","text":"Lavish"},{"key":"C","text":"Plain"},{"key":"D","text":"Somber"}]'::jsonb, 'B', '"Austere" describes something stark, severe, or without luxury. "Lavish" (extravagant, abundant) is its clearest opposite among the choices.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'DROUGHT is to WATER as FAMINE is to ____.', '[{"key":"A","text":"Rain"},{"key":"B","text":"Food"},{"key":"C","text":"Poverty"},{"key":"D","text":"Disease"}]'::jsonb, 'B', 'A drought is defined by a lack of water, just as a famine is defined by a lack of food. The relationship is "condition caused by the absence of X."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Reading Comprehension', 'Passage: "Contrary to popular belief, the octopus''s famed intelligence is not centralized in a single brain. About two-thirds of its neurons are distributed along its eight arms, allowing each arm to process sensory information and even react independently of the central brain." Which of the following best restates the passage''s main idea?', '[{"key":"A","text":"Octopuses do not have brains at all."},{"key":"B","text":"Octopus intelligence is spread across its body, not confined to one organ."},{"key":"C","text":"Octopus arms are more intelligent than their brains."},{"key":"D","text":"Most animal neurons are located in the limbs."}]'::jsonb, 'B', 'The passage explains that a large share of the octopus''s neurons are in its arms, meaning cognitive processing is distributed rather than centralized — option B captures this without overstating it as in C or D.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sentence Completion', 'Despite the committee''s ____ efforts to reach a compromise, the two factions remained ____ in their positions.', '[{"key":"A","text":"half-hearted . . flexible"},{"key":"B","text":"diligent . . intransigent"},{"key":"C","text":"careless . . united"},{"key":"D","text":"brief . . agreeable"}]'::jsonb, 'B', 'The sentence sets up a contrast ("despite") between the committee''s effort and the factions'' stance. "Diligent" (hardworking) effort contrasted with "intransigent" (unyielding) positions creates the logical opposition the sentence requires.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

-- =========================================================
-- MATHEMATICAL ABILITY
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra', 'If 3x - 7 = 2x + 5, what is the value of x?', '[{"key":"A","text":"8"},{"key":"B","text":"10"},{"key":"C","text":"12"},{"key":"D","text":"14"}]'::jsonb, 'C', 'Subtract 2x from both sides: x - 7 = 5. Add 7 to both sides: x = 12.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry', 'A rectangle has a length of 15 cm and a width of 8 cm. What is the length of its diagonal?', '[{"key":"A","text":"17 cm"},{"key":"B","text":"19 cm"},{"key":"C","text":"21 cm"},{"key":"D","text":"23 cm"}]'::jsonb, 'A', 'By the Pythagorean theorem, diagonal = sqrt(15^2 + 8^2) = sqrt(225 + 64) = sqrt(289) = 17 cm.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem', 'A store marks up an item by 25% and later offers a 20% discount on the marked-up price. If the original cost of the item was 400 pesos, what is the final selling price?', '[{"key":"A","text":"380 pesos"},{"key":"B","text":"390 pesos"},{"key":"C","text":"400 pesos"},{"key":"D","text":"420 pesos"}]'::jsonb, 'C', 'Marked-up price = 400 * 1.25 = 500. After a 20% discount: 500 * 0.80 = 400 pesos. The markup and discount exactly cancel out.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Quantitative Reasoning', 'A car travels 240 km in 3 hours at a constant speed. How long will it take to travel 400 km at the same speed?', '[{"key":"A","text":"4 hours"},{"key":"B","text":"5 hours"},{"key":"C","text":"6 hours"},{"key":"D","text":"7 hours"}]'::jsonb, 'B', 'Speed = 240 km / 3 h = 80 km/h. Time for 400 km = 400 / 80 = 5 hours.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra', 'Simplify: (2x^2y)(3xy^3)', '[{"key":"A","text":"5x^3y^4"},{"key":"B","text":"6x^2y^3"},{"key":"C","text":"6x^3y^4"},{"key":"D","text":"6x^3y^3"}]'::jsonb, 'C', 'Multiply coefficients: 2 * 3 = 6. Add exponents of like bases: x^2 * x = x^3, y * y^3 = y^4. Result: 6x^3y^4.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry', 'What is the area of a circle with a radius of 7 cm? (Use pi = 22/7)', '[{"key":"A","text":"144 cm^2"},{"key":"B","text":"154 cm^2"},{"key":"C","text":"164 cm^2"},{"key":"D","text":"174 cm^2"}]'::jsonb, 'B', 'Area = pi * r^2 = (22/7) * 49 = 22 * 7 = 154 cm^2.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Trigonometry', 'In a right triangle, one acute angle measures 30 degrees and the hypotenuse is 10 units. What is the length of the side opposite the 30-degree angle?', '[{"key":"A","text":"3 units"},{"key":"B","text":"5 units"},{"key":"C","text":"5*sqrt(2) units"},{"key":"D","text":"5*sqrt(3) units"}]'::jsonb, 'B', 'sin(30) = opposite / hypotenuse = 0.5. Opposite = 0.5 * 10 = 5 units.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem', 'Working alone, Ana can paint a fence in 6 hours, and Ben can paint the same fence in 3 hours. If they work together, how many hours will it take them to paint the fence?', '[{"key":"A","text":"1 hour"},{"key":"B","text":"2 hours"},{"key":"C","text":"2.5 hours"},{"key":"D","text":"4.5 hours"}]'::jsonb, 'B', 'Ana''s rate = 1/6 fence/hr, Ben''s rate = 1/3 fence/hr. Combined rate = 1/6 + 1/3 = 1/6 + 2/6 = 3/6 = 1/2 fence/hr. Time = 1 / (1/2) = 2 hours.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

-- =========================================================
-- SCIENCE
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology', 'Which organelle is primarily responsible for producing ATP through cellular respiration?', '[{"key":"A","text":"Ribosome"},{"key":"B","text":"Golgi apparatus"},{"key":"C","text":"Mitochondrion"},{"key":"D","text":"Lysosome"}]'::jsonb, 'C', 'The mitochondrion is known as the "powerhouse of the cell" because it generates most of the cell''s ATP through aerobic respiration.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry', 'What is the pH of a neutral solution at 25 degrees Celsius?', '[{"key":"A","text":"0"},{"key":"B","text":"7"},{"key":"C","text":"10"},{"key":"D","text":"14"}]'::jsonb, 'B', 'A neutral solution has equal concentrations of H+ and OH- ions, corresponding to a pH of 7 at 25 degrees Celsius. Below 7 is acidic, above 7 is basic.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics', 'A ball is dropped from rest and falls freely under gravity. Ignoring air resistance, what is its approximate speed after falling for 2 seconds? (g = 10 m/s^2)', '[{"key":"A","text":"5 m/s"},{"key":"B","text":"10 m/s"},{"key":"C","text":"20 m/s"},{"key":"D","text":"40 m/s"}]'::jsonb, 'C', 'For free fall from rest, v = g*t = 10 * 2 = 20 m/s.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology', 'During which process do plants convert light energy into chemical energy stored in glucose?', '[{"key":"A","text":"Respiration"},{"key":"B","text":"Photosynthesis"},{"key":"C","text":"Fermentation"},{"key":"D","text":"Transpiration"}]'::jsonb, 'B', 'Photosynthesis is the process by which plants use chlorophyll to convert light energy, water, and carbon dioxide into glucose and oxygen.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry', 'Which type of bond is formed when electrons are shared between two nonmetal atoms?', '[{"key":"A","text":"Ionic bond"},{"key":"B","text":"Covalent bond"},{"key":"C","text":"Metallic bond"},{"key":"D","text":"Hydrogen bond"}]'::jsonb, 'B', 'A covalent bond forms when two atoms, typically nonmetals, share electron pairs. Ionic bonds involve electron transfer, usually between metals and nonmetals.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics', 'A net force of 20 N is applied to an object with a mass of 4 kg. What is the object''s acceleration?', '[{"key":"A","text":"2 m/s^2"},{"key":"B","text":"4 m/s^2"},{"key":"C","text":"5 m/s^2"},{"key":"D","text":"8 m/s^2"}]'::jsonb, 'C', 'By Newton''s second law, F = ma, so a = F/m = 20 N / 4 kg = 5 m/s^2.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science', 'Which layer of the Earth is primarily composed of molten and semi-molten rock that flows slowly due to convection currents?', '[{"key":"A","text":"Crust"},{"key":"B","text":"Mantle"},{"key":"C","text":"Outer core"},{"key":"D","text":"Inner core"}]'::jsonb, 'B', 'The mantle lies beneath the crust and consists of semi-molten rock (magma) whose slow convective flow drives plate tectonics.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology', 'In genetics, if a heterozygous pea plant with genotype Tt (Tall, dominant) is crossed with another Tt plant, what fraction of the offspring is expected to be short (tt)?', '[{"key":"A","text":"1/4"},{"key":"B","text":"1/2"},{"key":"C","text":"3/4"},{"key":"D","text":"1"}]'::jsonb, 'A', 'A Tt x Tt cross produces a 1:2:1 ratio of TT:Tt:tt genotypes, so 1/4 of offspring are expected to be tt (short), following Mendelian inheritance.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

-- =========================================================
-- ESSAY WRITING
-- Timed essay prompts. Not auto-graded — choices are a single placeholder
-- option, correct_answer is always 'A', and the explanation field is used
-- to hold guidance on what a strong response should cover.
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Persuasive Essay', 'Some people believe that success is mostly determined by hard work, while others believe it is mostly determined by circumstances beyond a person''s control, such as family background or luck. Write an essay stating your position and supporting it with clear reasoning and specific examples.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response takes a clear, defensible position early on, avoids simply listing both sides without a stance, and supports the argument with at least two specific, well-explained examples (personal, historical, or hypothetical). It should acknowledge the counterargument briefly before reinforcing its own position, use varied sentence structure, and end with a conclusion that ties back to the thesis rather than merely restating it.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Reflective Essay', 'Describe a challenge you have faced that changed the way you think about yourself or the world. Explain what happened and what you learned from the experience.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response opens with a concrete, specific moment rather than a vague generalization, shows genuine reflection (not just a recounting of events), and clearly connects the experience to a specific insight or change in perspective. It should have a logical structure (situation, response, lesson) and end with a forward-looking statement that shows maturity and self-awareness.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Argumentative Essay', 'Many schools are debating whether social media use should be restricted for students during school hours. Argue for or against this policy, addressing at least one likely objection to your position.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response states a clear position in the introduction, organizes supporting points logically (e.g., academic focus, mental health, or personal freedom), and explicitly names and responds to a counterargument rather than ignoring it. Language should be precise and formal, avoiding absolute claims ("always," "never") unless well-justified, and the conclusion should synthesize the argument rather than merely repeat it.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analytical Essay', 'Technology has changed the way people communicate with one another. In your view, has this change made human relationships stronger or weaker? Support your answer with reasoning and examples.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response avoids a purely one-sided rant and instead builds a reasoned argument with specific examples (e.g., messaging apps, video calls, social media dynamics), addressing both the benefits and drawbacks before landing on a clear overall judgment. Organization should move logically from claim to evidence to analysis, and the essay should demonstrate command of transitions and varied vocabulary appropriate for a college-entrance context.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';
