-- USTET (University of Santo Tomas Entrance Test) practice questions -- expansion set.
-- Original, AI-drafted questions inspired by publicly documented USTET format/coverage and
-- by patterns observed in past USTET proficiency tests (2014/2015 released materials). No
-- content is copied verbatim from any past exam; all prompts, choices, and explanations below
-- are newly written and need human review before being treated as authoritative. This file
-- adds to supabase/seed/0002_questions_ust.sql without duplicating any of its questions.

-- ============================================================
-- LANGUAGE PROFICIENCY (grammar, vocabulary, spelling/homophone traps, sentence construction)
-- ============================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Homophones', 'Choose the word that correctly completes the sentence: "Please make sure to ______ the documents before the deadline."', '[{"key":"A","text":"cite"},{"key":"B","text":"site"},{"key":"C","text":"sight"},{"key":"D","text":"sit"}]'::jsonb, 'A', '"Cite" means to reference or submit as evidence/reference in this context (to cite/submit documents). "Site" is a location, "sight" refers to vision, and "sit" is unrelated.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Homophones', 'Which sentence uses the underlined homophone correctly? "___ going to the museum to see the new exhibit."', '[{"key":"A","text":"Their"},{"key":"B","text":"There"},{"key":"C","text":"They''re"},{"key":"D","text":"Ther"}]'::jsonb, 'C', '"They''re" is the contraction of "they are," which fits the sentence. "Their" shows possession and "there" indicates place.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Spelling - Commonly Confused Words', 'Identify the correctly spelled word for regular upkeep of equipment.', '[{"key":"A","text":"Maintainance"},{"key":"B","text":"Maintenance"},{"key":"C","text":"Maintanance"},{"key":"D","text":"Maintinance"}]'::jsonb, 'B', 'The correct spelling is "maintenance," with the "e" before "nance." The other options misplace the vowels.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Homophones', 'Choose the correct word: "The weather will ______ how the outdoor event proceeds."', '[{"key":"A","text":"affect"},{"key":"B","text":"effect"},{"key":"C","text":"affected"},{"key":"D","text":"effecting"}]'::jsonb, 'A', '"Affect" is typically used as a verb meaning to influence. "Effect" is typically the noun form (result), so it does not fit the verb slot here.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Homophones', 'Which sentence is correct?', '[{"key":"A","text":"Your going to love this restaurant."},{"key":"B","text":"You''re going to love this restaurant."},{"key":"C","text":"Yore going to love this restaurant."},{"key":"D","text":"Ur going to love this restaurant."}]'::jsonb, 'B', '"You''re" is the contraction for "you are," which correctly completes the sentence. "Your" indicates possession.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Spelling', 'Identify the correctly spelled word.', '[{"key":"A","text":"Neccessary"},{"key":"B","text":"Necessary"},{"key":"C","text":"Neccesary"},{"key":"D","text":"Necesary"}]'::jsonb, 'B', '"Necessary" has one "c" and two "s"s. The other choices either double the wrong letter or omit an "s."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Homophones', 'Choose the correct word: "The tour guide will ______ the group through the historic district."', '[{"key":"A","text":"lead"},{"key":"B","text":"led"},{"key":"C","text":"lede"},{"key":"D","text":"leed"}]'::jsonb, 'A', 'The present-tense verb "lead" (pronounced "leed") fits the future-tense construction "will lead." "Led" is the past tense.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Homophones', 'Which word correctly completes the sentence? "The scientist wanted to ______ her theory with concrete evidence."', '[{"key":"A","text":"prove"},{"key":"B","text":"proove"},{"key":"C","text":"proov"},{"key":"D","text":"prooph"}]'::jsonb, 'A', '"Prove" is the correctly spelled verb meaning to demonstrate the truth of something.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'The manager''s ______ approach to feedback made employees hesitant to admit mistakes.', '[{"key":"A","text":"lenient"},{"key":"B","text":"punitive"},{"key":"C","text":"encouraging"},{"key":"D","text":"indifferent"}]'::jsonb, 'B', '"Punitive" means intended to punish, which explains why employees would be hesitant to admit mistakes.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'Despite the criticism, the artist remained ______ in her unique style.', '[{"key":"A","text":"wavering"},{"key":"B","text":"steadfast"},{"key":"C","text":"apologetic"},{"key":"D","text":"indecisive"}]'::jsonb, 'B', '"Steadfast" means firm and unwavering, which matches "despite the criticism" and "remained."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Subject-Verb Agreement', 'Choose the grammatically correct sentence.', '[{"key":"A","text":"The list of items are on the table."},{"key":"B","text":"The list of items is on the table."},{"key":"C","text":"The list of items were on the table."},{"key":"D","text":"The list of items being on the table."}]'::jsonb, 'B', 'The subject is "list" (singular), not "items," so the singular verb "is" is correct.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Pronoun-Antecedent Agreement', 'Choose the correct sentence.', '[{"key":"A","text":"Every student must bring their own calculator."},{"key":"B","text":"Every student must bring his or her own calculator."},{"key":"C","text":"Every students must bring their own calculator."},{"key":"D","text":"Every student must brings their own calculator."}]'::jsonb, 'B', '"Every student" is singular, so the traditional formal agreement uses the singular pronoun phrase "his or her."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Verb Tense', 'Choose the sentence with the correct verb tense.', '[{"key":"A","text":"By the time we arrived, the movie had already started."},{"key":"B","text":"By the time we arrived, the movie has already started."},{"key":"C","text":"By the time we arrived, the movie already starts."},{"key":"D","text":"By the time we arrived, the movie will already start."}]'::jsonb, 'A', 'The past perfect "had started" correctly shows an action completed before another past action ("arrived").', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Prepositions', 'Choose the correct preposition: "The committee is responsible ______ reviewing all applications."', '[{"key":"A","text":"of"},{"key":"B","text":"for"},{"key":"C","text":"with"},{"key":"D","text":"at"}]'::jsonb, 'B', 'The idiomatic phrase is "responsible for," meaning accountable for a task or duty.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sentence Construction', 'Choose the option that best combines the two sentences: "She studied hard. She still failed the exam."', '[{"key":"A","text":"She studied hard, so she failed the exam."},{"key":"B","text":"She studied hard, yet she still failed the exam."},{"key":"C","text":"She studied hard because she failed the exam."},{"key":"D","text":"She studied hard when she failed the exam."}]'::jsonb, 'B', '"Yet" correctly signals the unexpected contrast between studying hard and still failing.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Parallelism', 'Choose the sentence with correct parallel structure.', '[{"key":"A","text":"She enjoys reading, swimming, and to bike."},{"key":"B","text":"She enjoys reading, swimming, and biking."},{"key":"C","text":"She enjoys to read, swimming, and biking."},{"key":"D","text":"She enjoys reads, swims, and bikes."}]'::jsonb, 'B', 'All three items in the list should use the same grammatical form (gerunds): reading, swimming, biking.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'DOCTOR is to HOSPITAL as TEACHER is to ______.', '[{"key":"A","text":"Student"},{"key":"B","text":"School"},{"key":"C","text":"Lesson"},{"key":"D","text":"Chalkboard"}]'::jsonb, 'B', 'A doctor works in a hospital; analogously, a teacher works in a school.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'PUPPY is to DOG as CATERPILLAR is to ______.', '[{"key":"A","text":"Cocoon"},{"key":"B","text":"Insect"},{"key":"C","text":"Butterfly"},{"key":"D","text":"Larva"}]'::jsonb, 'C', 'A puppy grows into a dog; a caterpillar develops into a butterfly. This is a stage-of-development analogy.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Idioms and Expressions', 'What does the idiom "to burn the midnight oil" mean?', '[{"key":"A","text":"To waste resources carelessly"},{"key":"B","text":"To work or study late into the night"},{"key":"C","text":"To start a fire accidentally"},{"key":"D","text":"To give up on a task"}]'::jsonb, 'B', '"Burn the midnight oil" means to stay up late working or studying, harking back to using oil lamps at night.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Idioms and Expressions', 'What does it mean to "spill the beans"?', '[{"key":"A","text":"To make a mess"},{"key":"B","text":"To reveal a secret"},{"key":"C","text":"To cook a meal"},{"key":"D","text":"To lose one''s temper"}]'::jsonb, 'B', '"Spill the beans" is an idiom meaning to accidentally or deliberately reveal secret information.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino Grammar (Pang-uri)', 'Piliin ang tamang pang-uri sa pangungusap: "Bumili si Maria ng ___ damit para sa kanyang lola."', '[{"key":"A","text":"maganda"},{"key":"B","text":"magaganda"},{"key":"C","text":"pagganda"},{"key":"D","text":"gumaganda"}]'::jsonb, 'A', '"Maganda" ang wastong anyo ng pang-uri para sa isahang pangngalang "damit."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Error Identification', 'Which underlined part contains an error? "The committee (A) have decided (B) to postpone (C) the meeting (D) until next week."', '[{"key":"A","text":"(A) The committee"},{"key":"B","text":"(B) have decided"},{"key":"C","text":"(C) to postpone"},{"key":"D","text":"(D) until next week"}]'::jsonb, 'B', '"Committee" is treated as a singular collective noun here, so it should take "has decided," not "have decided."', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Homophones', 'Choose the correct word: "It is important to ______ your belongings while traveling."', '[{"key":"A","text":"secure"},{"key":"B","text":"seizure"},{"key":"C","text":"secured"},{"key":"D","text":"securing"}]'::jsonb, 'A', '"Secure" is the correct present-tense verb form fitting "to ______ your belongings." "Seizure" is an unrelated noun referring to a medical event or a forceful taking.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'The new policy was met with ______ from employees who feared losing benefits.', '[{"key":"A","text":"enthusiasm"},{"key":"B","text":"resistance"},{"key":"C","text":"indifference"},{"key":"D","text":"gratitude"}]'::jsonb, 'B', '"Resistance" fits because employees who feared losing benefits would oppose the new policy.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Spelling', 'Identify the correctly spelled word.', '[{"key":"A","text":"Definately"},{"key":"B","text":"Definitely"},{"key":"C","text":"Definitly"},{"key":"D","text":"Deffinitely"}]'::jsonb, 'B', '"Definitely" is spelled with "finite" embedded in it -- def-INITE-ly. The other options misspell the middle portion.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sentence Construction', 'Choose the most concise and correct version of the sentence.', '[{"key":"A","text":"Due to the fact that it was raining, we cancelled the trip."},{"key":"B","text":"Because it was raining, we cancelled the trip."},{"key":"C","text":"Because of the fact it rained, we cancelled the trip."},{"key":"D","text":"On account of the rain happening, we cancelled the trip."}]'::jsonb, 'B', '"Because it was raining" is concise and grammatically correct, avoiding the wordy "due to the fact that."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'language-proficiency';

