-- USTET (University of Santo Tomas Entrance Test) practice questions.
-- Sourced from publicly available descriptions of USTET format/coverage as of the most
-- recently known iteration (subtests: Language Proficiency, Mathematics, Science, Reading
-- Comprehension/Mental Ability). Public reviewer material was used only to identify topics
-- and difficulty level -- all prompts below are original, AI-drafted, and need human review
-- before being treated as authoritative.

-- ============================================================
-- LANGUAGE PROFICIENCY (grammar, vocabulary, sentence construction, spelling)
-- ============================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Subject-Verb Agreement', 'Choose the sentence that is grammatically correct.', '[{"key":"A","text":"Neither of the applicants have submitted their requirements."},{"key":"B","text":"Neither of the applicants has submitted his or her requirements."},{"key":"C","text":"Neither of the applicant have submit their requirement."},{"key":"D","text":"Neither of the applicants submitting their requirements."}]'::jsonb, 'B', '"Neither" is singular, so it takes the singular verb "has" and a singular pronoun reference.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'The professor''s remarks were so ______ that even students unfamiliar with the topic understood the lecture.', '[{"key":"A","text":"convoluted"},{"key":"B","text":"lucid"},{"key":"C","text":"esoteric"},{"key":"D","text":"ambiguous"}]'::jsonb, 'B', '"Lucid" means clear and easy to understand, which fits the context of students easily following the lecture.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Spelling', 'Identify the correctly spelled word.', '[{"key":"A","text":"Occassion"},{"key":"B","text":"Ocurrence"},{"key":"C","text":"Embarrassment"},{"key":"D","text":"Comittee"}]'::jsonb, 'C', '"Embarrassment" is spelled with double r and double s. The other options each have missing or extra letters.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sentence Construction', 'Choose the option that best combines the two sentences: "The rain was heavy. The game continued as scheduled."', '[{"key":"A","text":"Although the rain was heavy, the game continued as scheduled."},{"key":"B","text":"The rain was heavy, so the game continued as scheduled."},{"key":"C","text":"The rain was heavy for the game to continue as scheduled."},{"key":"D","text":"Because the game continued as scheduled, the rain was heavy."}]'::jsonb, 'A', '"Although" correctly signals the contrast between heavy rain and the game continuing despite it.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'BOOK is to LIBRARY as PAINTING is to ______.', '[{"key":"A","text":"Museum"},{"key":"B","text":"Artist"},{"key":"C","text":"Canvas"},{"key":"D","text":"Frame"}]'::jsonb, 'A', 'A library is a place where books are collected and kept; a museum is the analogous place for paintings.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Idioms and Expressions', 'What does the idiom "to bite the bullet" mean?', '[{"key":"A","text":"To avoid a difficult situation"},{"key":"B","text":"To face a painful situation with courage"},{"key":"C","text":"To speak harshly to someone"},{"key":"D","text":"To eat something unpleasant"}]'::jsonb, 'B', '"Bite the bullet" means to endure a difficult or unpleasant situation because it is unavoidable.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino Grammar (Pang-uri/Pang-abay)', 'Piliin ang tamang pang-abay na pamaraan sa pangungusap: "Mabilis ___ tumakbo si Juan patungo sa paaralan."', '[{"key":"A","text":"na"},{"key":"B","text":"nang"},{"key":"C","text":"ng"},{"key":"D","text":"ni"}]'::jsonb, 'B', '"Nang" ang ginagamit bilang pang-abay na naglalarawan kung paano isinagawa ang kilos (tumakbo nang mabilis).', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Error Identification', 'Which underlined part contains an error? "Each of the students (A) are required (B) to submit (C) their project (D) by Friday."', '[{"key":"A","text":"(A) Each of the students"},{"key":"B","text":"(B) are required"},{"key":"C","text":"(C) to submit"},{"key":"D","text":"(D) by Friday"}]'::jsonb, 'B', '"Each" is singular, so the verb should be "is required," not "are required."', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

-- ============================================================
-- MATHEMATICS (arithmetic, algebra, geometry, basic statistics/trigonometry)
-- ============================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Linear Equations', 'Solve for x: 3x - 7 = 2x + 5', '[{"key":"A","text":"x = 5"},{"key":"B","text":"x = 12"},{"key":"C","text":"x = -12"},{"key":"D","text":"x = 2"}]'::jsonb, 'B', 'Subtract 2x from both sides: x - 7 = 5. Add 7 to both sides: x = 12.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problems', 'A jeepney travels 90 km in 1.5 hours. What is its average speed in km/h?', '[{"key":"A","text":"45 km/h"},{"key":"B","text":"60 km/h"},{"key":"C","text":"75 km/h"},{"key":"D","text":"135 km/h"}]'::jsonb, 'B', 'Speed = distance / time = 90 km / 1.5 h = 60 km/h.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Area and Perimeter', 'A rectangular garden has a length of 12 m and a width of 7 m. What is its area?', '[{"key":"A","text":"19 m^2"},{"key":"B","text":"38 m^2"},{"key":"C","text":"84 m^2"},{"key":"D","text":"168 m^2"}]'::jsonb, 'C', 'Area of a rectangle = length x width = 12 x 7 = 84 m^2.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Factorization', 'Factor completely: x^2 - 5x + 6', '[{"key":"A","text":"(x - 2)(x - 3)"},{"key":"B","text":"(x + 2)(x + 3)"},{"key":"C","text":"(x - 1)(x - 6)"},{"key":"D","text":"(x + 1)(x - 6)"}]'::jsonb, 'A', 'We need two numbers that multiply to 6 and add to -5: -2 and -3. So x^2 - 5x + 6 = (x - 2)(x - 3).', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Statistics - Mean and Median', 'Find the median of the data set: 4, 8, 6, 2, 10, 12, 8', '[{"key":"A","text":"6"},{"key":"B","text":"7"},{"key":"C","text":"8"},{"key":"D","text":"10"}]'::jsonb, 'C', 'Sorted: 2, 4, 6, 8, 8, 10, 12. The middle (4th) value of 7 numbers is 8.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Percentages', 'A shirt originally priced at PHP 800 is on sale for 25% off. What is the sale price?', '[{"key":"A","text":"PHP 600"},{"key":"B","text":"PHP 650"},{"key":"C","text":"PHP 700"},{"key":"D","text":"PHP 750"}]'::jsonb, 'A', '25% of 800 is 200. Subtracting the discount: 800 - 200 = 600.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Basic Trigonometry', 'In a right triangle, if the angle theta has opposite side 3 and hypotenuse 5, what is sin(theta)?', '[{"key":"A","text":"3/4"},{"key":"B","text":"4/5"},{"key":"C","text":"3/5"},{"key":"D","text":"5/3"}]'::jsonb, 'C', 'sin(theta) = opposite / hypotenuse = 3/5.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Theory', 'What is the greatest common factor (GCF) of 48 and 72?', '[{"key":"A","text":"12"},{"key":"B","text":"16"},{"key":"C","text":"24"},{"key":"D","text":"36"}]'::jsonb, 'C', '48 = 2^4 x 3, 72 = 2^3 x 3^2. The GCF takes the lowest powers of shared primes: 2^3 x 3 = 24.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

-- ============================================================
-- SCIENCE (biology, chemistry, physics, earth science/astronomy)
-- ============================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Cell Structure', 'Which organelle is primarily responsible for producing the cell''s energy (ATP)?', '[{"key":"A","text":"Nucleus"},{"key":"B","text":"Mitochondrion"},{"key":"C","text":"Ribosome"},{"key":"D","text":"Golgi apparatus"}]'::jsonb, 'B', 'The mitochondrion is known as the "powerhouse of the cell" because it generates most of the cell''s ATP through cellular respiration.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Periodic Table', 'Which of the following elements is a noble gas?', '[{"key":"A","text":"Chlorine"},{"key":"B","text":"Neon"},{"key":"C","text":"Sodium"},{"key":"D","text":"Sulfur"}]'::jsonb, 'B', 'Neon belongs to Group 18 (the noble gases), which are largely inert due to having a full outer electron shell.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Newton''s Laws', 'A 10 kg object experiences a net force of 20 N. What is its acceleration?', '[{"key":"A","text":"0.5 m/s^2"},{"key":"B","text":"2 m/s^2"},{"key":"C","text":"10 m/s^2"},{"key":"D","text":"200 m/s^2"}]'::jsonb, 'B', 'Using Newton''s second law, a = F / m = 20 N / 10 kg = 2 m/s^2.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Rock Cycle', 'Which type of rock is formed from the cooling and solidification of magma or lava?', '[{"key":"A","text":"Sedimentary"},{"key":"B","text":"Metamorphic"},{"key":"C","text":"Igneous"},{"key":"D","text":"Organic"}]'::jsonb, 'C', 'Igneous rocks form when molten rock (magma or lava) cools and solidifies.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Astronomy - Solar System', 'Which planet is known as the "Red Planet" due to iron oxide on its surface?', '[{"key":"A","text":"Venus"},{"key":"B","text":"Mars"},{"key":"C","text":"Jupiter"},{"key":"D","text":"Mercury"}]'::jsonb, 'B', 'Mars appears reddish because its surface is rich in iron oxide (rust).', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Chemical Reactions', 'In the reaction 2H2 + O2 -> 2H2O, what type of reaction is this?', '[{"key":"A","text":"Decomposition"},{"key":"B","text":"Synthesis (combination)"},{"key":"C","text":"Single replacement"},{"key":"D","text":"Double replacement"}]'::jsonb, 'B', 'Two or more simpler substances (H2 and O2) combine to form a single, more complex product (H2O), which is a synthesis reaction.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Human Body Systems', 'Which organ is primarily responsible for filtering waste products from the blood to form urine?', '[{"key":"A","text":"Liver"},{"key":"B","text":"Kidney"},{"key":"C","text":"Pancreas"},{"key":"D","text":"Spleen"}]'::jsonb, 'B', 'The kidneys filter blood to remove waste and excess substances, producing urine.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Energy', 'A ball held above the ground has stored energy due to its position. What type of energy is this?', '[{"key":"A","text":"Kinetic energy"},{"key":"B","text":"Thermal energy"},{"key":"C","text":"Potential energy"},{"key":"D","text":"Chemical energy"}]'::jsonb, 'C', 'Energy stored due to an object''s position (such as height above the ground) is gravitational potential energy.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