-- ============================================================
-- MATHEMATICS (arithmetic, algebra, geometry, statistics, trigonometry, word problems)
-- ============================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Arithmetic - Order of Operations', 'Evaluate: 8 + 4 x (6 - 2) / 2', '[{"key":"A","text":"12"},{"key":"B","text":"16"},{"key":"C","text":"20"},{"key":"D","text":"24"}]'::jsonb, 'B', 'Following PEMDAS: (6-2)=4, then 4x4=16, then 16/2=8, then 8+8=16.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Linear Equations', 'Solve for y: 4y + 9 = 2y + 21', '[{"key":"A","text":"y = 3"},{"key":"B","text":"y = 6"},{"key":"C","text":"y = 12"},{"key":"D","text":"y = -6"}]'::jsonb, 'B', 'Subtract 2y from both sides: 2y + 9 = 21. Subtract 9: 2y = 12. Divide by 2: y = 6.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problems - Ratio', 'A recipe requires flour and sugar in a ratio of 3:2. If 12 cups of flour are used, how many cups of sugar are needed?', '[{"key":"A","text":"6 cups"},{"key":"B","text":"8 cups"},{"key":"C","text":"9 cups"},{"key":"D","text":"18 cups"}]'::jsonb, 'B', 'The ratio 3:2 means flour/sugar = 3/2. 12/x = 3/2, so 3x = 24, x = 8 cups.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Circles', 'What is the circumference of a circle with a radius of 7 cm? (Use pi = 22/7)', '[{"key":"A","text":"22 cm"},{"key":"B","text":"44 cm"},{"key":"C","text":"88 cm"},{"key":"D","text":"154 cm"}]'::jsonb, 'B', 'Circumference = 2 x pi x r = 2 x (22/7) x 7 = 44 cm.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Triangles', 'A triangle has angles measuring 50 degrees and 65 degrees. What is the measure of the third angle?', '[{"key":"A","text":"55 degrees"},{"key":"B","text":"60 degrees"},{"key":"C","text":"65 degrees"},{"key":"D","text":"75 degrees"}]'::jsonb, 'C', 'The angles of a triangle sum to 180 degrees. 180 - 50 - 65 = 65 degrees.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Percentages', 'A student scored 45 out of 60 on a quiz. What percentage did the student score?', '[{"key":"A","text":"65%"},{"key":"B","text":"70%"},{"key":"C","text":"75%"},{"key":"D","text":"80%"}]'::jsonb, 'C', '45/60 = 0.75 = 75%.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problems - Age', 'Ana is twice as old as her brother. In 5 years, she will be 25 years old. How old is her brother now?', '[{"key":"A","text":"8 years old"},{"key":"B","text":"10 years old"},{"key":"C","text":"12 years old"},{"key":"D","text":"15 years old"}]'::jsonb, 'B', 'If Ana will be 25 in 5 years, she is 20 now. Since she is twice her brother''s age, her brother is 10.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Exponents', 'Simplify: (2x^3)(3x^2)', '[{"key":"A","text":"5x^5"},{"key":"B","text":"6x^5"},{"key":"C","text":"6x^6"},{"key":"D","text":"5x^6"}]'::jsonb, 'B', 'Multiply coefficients: 2x3=6. Add exponents of like base: x^3 * x^2 = x^5. Result: 6x^5.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Statistics - Mode', 'Find the mode of the data set: 3, 7, 7, 9, 12, 7, 15', '[{"key":"A","text":"7"},{"key":"B","text":"9"},{"key":"C","text":"12"},{"key":"D","text":"There is no mode"}]'::jsonb, 'A', 'The number 7 appears three times, more than any other value, so it is the mode.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Basic Trigonometry', 'In a right triangle, the adjacent side to angle theta is 8 and the hypotenuse is 10. What is cos(theta)?', '[{"key":"A","text":"3/5"},{"key":"B","text":"4/5"},{"key":"C","text":"5/4"},{"key":"D","text":"8/6"}]'::jsonb, 'B', 'cos(theta) = adjacent / hypotenuse = 8/10 = 4/5.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Theory', 'What is the least common multiple (LCM) of 8 and 12?', '[{"key":"A","text":"16"},{"key":"B","text":"24"},{"key":"C","text":"32"},{"key":"D","text":"48"}]'::jsonb, 'B', '8 = 2^3, 12 = 2^2 x 3. The LCM takes the highest powers: 2^3 x 3 = 24.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problems - Work Rate', 'Worker A can finish a task in 6 hours, and Worker B can finish the same task in 3 hours. If they work together, how many hours will it take to finish the task?', '[{"key":"A","text":"1 hour"},{"key":"B","text":"1.5 hours"},{"key":"C","text":"2 hours"},{"key":"D","text":"4.5 hours"}]'::jsonb, 'C', 'Combined rate = 1/6 + 1/3 = 1/6 + 2/6 = 3/6 = 1/2 task per hour. Time = 1 / (1/2) = 2 hours.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Volume', 'What is the volume of a rectangular box with length 5 m, width 4 m, and height 3 m?', '[{"key":"A","text":"12 m^3"},{"key":"B","text":"20 m^3"},{"key":"C","text":"60 m^3"},{"key":"D","text":"120 m^3"}]'::jsonb, 'C', 'Volume = length x width x height = 5 x 4 x 3 = 60 m^3.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Quadratic Equations', 'Solve for x: x^2 - 9 = 0', '[{"key":"A","text":"x = 3 only"},{"key":"B","text":"x = -3 only"},{"key":"C","text":"x = 3 or x = -3"},{"key":"D","text":"x = 9 or x = -9"}]'::jsonb, 'C', 'x^2 = 9, so x = plus or minus the square root of 9, giving x = 3 or x = -3.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problems - Mixture', 'A store mixes 2 kg of coffee worth PHP 300/kg with 3 kg of coffee worth PHP 200/kg. What is the price per kg of the mixture?', '[{"key":"A","text":"PHP 220"},{"key":"B","text":"PHP 240"},{"key":"C","text":"PHP 250"},{"key":"D","text":"PHP 260"}]'::jsonb, 'B', 'Total cost = (2x300)+(3x200) = 600+600 = 1200. Total weight = 5 kg. Price/kg = 1200/5 = PHP 240.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Fractions', 'Simplify: 3/4 + 1/6', '[{"key":"A","text":"4/10"},{"key":"B","text":"7/12"},{"key":"C","text":"11/12"},{"key":"D","text":"4/6"}]'::jsonb, 'C', 'Find common denominator 12: 3/4 = 9/12, 1/6 = 2/12. Sum = 11/12.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problems - Distance', 'Two cyclists start from the same point and travel in opposite directions, one at 15 km/h and the other at 20 km/h. How far apart are they after 2 hours?', '[{"key":"A","text":"35 km"},{"key":"B","text":"40 km"},{"key":"C","text":"60 km"},{"key":"D","text":"70 km"}]'::jsonb, 'D', 'Combined speed = 15+20 = 35 km/h. Distance apart = 35 x 2 = 70 km.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Pythagorean Theorem', 'A right triangle has legs of 6 cm and 8 cm. What is the length of the hypotenuse?', '[{"key":"A","text":"9 cm"},{"key":"B","text":"10 cm"},{"key":"C","text":"12 cm"},{"key":"D","text":"14 cm"}]'::jsonb, 'B', 'By the Pythagorean theorem, c = sqrt(6^2 + 8^2) = sqrt(36+64) = sqrt(100) = 10 cm.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Statistics - Probability', 'A bag contains 4 red balls and 6 blue balls. What is the probability of randomly picking a red ball?', '[{"key":"A","text":"1/4"},{"key":"B","text":"2/5"},{"key":"C","text":"3/5"},{"key":"D","text":"1/2"}]'::jsonb, 'B', 'Probability = favorable outcomes / total outcomes = 4/10 = 2/5.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Systems of Equations', 'Solve the system: x + y = 10, x - y = 2. What is the value of x?', '[{"key":"A","text":"4"},{"key":"B","text":"6"},{"key":"C","text":"8"},{"key":"D","text":"12"}]'::jsonb, 'B', 'Adding the two equations: 2x = 12, so x = 6.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problems - Simple Interest', 'A savings account earns simple interest of 5% per year. How much interest is earned on PHP 20,000 after 3 years?', '[{"key":"A","text":"PHP 1,000"},{"key":"B","text":"PHP 2,000"},{"key":"C","text":"PHP 3,000"},{"key":"D","text":"PHP 4,000"}]'::jsonb, 'C', 'Simple interest = P x r x t = 20000 x 0.05 x 3 = PHP 3,000.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Theory - Prime Numbers', 'Which of the following is a prime number?', '[{"key":"A","text":"21"},{"key":"B","text":"27"},{"key":"C","text":"31"},{"key":"D","text":"33"}]'::jsonb, 'C', '31 has no divisors other than 1 and itself. 21=3x7, 27=3^3, 33=3x11, all composite.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Angles', 'Two angles are supplementary. If one angle measures 65 degrees, what is the measure of the other?', '[{"key":"A","text":"25 degrees"},{"key":"B","text":"35 degrees"},{"key":"C","text":"115 degrees"},{"key":"D","text":"125 degrees"}]'::jsonb, 'C', 'Supplementary angles sum to 180 degrees. 180 - 65 = 115 degrees.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'mathematics';