-- ============================================================
-- READING COMPREHENSION (passage-based inference and detail questions)
-- ============================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Main Idea', 'Passage: "Urban gardening has grown in popularity as city dwellers seek ways to grow their own food despite limited space. Balconies, rooftops, and small yards are being converted into productive plots that yield vegetables and herbs. Beyond food production, these gardens also improve air quality and give residents a sense of community." What is the main idea of the passage?', '[{"key":"A","text":"City dwellers no longer buy vegetables from markets."},{"key":"B","text":"Urban gardening offers practical and social benefits despite space constraints."},{"key":"C","text":"Rooftops are the only place where urban gardens can grow."},{"key":"D","text":"Air quality is the primary reason people garden in cities."}]'::jsonb, 'B', 'The passage discusses several benefits of urban gardening -- food production, air quality, and community -- despite limited space, making B the most complete main idea.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'Passage: "Despite the coach''s repeated warnings, several players arrived late to practice. By the third offense, the coach benched the players for the upcoming match." What can be inferred about the coach?', '[{"key":"A","text":"The coach enforces discipline and consequences for repeated behavior."},{"key":"B","text":"The coach dislikes the players personally."},{"key":"C","text":"The coach has no authority over the team."},{"key":"D","text":"The coach was unaware of the lateness."}]'::jsonb, 'A', 'The coach''s action of benching players after repeated warnings shows a pattern of enforcing discipline and consequences.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Tone', 'Passage: "It is almost comical how the city council debated for three hours over the color of a park bench while ignoring the crumbling bridge just outside." What is the author''s tone?', '[{"key":"A","text":"Sympathetic"},{"key":"B","text":"Sarcastic/critical"},{"key":"C","text":"Neutral and objective"},{"key":"D","text":"Enthusiastic"},{"key":"E","text":"Fearful"}]'::jsonb, 'B', 'The word "comical" combined with the contrast between a trivial debate and a serious issue signals a sarcastic, critical tone.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Detail/Fact Recall', 'Passage: "The Philippine eagle, one of the largest and most powerful eagles in the world, is critically endangered due to habitat loss and hunting. Conservation groups have established breeding programs to help restore its population." According to the passage, why is the Philippine eagle endangered?', '[{"key":"A","text":"Climate change and pollution"},{"key":"B","text":"Habitat loss and hunting"},{"key":"C","text":"Disease and overpopulation"},{"key":"D","text":"Lack of breeding programs"}]'::jsonb, 'B', 'The passage explicitly states that habitat loss and hunting are the causes of the eagle''s endangered status.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'Passage: "The negotiations reached an impasse, with neither side willing to compromise on the terms." What does "impasse" most likely mean in this context?', '[{"key":"A","text":"A quick resolution"},{"key":"B","text":"A deadlock or standstill"},{"key":"C","text":"A friendly agreement"},{"key":"D","text":"A public announcement"}]'::jsonb, 'B', 'An "impasse" refers to a situation where no progress can be made, i.e., a deadlock, consistent with neither side compromising.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sequence of Events', 'Passage: "First, the researchers collected water samples from the river. Next, they tested the samples for contaminants in the lab. Finally, they published a report recommending stricter regulations." What did the researchers do immediately after collecting the samples?', '[{"key":"A","text":"Published a report"},{"key":"B","text":"Recommended regulations"},{"key":"C","text":"Tested the samples in the lab"},{"key":"D","text":"Returned to the river"}]'::jsonb, 'C', 'The passage lists the steps in order: collect samples, then test them in the lab, then publish the report.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Purpose', 'Passage: "This guide walks you through each step of setting up your new smartphone, from inserting the SIM card to configuring your first backup." What is the primary purpose of this passage?', '[{"key":"A","text":"To persuade the reader to buy a smartphone"},{"key":"B","text":"To instruct the reader on how to set up a smartphone"},{"key":"C","text":"To entertain the reader with a story about smartphones"},{"key":"D","text":"To compare different smartphone brands"}]'::jsonb, 'B', 'The passage is structured as a step-by-step guide, indicating its purpose is instructional.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Cause and Effect', 'Passage: "Because the typhoon knocked out power lines across the province, most households were left without electricity for nearly a week, forcing many businesses to close temporarily." What was the effect of the typhoon knocking out power lines?', '[{"key":"A","text":"Businesses expanded their operations."},{"key":"B","text":"Households lost electricity and businesses closed temporarily."},{"key":"C","text":"The province experienced a heat wave."},{"key":"D","text":"Power lines were immediately repaired."}]'::jsonb, 'B', 'The passage directly states that the loss of power lines caused households to lose electricity and businesses to close temporarily.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';