-- ============================================================
-- SCIENCE (biology, chemistry, physics, earth science/astronomy -- recall with close distractors)
-- ============================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Cell Structure', 'Which structure controls what enters and exits the cell?', '[{"key":"A","text":"Cell wall"},{"key":"B","text":"Cell membrane"},{"key":"C","text":"Cytoplasm"},{"key":"D","text":"Nucleolus"}]'::jsonb, 'B', 'The cell membrane is selectively permeable and regulates the movement of substances into and out of the cell. The cell wall provides structural support but is not selectively permeable.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Genetics', 'What term describes an organism''s observable physical traits, such as eye color?', '[{"key":"A","text":"Genotype"},{"key":"B","text":"Phenotype"},{"key":"C","text":"Allele"},{"key":"D","text":"Chromosome"}]'::jsonb, 'B', '"Phenotype" refers to observable characteristics, while "genotype" refers to the underlying genetic makeup -- a commonly confused pair.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - States of Matter', 'The process by which a liquid changes directly into a gas at its surface, below boiling point, is called ______.', '[{"key":"A","text":"Sublimation"},{"key":"B","text":"Evaporation"},{"key":"C","text":"Condensation"},{"key":"D","text":"Deposition"}]'::jsonb, 'B', 'Evaporation is the surface-level conversion of liquid to gas below boiling point. Sublimation is solid-to-gas, and condensation is gas-to-liquid.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Acids and Bases', 'A solution with a pH of 3 is best described as ______.', '[{"key":"A","text":"Strongly basic"},{"key":"B","text":"Neutral"},{"key":"C","text":"Weakly basic"},{"key":"D","text":"Acidic"}]'::jsonb, 'D', 'A pH below 7 indicates an acidic solution; pH 3 is fairly strongly acidic.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Motion', 'What term describes the rate of change of velocity over time?', '[{"key":"A","text":"Speed"},{"key":"B","text":"Acceleration"},{"key":"C","text":"Momentum"},{"key":"D","text":"Displacement"}]'::jsonb, 'B', 'Acceleration is defined as the rate of change of velocity, distinct from speed (a scalar magnitude) and momentum (mass times velocity).', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Waves', 'Which term refers to the number of wave cycles that pass a point per second?', '[{"key":"A","text":"Amplitude"},{"key":"B","text":"Wavelength"},{"key":"C","text":"Frequency"},{"key":"D","text":"Period"}]'::jsonb, 'C', 'Frequency measures cycles per second (Hz). Wavelength is a distance measure, and period is the time for one cycle (the inverse of frequency).', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Weather vs Climate', 'What is the key difference between weather and climate?', '[{"key":"A","text":"Weather is short-term atmospheric conditions; climate is long-term average patterns."},{"key":"B","text":"Weather refers only to temperature; climate refers only to rainfall."},{"key":"C","text":"Weather and climate are the same thing."},{"key":"D","text":"Climate changes daily while weather stays constant."}]'::jsonb, 'A', 'Weather describes day-to-day atmospheric conditions, while climate describes long-term average weather patterns over years.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Astronomy - Lunar Phases', 'What causes the phases of the moon?', '[{"key":"A","text":"The Earth''s shadow falling on the moon"},{"key":"B","text":"The changing distance between the Earth and the moon"},{"key":"C","text":"The changing angle at which sunlight illuminates the moon as seen from Earth"},{"key":"D","text":"The moon''s rotation on its own axis"}]'::jsonb, 'C', 'Lunar phases result from the changing relative positions of the sun, Earth, and moon, which change how much of the sunlit side of the moon is visible from Earth. This is often confused with a lunar eclipse (Earth''s shadow).', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Photosynthesis', 'Which gas do plants absorb from the atmosphere during photosynthesis?', '[{"key":"A","text":"Oxygen"},{"key":"B","text":"Carbon dioxide"},{"key":"C","text":"Nitrogen"},{"key":"D","text":"Hydrogen"}]'::jsonb, 'B', 'Plants absorb carbon dioxide and release oxygen as a byproduct of photosynthesis -- a commonly reversed pairing in exam distractors.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Mixtures', 'Which of the following best describes a homogeneous mixture?', '[{"key":"A","text":"A mixture with visibly distinct components"},{"key":"B","text":"A mixture with uniform composition throughout"},{"key":"C","text":"A pure substance made of one element"},{"key":"D","text":"A mixture that cannot be separated"}]'::jsonb, 'B', 'A homogeneous mixture has uniform composition throughout, unlike a heterogeneous mixture where components remain visibly distinct.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Human Body Systems', 'Which structure in the respiratory system is the primary site of gas exchange?', '[{"key":"A","text":"Trachea"},{"key":"B","text":"Bronchi"},{"key":"C","text":"Alveoli"},{"key":"D","text":"Larynx"}]'::jsonb, 'C', 'Alveoli are tiny air sacs in the lungs where oxygen and carbon dioxide are exchanged with the blood. The trachea and bronchi are airways, not exchange sites.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Simple Machines', 'A ramp used to lift a heavy box more easily is an example of which simple machine?', '[{"key":"A","text":"Lever"},{"key":"B","text":"Pulley"},{"key":"C","text":"Inclined plane"},{"key":"D","text":"Wedge"}]'::jsonb, 'C', 'A ramp is an inclined plane, which reduces the force needed to raise an object by increasing the distance over which the force is applied.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Layers of the Earth', 'Which layer of the Earth is primarily composed of molten and semi-molten rock that flows slowly?', '[{"key":"A","text":"Crust"},{"key":"B","text":"Mantle"},{"key":"C","text":"Outer core"},{"key":"D","text":"Inner core"}]'::jsonb, 'B', 'The mantle consists of semi-molten rock that flows slowly, driving plate tectonics. The outer core is molten but composed mainly of iron and nickel, not rock.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Elements and Compounds', 'Table salt (NaCl) is best classified as a ______.', '[{"key":"A","text":"Mixture"},{"key":"B","text":"Element"},{"key":"C","text":"Compound"},{"key":"D","text":"Solution"}]'::jsonb, 'C', 'NaCl is a compound because it consists of two different elements (sodium and chlorine) chemically bonded in a fixed ratio.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Ecology', 'In a food chain, an organism that makes its own food using sunlight is called a ______.', '[{"key":"A","text":"Consumer"},{"key":"B","text":"Decomposer"},{"key":"C","text":"Producer"},{"key":"D","text":"Predator"}]'::jsonb, 'C', 'Producers, such as plants, generate their own food through photosynthesis, forming the base of most food chains.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Electricity', 'Which unit is used to measure electrical resistance?', '[{"key":"A","text":"Volt"},{"key":"B","text":"Ampere"},{"key":"C","text":"Ohm"},{"key":"D","text":"Watt"}]'::jsonb, 'C', 'Resistance is measured in ohms. Volts measure voltage, amperes measure current, and watts measure power -- closely related but distinct units.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Classification', 'Which taxonomic rank is more specific: genus or species?', '[{"key":"A","text":"Genus"},{"key":"B","text":"Species"},{"key":"C","text":"They are equally specific"},{"key":"D","text":"Neither is a taxonomic rank"}]'::jsonb, 'B', 'Species is the most specific taxonomic rank, nested within genus, which groups multiple related species together.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Chemical Reactions', 'A reaction that releases heat to its surroundings is called ______.', '[{"key":"A","text":"Endothermic"},{"key":"B","text":"Exothermic"},{"key":"C","text":"Isothermic"},{"key":"D","text":"Catalytic"}]'::jsonb, 'B', 'Exothermic reactions release heat energy, while endothermic reactions absorb heat -- a frequently confused pair of terms.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Sound', 'Sound waves are classified as which type of wave?', '[{"key":"A","text":"Transverse wave"},{"key":"B","text":"Longitudinal wave"},{"key":"C","text":"Electromagnetic wave"},{"key":"D","text":"Standing wave only"}]'::jsonb, 'B', 'Sound waves are longitudinal waves, where particle vibration is parallel to the direction of wave travel, unlike transverse waves such as light.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Water Cycle', 'What is the term for water vapor turning into liquid water droplets to form clouds?', '[{"key":"A","text":"Evaporation"},{"key":"B","text":"Precipitation"},{"key":"C","text":"Condensation"},{"key":"D","text":"Transpiration"}]'::jsonb, 'C', 'Condensation is the process by which water vapor cools and changes into liquid droplets, forming clouds.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Genetics', 'An inherited trait controlled by a dominant allele will be expressed in an organism''s phenotype ______.', '[{"key":"A","text":"only if both alleles are dominant"},{"key":"B","text":"if at least one dominant allele is present"},{"key":"C","text":"only if both alleles are recessive"},{"key":"D","text":"regardless of the alleles present"}]'::jsonb, 'B', 'A dominant allele is expressed in the phenotype even when paired with a recessive allele (heterozygous), so only one dominant allele is needed.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Periodic Table', 'Elements in the same column (group) of the periodic table tend to have similar ______.', '[{"key":"A","text":"Atomic mass"},{"key":"B","text":"Number of protons"},{"key":"C","text":"Chemical properties"},{"key":"D","text":"Number of neutrons"}]'::jsonb, 'C', 'Elements in the same group share a similar number of valence electrons, giving them similar chemical properties.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Forces', 'Which of Newton''s laws states that for every action there is an equal and opposite reaction?', '[{"key":"A","text":"First Law"},{"key":"B","text":"Second Law"},{"key":"C","text":"Third Law"},{"key":"D","text":"Law of Gravitation"}]'::jsonb, 'C', 'Newton''s Third Law describes action-reaction force pairs. The First Law concerns inertia, and the Second relates force, mass, and acceleration.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'science';

-- ============================================================
-- READING COMPREHENSION (passage-based main idea, inference, tone, vocabulary, detail, structure)
-- ============================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Main Idea', 'Passage: "Remote work has changed how companies think about office space. Many businesses now favor smaller, shared workspaces over large permanent offices, since employees only come in a few days a week. This shift has also affected commercial real estate prices in major cities." What is the main idea of the passage?', '[{"key":"A","text":"Commercial real estate prices always rise."},{"key":"B","text":"Remote work has reshaped office space needs and real estate trends."},{"key":"C","text":"Employees never want to return to the office."},{"key":"D","text":"Shared workspaces are more expensive than permanent offices."}]'::jsonb, 'B', 'The passage discusses how remote work has changed company decisions about office space and its ripple effect on real estate, matching option B.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'Passage: "Maria checked her watch every few minutes and kept glancing at the door. When it finally opened, she jumped up, smiling widely, and rushed to embrace the visitor." What can be inferred about Maria?', '[{"key":"A","text":"She was anxious and eagerly awaiting the visitor''s arrival."},{"key":"B","text":"She did not want the visitor to arrive."},{"key":"C","text":"She was indifferent about the visitor."},{"key":"D","text":"She had forgotten about the visitor entirely."}]'::jsonb, 'A', 'Her repeated watch-checking, glancing at the door, and enthusiastic reaction all suggest eager anticipation of the visitor.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Detail/Fact Recall', 'Passage: "Bamboo is one of the fastest-growing plants on Earth, with some species capable of growing up to 91 centimeters within a single day under ideal conditions. It is used for construction, furniture, and even food." According to the passage, how fast can some bamboo species grow in a day?', '[{"key":"A","text":"Up to 30 centimeters"},{"key":"B","text":"Up to 60 centimeters"},{"key":"C","text":"Up to 91 centimeters"},{"key":"D","text":"Up to 120 centimeters"}]'::jsonb, 'C', 'The passage explicitly states some bamboo species can grow up to 91 centimeters in a single day.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Tone', 'Passage: "Once again, the city promises a new traffic plan that will supposedly solve congestion in ''just a few months'' -- the same promise we heard two years ago, and the year before that." What is the author''s tone?', '[{"key":"A","text":"Optimistic"},{"key":"B","text":"Skeptical"},{"key":"C","text":"Joyful"},{"key":"D","text":"Neutral"}]'::jsonb, 'B', 'The repeated emphasis on broken past promises signals a skeptical, doubtful tone toward the new plan.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'Passage: "The company''s new policy was met with vehement objections from the staff, many of whom threatened to resign." What does "vehement" most likely mean in this context?', '[{"key":"A","text":"Mild and passive"},{"key":"B","text":"Forceful and intense"},{"key":"C","text":"Silent and reserved"},{"key":"D","text":"Supportive and enthusiastic"}]'::jsonb, 'B', '"Vehement" means showing strong, forceful feeling, consistent with staff threatening to resign over the objections.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Cause and Effect', 'Passage: "Overfishing in the region depleted the local fish population so severely that many fishing families were forced to seek other sources of income." What was the effect of overfishing described in the passage?', '[{"key":"A","text":"Fish populations grew rapidly."},{"key":"B","text":"Fishing families had to find other sources of income."},{"key":"C","text":"The government banned all fishing permanently."},{"key":"D","text":"Fishing families became wealthier."}]'::jsonb, 'B', 'The passage states directly that depleted fish populations forced fishing families to seek other income sources.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Purpose', 'Passage: "Contrary to popular belief, bats are not blind. In fact, most bat species have functional eyesight and use echolocation mainly to navigate in the dark, not because they cannot see." What is the primary purpose of this passage?', '[{"key":"A","text":"To persuade readers to fear bats"},{"key":"B","text":"To correct a common misconception about bats"},{"key":"C","text":"To tell an entertaining story about a bat"},{"key":"D","text":"To compare bats to birds"}]'::jsonb, 'B', 'The passage opens by directly addressing and correcting a popular misconception, showing its purpose is clarifying/informative.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sequence of Events', 'Passage: "The baker first kneads the dough thoroughly. After letting it rest for an hour, she shapes it into loaves. The loaves are then baked at high heat until golden brown." What happens right before the dough is shaped into loaves?', '[{"key":"A","text":"The dough is baked."},{"key":"B","text":"The dough is left to rest for an hour."},{"key":"C","text":"The dough is kneaded a second time."},{"key":"D","text":"The loaves turn golden brown."}]'::jsonb, 'B', 'According to the passage, the dough rests for an hour before being shaped into loaves.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Main Idea', 'Passage: "While social media allows people to stay connected across distances, excessive use has been linked to increased feelings of loneliness and anxiety, particularly among teenagers. Experts recommend balanced, mindful use rather than complete avoidance." What is the main idea of the passage?', '[{"key":"A","text":"Social media should be banned for teenagers."},{"key":"B","text":"Social media has both connective benefits and potential downsides that call for balanced use."},{"key":"C","text":"Social media only affects adults negatively."},{"key":"D","text":"Experts agree that social media has no negative effects."}]'::jsonb, 'B', 'The passage presents both the benefit (staying connected) and the downside (loneliness/anxiety), concluding with a recommendation for balance -- matching option B.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'Passage: "The store shelves, usually stocked with bottled water and canned goods, were nearly empty. Long lines formed outside as residents waited for their turn to buy supplies." What can be inferred from this passage?', '[{"key":"A","text":"A sale event was happening at the store."},{"key":"B","text":"People were preparing for an emergency, such as an incoming storm."},{"key":"C","text":"The store was permanently closing."},{"key":"D","text":"Residents were bored and had nothing else to do."}]'::jsonb, 'B', 'Empty shelves of essential goods and long lines suggest residents are stocking up in anticipation of an emergency like a storm.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Detail/Fact Recall', 'Passage: "Founded in 1611, the University of Santo Tomas is one of the oldest existing universities in Asia. It has produced numerous saints, national heroes, and leaders across various fields." In what year was the university mentioned in the passage founded?', '[{"key":"A","text":"1521"},{"key":"B","text":"1611"},{"key":"C","text":"1898"},{"key":"D","text":"1946"}]'::jsonb, 'B', 'The passage explicitly states the university was founded in 1611.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Text Structure', 'Passage: "There are two main approaches to studying: massed practice, where a student studies a subject for long, uninterrupted stretches, and spaced practice, where study sessions are broken up over time. Research generally favors the latter for long-term retention." How is this passage primarily organized?', '[{"key":"A","text":"Chronological order of events"},{"key":"B","text":"Comparison of two approaches"},{"key":"C","text":"Cause and effect"},{"key":"D","text":"Problem and solution narrative"}]'::jsonb, 'B', 'The passage introduces and contrasts two study approaches (massed vs. spaced practice), which is a comparison structure.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'Passage: "The old bridge, though structurally sound, looked dilapidated, with peeling paint and rusted railings." What does "dilapidated" most likely mean?', '[{"key":"A","text":"Newly built"},{"key":"B","text":"Run-down or in a state of disrepair"},{"key":"C","text":"Brightly colored"},{"key":"D","text":"Extremely sturdy"}]'::jsonb, 'B', '"Dilapidated" means falling into disrepair, consistent with the description of peeling paint and rusted railings.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Purpose', 'Passage: "Buy now and save 30 percent on all winter jackets! This offer is valid only until the end of the month, so don''t miss out on staying warm for less." What is the primary purpose of this passage?', '[{"key":"A","text":"To inform readers about winter weather patterns"},{"key":"B","text":"To persuade readers to make a purchase"},{"key":"C","text":"To narrate a personal experience"},{"key":"D","text":"To compare two competing brands"}]'::jsonb, 'B', 'The language of discounts, urgency ("don''t miss out"), and calls to action ("buy now") indicate a persuasive, advertising purpose.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'Passage: "Despite having studied the material thoroughly, Carlo stared blankly at the exam questions, his mind suddenly empty. His hands trembled as he gripped his pencil." What can be inferred about Carlo''s state during the exam?', '[{"key":"A","text":"He is confident and well-prepared."},{"key":"B","text":"He is experiencing anxiety or panic despite his preparation."},{"key":"C","text":"He did not study for the exam at all."},{"key":"D","text":"He finished the exam quickly."}]'::jsonb, 'B', 'Trembling hands and a suddenly "empty" mind despite thorough preparation suggest test anxiety or panic, not lack of preparation.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Main Idea', 'Passage: "Coral reefs, often called the ''rainforests of the sea,'' support around a quarter of all marine species despite covering less than one percent of the ocean floor. Rising sea temperatures, however, are causing widespread coral bleaching, threatening this fragile ecosystem." What is the main idea of the passage?', '[{"key":"A","text":"Coral reefs cover most of the ocean floor."},{"key":"B","text":"Coral reefs are ecologically vital but threatened by rising sea temperatures."},{"key":"C","text":"Marine species do not depend on coral reefs."},{"key":"D","text":"Coral bleaching has no effect on marine life."}]'::jsonb, 'B', 'The passage highlights coral reefs'' ecological importance and the threat posed by rising temperatures, which together form the main idea.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Detail/Fact Recall', 'Passage: "Honey never spoils if stored properly, because its low moisture content and acidic pH create an environment where bacteria cannot survive. Archaeologists have even found edible honey in ancient Egyptian tombs." According to the passage, why does honey not spoil?', '[{"key":"A","text":"It is stored in airtight containers by bees."},{"key":"B","text":"Its low moisture content and acidic pH prevent bacterial growth."},{"key":"C","text":"It was specially preserved by ancient Egyptians."},{"key":"D","text":"It naturally contains preservative chemicals added by beekeepers."}]'::jsonb, 'B', 'The passage explicitly attributes honey''s longevity to its low moisture content and acidic pH, which prevent bacteria from surviving.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Cause and Effect', 'Passage: "When the factory switched to automated machinery, production output doubled within a year, but nearly a hundred workers lost their jobs as their manual tasks became unnecessary." What was one effect of the factory''s switch to automation?', '[{"key":"A","text":"Production output decreased."},{"key":"B","text":"The factory closed permanently."},{"key":"C","text":"Nearly a hundred workers lost their jobs."},{"key":"D","text":"Workers received higher wages."}]'::jsonb, 'C', 'The passage states directly that automation led to job losses for nearly a hundred workers, alongside doubled output.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'Passage: "The senator''s speech was full of platitudes about unity and progress, offering no concrete plans for how these goals would be achieved." What does "platitudes" most likely mean in this context?', '[{"key":"A","text":"Detailed technical plans"},{"key":"B","text":"Overused, empty statements lacking substance"},{"key":"C","text":"Controversial and offensive remarks"},{"key":"D","text":"Statistical data and figures"}]'::jsonb, 'B', '"Platitudes" refers to trite, overused remarks, consistent with the description of "no concrete plans."', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Main Idea', 'Passage: "Sleep is not merely a period of rest; it plays an active role in memory consolidation, immune function, and emotional regulation. Chronic sleep deprivation has been linked to a higher risk of heart disease and impaired cognitive performance." What is the main idea of the passage?', '[{"key":"A","text":"Sleep serves several important biological functions beyond rest."},{"key":"B","text":"Sleep deprivation only affects memory."},{"key":"C","text":"Most people do not need much sleep."},{"key":"D","text":"Heart disease is caused solely by poor diet."}]'::jsonb, 'A', 'The passage lists multiple active functions of sleep (memory, immunity, emotional regulation) and the risks of deprivation, supporting option A as the main idea.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'Passage: "After the interview, the hiring manager shook Liza''s hand firmly, smiled, and said, ''We''ll be in touch soon -- I think you''ll be hearing good news.''" What can be inferred about the outcome of Liza''s interview?', '[{"key":"A","text":"She likely performed well and may be offered the position."},{"key":"B","text":"She was rejected immediately."},{"key":"C","text":"The interview was cancelled."},{"key":"D","text":"She will need to reapply next year."}]'::jsonb, 'A', 'The manager''s warm demeanor and hint of "good news" strongly suggest a favorable outcome for Liza.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Detail/Fact Recall', 'Passage: "The Mariana Trench, located in the western Pacific Ocean, is the deepest known part of the world''s oceans, reaching depths of nearly 11,000 meters at its lowest point, called the Challenger Deep." What is the name of the deepest point in the Mariana Trench?', '[{"key":"A","text":"Pacific Deep"},{"key":"B","text":"Mariana Point"},{"key":"C","text":"Challenger Deep"},{"key":"D","text":"Ocean Floor Basin"}]'::jsonb, 'C', 'The passage names the deepest point of the Mariana Trench as the "Challenger Deep."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Tone', 'Passage: "What a magnificent achievement it is to watch a team overcome every obstacle thrown their way and rise, against all odds, to claim the championship title." What is the author''s tone?', '[{"key":"A","text":"Admiring and celebratory"},{"key":"B","text":"Dismissive"},{"key":"C","text":"Bitter"},{"key":"D","text":"Indifferent"}]'::jsonb, 'A', 'Words like "magnificent achievement" and "rise against all odds" reflect an admiring, celebratory tone toward the team''s success.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Text Structure', 'Passage: "First, gather all necessary ingredients. Next, preheat the oven to 180 degrees Celsius. Then, mix the dry ingredients before slowly folding in the wet ones. Finally, bake for 25 minutes." How is this passage organized?', '[{"key":"A","text":"Compare and contrast"},{"key":"B","text":"Sequential/step-by-step order"},{"key":"C","text":"Cause and effect"},{"key":"D","text":"Problem and solution"}]'::jsonb, 'B', 'The use of transition words like "first," "next," "then," and "finally" signals a sequential, step-by-step structure.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'Passage: "The witness gave a terse response to every question, offering only one or two words before falling silent again." What does "terse" most likely mean in this context?', '[{"key":"A","text":"Long and detailed"},{"key":"B","text":"Brief and abrupt"},{"key":"C","text":"Emotional and tearful"},{"key":"D","text":"Confused and rambling"}]'::jsonb, 'B', '"Terse" means using few words, often abruptly, which matches the description of one- or two-word answers.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'ust' and s.slug = 'reading-comprehension';
