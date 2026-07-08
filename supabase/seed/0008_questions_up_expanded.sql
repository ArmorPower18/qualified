-- Expanded practice question bank for UPCAT (UP College Admission Test) subjects.
-- Adds new original questions on top of 0002_questions_up.sql so each UP subject
-- reaches roughly 30-35 total questions with wide topic coverage.
-- All questions below are AI-drafted originals; mark for human review before
-- treating as authoritative.

-- =========================================================
-- Reading Comprehension (new)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Main Idea', 'A passage discusses the government''s jeepney modernization program, noting both the environmental benefits of cleaner vehicles and the concerns of traditional jeepney drivers about losing their livelihood. Which best states the main idea?', '[{"key":"A","text":"Jeepneys are the primary cause of air pollution in Metro Manila."},{"key":"B","text":"The jeepney modernization program creates tension between environmental goals and drivers'' economic concerns."},{"key":"C","text":"All jeepney drivers support the modernization program."},{"key":"D","text":"The government has no plan to modernize public transportation."}]'::jsonb, 'B', 'The passage centers on the conflict between the program''s environmental aims and its impact on drivers'' livelihoods, not on pollution alone or driver unanimity.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'A passage describes a student who consistently submits assignments late but always turns in detailed, well-researched work. What can be reasonably inferred about the student?', '[{"key":"A","text":"The student does not care about the class."},{"key":"B","text":"The student may struggle with time management despite being capable of quality work."},{"key":"C","text":"The student never reads the assignment instructions."},{"key":"D","text":"The teacher dislikes the student."}]'::jsonb, 'B', 'Consistent lateness paired with high-quality work suggests a time-management issue rather than a lack of effort or ability.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Context Clues', 'In the sentence "The lecture was so soporific that half the audience dozed off within minutes," the word "soporific" most nearly means', '[{"key":"A","text":"exciting"},{"key":"B","text":"sleep-inducing"},{"key":"C","text":"confusing"},{"key":"D","text":"brief"}]'::jsonb, 'B', 'The context clue "dozed off" signals that "soporific" means causing sleepiness, i.e., sleep-inducing.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Fact vs Opinion', 'Which of the following sentences expresses an OPINION rather than a fact?', '[{"key":"A","text":"The Philippines has 7,641 islands."},{"key":"B","text":"Manila is the capital of the Philippines."},{"key":"C","text":"Boracay is the most beautiful island in the country."},{"key":"D","text":"The Philippines is located in Southeast Asia."}]'::jsonb, 'C', '"Most beautiful" is a subjective judgment that cannot be verified, unlike the other statements, which are verifiable facts.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Cause and Effect', 'A passage explains that heavy rainfall upstream caused a river to swell, which then led to flooding in low-lying villages downstream. What is the EFFECT described in the passage?', '[{"key":"A","text":"Heavy rainfall"},{"key":"B","text":"Flooding in low-lying villages"},{"key":"C","text":"The river''s location"},{"key":"D","text":"The villages'' preparation for disasters"}]'::jsonb, 'B', 'The flooding is the resulting event (effect) caused by the heavy rainfall and swollen river.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Bias', 'An article about a mayoral candidate repeatedly uses phrases like "visionary leader" and "tireless public servant" while omitting any mention of criticism. This suggests the author is', '[{"key":"A","text":"strictly objective"},{"key":"B","text":"favorably biased toward the candidate"},{"key":"C","text":"hostile toward the candidate"},{"key":"D","text":"writing satire"}]'::jsonb, 'B', 'The consistent use of praising language and the omission of criticism indicate the author holds a favorable bias toward the candidate.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Summarizing', 'Which sentence best summarizes a passage that discusses the causes, effects, and possible solutions to traffic congestion in Metro Manila?', '[{"key":"A","text":"Traffic congestion in Metro Manila has multiple causes and effects, and the passage explores several possible solutions."},{"key":"B","text":"Metro Manila has no traffic problems."},{"key":"C","text":"The passage only lists the causes of traffic without discussing solutions."},{"key":"D","text":"Traffic congestion is unique to the Philippines."}]'::jsonb, 'A', 'A good summary captures all major components of the passage: causes, effects, and solutions, which option A does.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Passage Organization - Compare/Contrast', 'A passage discusses the similarities and differences between online learning and traditional classroom learning. This passage is best organized using which structure?', '[{"key":"A","text":"Cause and effect"},{"key":"B","text":"Compare and contrast"},{"key":"C","text":"Chronological order"},{"key":"D","text":"Problem and solution"}]'::jsonb, 'B', 'Discussing similarities and differences between two subjects is the defining feature of a compare-and-contrast structure.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Paksang Diwa', 'Basahin: "Ang polusyon sa hangin ay dulot ng usok mula sa mga sasakyan at pabrika. Nakakaapekto ito sa kalusugan ng mga tao, lalo na sa mga may sakit sa baga." Ano ang paksang diwa ng talata?', '[{"key":"A","text":"Ang polusyon sa hangin ay dulot ng usok at nakakaapekto sa kalusugan."},{"key":"B","text":"Ang mga sasakyan ay dapat ipagbawal."},{"key":"C","text":"Ang mga pabrika ay walang epekto sa kalikasan."},{"key":"D","text":"Ang sakit sa baga ay hindi nauugnay sa polusyon."}]'::jsonb, 'A', 'Direktang nakasaad sa talata na ang polusyon sa hangin, na dulot ng usok, ay nakakaapekto sa kalusugan ng mga tao.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Layunin ng May-akda', 'Isang sanaysay ang naglalarawan ng mga hakbang upang gawing organic ang isang taniman. Ano ang pangunahing layunin ng may-akda?', '[{"key":"A","text":"Aliwin ang mambabasa gamit ang kathang-isip na kwento."},{"key":"B","text":"Turuan ang mambabasa kung paano gawing organic ang isang taniman."},{"key":"C","text":"Kumbinsihin ang mambabasa na huwag magtanim."},{"key":"D","text":"Pukawin ang galit ng mambabasa."}]'::jsonb, 'B', 'Ang paglalahad ng mga hakbang-hakbang na proseso ay nagpapakita na layunin ng may-akda na turuan ang mambabasa.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Critical Reading - Assumption', 'An advertisement claims, "Nine out of ten dentists recommend this toothpaste, so it must be the best." What assumption underlies this claim?', '[{"key":"A","text":"That dentist recommendations are the only measure of a toothpaste''s quality."},{"key":"B","text":"That toothpaste has no effect on dental health."},{"key":"C","text":"That all dentists disagree with each other."},{"key":"D","text":"That price determines quality."}]'::jsonb, 'A', 'The argument only makes sense if we assume dentist endorsement is the sole or primary criterion for "best," which is an unstated assumption.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Text Structure - Sequence', 'A passage describes the process of rice production: planting seedlings, transplanting, growing, harvesting, and milling. This passage uses what text structure?', '[{"key":"A","text":"Sequence/Process"},{"key":"B","text":"Comparison"},{"key":"C","text":"Cause and effect"},{"key":"D","text":"Description of a single object"}]'::jsonb, 'A', 'Describing a series of ordered steps in a process is characteristic of a sequence (process) text structure.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Supporting Details', 'A passage states: "Coral reefs support about 25% of all marine species, provide coastal protection from storms, and contribute billions of dollars to tourism annually." Which of the following is NOT mentioned as a benefit of coral reefs in the passage?', '[{"key":"A","text":"Supporting marine biodiversity"},{"key":"B","text":"Protecting coastlines from storms"},{"key":"C","text":"Generating tourism revenue"},{"key":"D","text":"Producing oxygen for the atmosphere"}]'::jsonb, 'D', 'The passage mentions biodiversity, storm protection, and tourism revenue, but never mentions oxygen production.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Predicting Outcomes', 'A passage describes a company that has ignored customer complaints about poor service for several years while its competitors continually improve. Based on the passage, what is the most likely outcome for the company?', '[{"key":"A","text":"The company will likely lose customers to competitors."},{"key":"B","text":"The company''s sales will definitely double."},{"key":"C","text":"The company will become the market leader."},{"key":"D","text":"The company will have no change in customers."}]'::jsonb, 'A', 'Ignoring complaints while competitors improve makes losing customers the most reasonable predicted outcome; the other options are unsupported or contradicted by the passage.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Point of View', 'A passage narrated using words like "I," "my," and "our experiences" is written from which point of view?', '[{"key":"A","text":"Third-person omniscient"},{"key":"B","text":"First-person"},{"key":"C","text":"Second-person"},{"key":"D","text":"Third-person limited"}]'::jsonb, 'B', 'The use of "I," "my," and "our" indicates the narrator is a participant in the story, which is the first-person point of view.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Figurative Language', 'In the line "Her voice was music to his ears," what figure of speech is used?', '[{"key":"A","text":"Simile"},{"key":"B","text":"Metaphor"},{"key":"C","text":"Personification"},{"key":"D","text":"Hyperbole"}]'::jsonb, 'B', 'The line directly equates "her voice" with "music" without using "like" or "as," which is the defining feature of a metaphor.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Inference', 'Sa isang talata, binanggit na ang isang mag-aaral ay laging nasa aklatan tuwing recess at hindi kailanman nakikipaglaro sa mga kaklase. Ano ang maaaring ihinuha tungkol sa mag-aaral?', '[{"key":"A","text":"Mahilig siyang magbasa o mag-aral kaysa maglaro."},{"key":"B","text":"Ayaw niya ng kanyang mga kaklase."},{"key":"C","text":"Bawal siyang lumabas ng silid-aralan."},{"key":"D","text":"Hindi siya marunong magbasa."}]'::jsonb, 'A', 'Ang pananatili sa aklatan sa halip na maglaro ay nagpapahiwatig ng higit na interes sa pagbabasa o pag-aaral.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Reading Graphs/Data in Passage', 'A passage mentions that a survey found 60% of respondents prefer online classes, 25% prefer face-to-face classes, and 15% prefer a blended format. Based on this data, which format is LEAST preferred?', '[{"key":"A","text":"Online classes"},{"key":"B","text":"Face-to-face classes"},{"key":"C","text":"Blended format"},{"key":"D","text":"All formats are equally preferred"}]'::jsonb, 'C', 'At 15%, the blended format has the lowest percentage of respondents preferring it, making it the least preferred.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy in Context', 'A passage compares the human immune system to an "army defending a fortress." What is the purpose of this comparison?', '[{"key":"A","text":"To confuse the reader with unrelated ideas"},{"key":"B","text":"To help the reader visualize how the immune system defends the body"},{"key":"C","text":"To argue that the body is literally a fortress"},{"key":"D","text":"To criticize military spending"}]'::jsonb, 'B', 'Comparisons like this are used as a rhetorical device to make an abstract biological process easier to visualize and understand.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Theme', 'A short story follows a poor fisherman who shares his small catch with a starving stranger, and later prospers. What is the most likely theme of this story?', '[{"key":"A","text":"Greed leads to success."},{"key":"B","text":"Kindness and generosity are often rewarded."},{"key":"C","text":"Fishing is a dangerous profession."},{"key":"D","text":"Strangers should never be trusted."}]'::jsonb, 'B', 'The fisherman''s act of generosity being followed by prosperity supports a theme about kindness being rewarded.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Detalye', 'Batay sa talatang tumatalakay sa Kadayawan Festival sa Davao, na nagsasabing ito''y idinaraos taon-taon tuwing Agosto bilang pasasalamat sa masaganang ani, kailan idinaraos ang Kadayawan Festival?', '[{"key":"A","text":"Tuwing Disyembre"},{"key":"B","text":"Tuwing Agosto"},{"key":"C","text":"Tuwing Enero"},{"key":"D","text":"Tuwing Hulyo"}]'::jsonb, 'B', 'Direktang nakasaad sa talata na ang Kadayawan Festival ay idinaraos taon-taon tuwing Agosto.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Argument Evaluation', 'A writer argues that all students should learn to code because "coding is the future." Which of the following, if true, would most WEAKEN this argument?', '[{"key":"A","text":"Many successful careers do not require coding skills."},{"key":"B","text":"Some students enjoy coding."},{"key":"C","text":"Coding bootcamps are becoming more affordable."},{"key":"D","text":"Technology continues to advance rapidly."}]'::jsonb, 'A', 'If many successful careers do not need coding, the claim that ALL students must learn it is undermined; the other options do not challenge the argument.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Tono', 'Sa isang tula tungkol sa kagubatang unti-unting nasisira dahil sa pagtotroso, ano ang maaaring tono ng makata?', '[{"key":"A","text":"Masayahin at walang pakialam"},{"key":"B","text":"Malungkot at mapanuri"},{"key":"C","text":"Nang-aasar"},{"key":"D","text":"Ganap na walang emosyon"}]'::jsonb, 'B', 'Ang paksa tungkol sa pagkasira ng kalikasan ay karaniwang isinusulat nang may tonong malungkot at mapanuri sa mga taong sanhi nito.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Contextual Meaning of Idiom', 'In the sentence, "After the scandal broke, the senator decided to keep a low profile," the phrase "keep a low profile" most nearly means', '[{"key":"A","text":"to avoid drawing attention to oneself"},{"key":"B","text":"to run for a higher position"},{"key":"C","text":"to speak publicly as often as possible"},{"key":"D","text":"to resign immediately"}]'::jsonb, 'A', '"Keep a low profile" is an idiom meaning to stay inconspicuous and avoid attracting attention.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Buod', 'Alin sa mga sumusunod ang pinakamainam na buod ng isang talatang tumatalakay sa kahalagahan ng pag-aaral ng maraming wika, kasama ang mga benepisyo nito sa utak at karera?', '[{"key":"A","text":"Ang pag-aaral ng maraming wika ay nakakatulong sa utak at nagbubukas ng mga oportunidad sa karera."},{"key":"B","text":"Mahirap matuto ng bagong wika."},{"key":"C","text":"Isang wika lamang ang dapat pag-aralan."},{"key":"D","text":"Ang wika ay walang kaugnayan sa karera."}]'::jsonb, 'A', 'Ang tamang buod ay dapat sumasaklaw sa parehong benepisyo sa utak at sa karera, na binanggit sa talata.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'reading-comprehension';

-- =========================================================
-- Language Proficiency (new)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar - Verb Tense', 'Choose the sentence that correctly completes the thought: "By the time the teacher arrived, the students ______ already finished the exam."', '[{"key":"A","text":"have"},{"key":"B","text":"had"},{"key":"C","text":"has"},{"key":"D","text":"having"}]'::jsonb, 'B', 'The past perfect "had finished" is needed to show an action completed before another past action (the teacher''s arrival).', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar - Pronoun-Antecedent Agreement', 'Choose the sentence that is grammatically correct according to standard formal usage.', '[{"key":"A","text":"Every student must bring their own laptop."},{"key":"B","text":"Every student must bring his or her own laptop."},{"key":"C","text":"Every student must bring they own laptop."},{"key":"D","text":"Every students must bring their own laptop."}]'::jsonb, 'B', 'In standard formal usage, the singular antecedent "every student" agrees with the singular pronoun phrase "his or her."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar - Preposition', 'Choose the sentence with the correct preposition.', '[{"key":"A","text":"She is afraid of spiders."},{"key":"B","text":"She is afraid on spiders."},{"key":"C","text":"She is afraid at spiders."},{"key":"D","text":"She is afraid to spiders."}]'::jsonb, 'A', 'The standard idiomatic preposition pairing is "afraid of," not "on," "at," or "to."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar - Conjunctions', 'Choose the correctly punctuated compound sentence.', '[{"key":"A","text":"I wanted to go to the party, but I had to study."},{"key":"B","text":"I wanted to go to the party but, I had to study."},{"key":"C","text":"I wanted to go to the party but I had to study,"},{"key":"D","text":"I wanted to go, to the party but I had to study."}]'::jsonb, 'A', 'A comma is placed before the coordinating conjunction "but" when it joins two independent clauses.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar - Active/Passive Voice', 'Choose the sentence written in the PASSIVE voice.', '[{"key":"A","text":"The committee approved the budget."},{"key":"B","text":"The budget was approved by the committee."},{"key":"C","text":"The committee will approve the budget."},{"key":"D","text":"The committee is approving the budget."}]'::jsonb, 'B', 'In option B, the subject "the budget" receives the action, and the verb form "was approved by" marks it as passive voice.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar - Modifiers', 'Identify the sentence with a dangling modifier.', '[{"key":"A","text":"Walking to school, the rain began to fall."},{"key":"B","text":"While walking to school, I felt the rain begin to fall."},{"key":"C","text":"As I walked to school, the rain began to fall."},{"key":"D","text":"The rain began to fall as I walked to school."}]'::jsonb, 'A', 'In option A, "walking to school" incorrectly modifies "the rain," since rain cannot walk; the intended subject (a person) is missing.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary - Synonym', 'Choose the word closest in meaning to "ubiquitous."', '[{"key":"A","text":"rare"},{"key":"B","text":"widespread"},{"key":"C","text":"expensive"},{"key":"D","text":"ancient"}]'::jsonb, 'B', '"Ubiquitous" means present or found everywhere, which is closest to "widespread."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary - Antonym', 'Choose the word most nearly OPPOSITE in meaning to "benevolent."', '[{"key":"A","text":"kind"},{"key":"B","text":"generous"},{"key":"C","text":"malevolent"},{"key":"D","text":"gentle"}]'::jsonb, 'C', '"Benevolent" means kind and well-meaning; "malevolent," meaning wishing harm on others, is its direct opposite.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary - Analogy', 'BOOK is to READ as FOOD is to ______.', '[{"key":"A","text":"eat"},{"key":"B","text":"cook"},{"key":"C","text":"hungry"},{"key":"D","text":"kitchen"}]'::jsonb, 'A', 'A book is the object of the action "read," just as food is the object of the action "eat."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Idiomatic Usage', 'Complete the idiom: "After studying all night, she decided to ______ before the exam."', '[{"key":"A","text":"hit the books"},{"key":"B","text":"hit the sack"},{"key":"C","text":"hit the road"},{"key":"D","text":"hit the ceiling"}]'::jsonb, 'B', '"Hit the sack" is an idiom meaning to go to sleep, which fits resting before the exam after a night of studying.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sentence Improvement', 'Identify the best revision of: "The reason why he failed is because he did not study."', '[{"key":"A","text":"The reason why he failed is because he did not study."},{"key":"B","text":"The reason he failed is that he did not study."},{"key":"C","text":"The reason why he failed is due to the fact he did not study."},{"key":"D","text":"He failed the reason being he did not study."}]'::jsonb, 'B', 'Option B avoids the redundant "reason why...is because" construction by using the concise, standard "the reason...is that."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Error Identification', 'Identify the part of the sentence that contains an error: "The team of researchers (A) were (B) excited to present (C) their findings (D) to the public."', '[{"key":"A","text":"(A) The team of researchers"},{"key":"B","text":"(B) were"},{"key":"C","text":"(C) present"},{"key":"D","text":"(D) to the public"}]'::jsonb, 'B', '"Team" functions as a singular collective noun here, so it requires the singular verb "was," not "were," making (B) the error.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Panlapi', 'Piliin ang tamang anyo ng salitang-ugat na "linis" upang mabuo ang pangungusap: "______ ni Maria ang bahay kahapon."', '[{"key":"A","text":"Nilinis"},{"key":"B","text":"Naglinis"},{"key":"C","text":"Linisin"},{"key":"D","text":"Maglilinis"}]'::jsonb, 'A', '"Nilinis" ang tamang anyo dahil ito ang aspektong pangnagdaan sa pokus ng layon ("ang bahay" ang binigyang-diin bilang layon).', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Pang-uri', 'Piliin ang pangungusap na may wastong gamit ng pang-uri.', '[{"key":"A","text":"Ang magandang bulaklak ay namumulaklak sa hardin."},{"key":"B","text":"Ang maganda bulaklak ay namumulaklak sa hardin."},{"key":"C","text":"Ang bulaklak magandang ay namumulaklak sa hardin."},{"key":"D","text":"Ang maganda na bulaklak ay namumulaklak sa hardin."}]'::jsonb, 'A', 'Kailangan ng ligature na "-ng" pagkatapos ng pang-uring nagtatapos sa patinig bago ang pangngalan, kaya "magandang bulaklak" ang wasto.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Pandiwa (Aspekto)', 'Anong aspekto ng pandiwa ang ginamit sa pangungusap na "Kumakain siya ng almusal ngayon"?', '[{"key":"A","text":"Pangnagdaan (Perfective)"},{"key":"B","text":"Kasalukuyan (Imperfective)"},{"key":"C","text":"Panghinaharap (Contemplative)"},{"key":"D","text":"Pawatas (Infinitive)"}]'::jsonb, 'B', 'Ang reduplikasyon ng unang pantig ng salitang-ugat ("kumakain") kasabay ng "ngayon" ay nagpapahiwatig ng aspektong kasalukuyan.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Kasingkahulugan', 'Piliin ang salitang kasingkahulugan ng "masipag."', '[{"key":"A","text":"tamad"},{"key":"B","text":"masikap"},{"key":"C","text":"matamlay"},{"key":"D","text":"mabagal"}]'::jsonb, 'B', '"Masikap" ay kasingkahulugan ng "masipag," dahil pareho itong tumutukoy sa taong may sigasig sa paggawa.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Kasalungat', 'Piliin ang salitang kasalungat ng "mapagbigay."', '[{"key":"A","text":"mapagmahal"},{"key":"B","text":"maramot"},{"key":"C","text":"matulungin"},{"key":"D","text":"magalang"}]'::jsonb, 'B', '"Mapagbigay" ay tumutukoy sa taong bukas-palad; ang kasalungat nito ay "maramot," na tumutukoy sa taong kuripot.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Sanhi at Bunga', 'Piliin ang angkop na pang-ugnay na nagpapakita ng sanhi at bunga: "Umulan nang malakas, ______ napigilan ang klase."', '[{"key":"A","text":"kaya"},{"key":"B","text":"ngunit"},{"key":"C","text":"at"},{"key":"D","text":"o"}]'::jsonb, 'A', '"Kaya" ay pang-ugnay na nagpapakita ng bunga o resulta ng isang sanhi, gaya ng pag-uulan na naging dahilan ng pagkakansela.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Punctuation', 'Choose the correctly punctuated sentence.', '[{"key":"A","text":"Please bring the following: pen, paper, and a calculator."},{"key":"B","text":"Please bring the following pen, paper, and a calculator."},{"key":"C","text":"Please bring the following; pen, paper, and a calculator."},{"key":"D","text":"Please bring the following, pen, paper, and a calculator."}]'::jsonb, 'A', 'A colon is the correct punctuation mark to introduce a list after an independent clause.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Capitalization', 'Choose the sentence with correct capitalization.', '[{"key":"A","text":"We visited the Philippines during Summer break."},{"key":"B","text":"We visited the philippines during summer break."},{"key":"C","text":"We visited the Philippines during summer break."},{"key":"D","text":"we visited the Philippines during Summer Break."}]'::jsonb, 'C', 'Proper nouns like "Philippines" are capitalized, but common nouns like seasons ("summer") are not, making option C correct.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Choice/Diction', 'Choose the word that best completes the sentence: "The scientist wanted to ______ her hypothesis through repeated experiments."', '[{"key":"A","text":"affect"},{"key":"B","text":"effect"},{"key":"C","text":"validate"},{"key":"D","text":"elicit"}]'::jsonb, 'C', '"Validate" fits the meaning of confirming or proving a hypothesis true through testing; the other words do not fit this context.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Spelling', 'Which word is spelled correctly?', '[{"key":"A","text":"Occassion"},{"key":"B","text":"Occasion"},{"key":"C","text":"Ocassion"},{"key":"D","text":"Occaision"}]'::jsonb, 'B', '"Occasion" has one "c" doubled and a single "s," which is the correct standard spelling.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sentence Structure - Fragments', 'Identify the sentence fragment.', '[{"key":"A","text":"Because the exam was postponed."},{"key":"B","text":"The exam was postponed."},{"key":"C","text":"The exam, which was postponed, starts next week."},{"key":"D","text":"Although difficult, she passed the exam."}]'::jsonb, 'A', 'Option A is a dependent clause with no independent clause attached, so it cannot stand alone as a complete sentence.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Filipino - Idyoma', 'Ano ang kahulugan ng idyomang "nagbibilang ng poste"?', '[{"key":"A","text":"walang trabaho o nangangalampag lang"},{"key":"B","text":"mayaman"},{"key":"C","text":"matulungin"},{"key":"D","text":"masipag magtrabaho"}]'::jsonb, 'A', 'Ang "nagbibilang ng poste" ay idyomang tumutukoy sa taong walang ginagawa o walang trabaho, katulad ng basta lumalakad nang walang layunin.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Transitional Words/Cohesion', 'Choose the transition word that best connects the sentences: "The typhoon caused massive flooding. ______, many families were forced to evacuate."', '[{"key":"A","text":"However"},{"key":"B","text":"As a result"},{"key":"C","text":"For example"},{"key":"D","text":"In contrast"}]'::jsonb, 'B', 'The evacuation is a consequence of the flooding, so "as a result" correctly signals a cause-and-effect relationship between the sentences.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'language-proficiency';

-- =========================================================
-- Mathematics (new)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Simplifying Expressions', 'Simplify: 3(x + 4) - 2(x - 1)', '[{"key":"A","text":"x + 14"},{"key":"B","text":"x + 10"},{"key":"C","text":"5x + 10"},{"key":"D","text":"x - 14"}]'::jsonb, 'A', '3(x+4) - 2(x-1) = 3x + 12 - 2x + 2 = x + 14.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Systems of Equations', 'Solve the system: x + y = 10 and x - y = 2. What is (x, y)?', '[{"key":"A","text":"(6, 4)"},{"key":"B","text":"(4, 6)"},{"key":"C","text":"(5, 5)"},{"key":"D","text":"(8, 2)"}]'::jsonb, 'A', 'Adding both equations: 2x = 12, so x = 6. Substituting into x + y = 10 gives y = 4.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Inequalities', 'Solve for x: 2x - 3 > 7', '[{"key":"A","text":"x > 5"},{"key":"B","text":"x < 5"},{"key":"C","text":"x > 2"},{"key":"D","text":"x > -5"}]'::jsonb, 'A', 'Add 3 to both sides: 2x > 10. Divide by 2: x > 5.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Exponents', 'Simplify: (x^3)(x^5)', '[{"key":"A","text":"x^8"},{"key":"B","text":"x^15"},{"key":"C","text":"x^2"},{"key":"D","text":"2x^8"}]'::jsonb, 'A', 'When multiplying powers with the same base, add the exponents: x^3 * x^5 = x^(3+5) = x^8.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra - Factoring', 'Factor completely: x^2 - 9', '[{"key":"A","text":"(x - 3)(x + 3)"},{"key":"B","text":"(x - 9)(x + 1)"},{"key":"C","text":"(x - 3)^2"},{"key":"D","text":"(x + 9)(x - 1)"}]'::jsonb, 'A', 'x^2 - 9 is a difference of squares: x^2 - 3^2 = (x - 3)(x + 3).', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Circles', 'A circle has a radius of 7 cm. Using pi = 22/7, what is its circumference?', '[{"key":"A","text":"44 cm"},{"key":"B","text":"22 cm"},{"key":"C","text":"154 cm"},{"key":"D","text":"49 cm"}]'::jsonb, 'A', 'Circumference = 2 * pi * r = 2 * (22/7) * 7 = 44 cm.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Volume', 'A rectangular prism has a length of 5 units, a width of 4 units, and a height of 3 units. What is its volume?', '[{"key":"A","text":"60 cubic units"},{"key":"B","text":"12 cubic units"},{"key":"C","text":"47 cubic units"},{"key":"D","text":"120 cubic units"}]'::jsonb, 'A', 'Volume of a rectangular prism = length x width x height = 5 x 4 x 3 = 60 cubic units.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Angles', 'Two angles are supplementary. One angle measures 65 degrees. What is the measure of the other angle?', '[{"key":"A","text":"115 degrees"},{"key":"B","text":"25 degrees"},{"key":"C","text":"35 degrees"},{"key":"D","text":"295 degrees"}]'::jsonb, 'A', 'Supplementary angles sum to 180 degrees, so the other angle = 180 - 65 = 115 degrees.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry - Perimeter', 'An isosceles triangle has two equal sides of 8 cm each and a base of 5 cm. What is its perimeter?', '[{"key":"A","text":"21 cm"},{"key":"B","text":"16 cm"},{"key":"C","text":"13 cm"},{"key":"D","text":"26 cm"}]'::jsonb, 'A', 'Perimeter = sum of all sides = 8 + 8 + 5 = 21 cm.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problems - Mixture', 'How many liters of a 20% salt solution must be mixed with 10 liters of a 50% salt solution to produce a 30% salt solution?', '[{"key":"A","text":"20 liters"},{"key":"B","text":"10 liters"},{"key":"C","text":"15 liters"},{"key":"D","text":"25 liters"}]'::jsonb, 'A', 'Let x = liters of 20% solution. 0.20x + 0.50(10) = 0.30(x + 10). Solving: 0.20x + 5 = 0.30x + 3, so 2 = 0.10x, giving x = 20 liters.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problems - Age', 'Ana is twice as old as Ben. In 5 years, the sum of their ages will be 40. What is Ben''s current age?', '[{"key":"A","text":"10 years old"},{"key":"B","text":"15 years old"},{"key":"C","text":"20 years old"},{"key":"D","text":"5 years old"}]'::jsonb, 'A', 'Let Ben''s age = b, so Ana''s age = 2b. In 5 years: (b+5) + (2b+5) = 40, so 3b + 10 = 40, 3b = 30, b = 10.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problems - Distance/Speed/Time', 'A jeepney travels 90 km in 1.5 hours. What is its average speed?', '[{"key":"A","text":"60 km/h"},{"key":"B","text":"45 km/h"},{"key":"C","text":"135 km/h"},{"key":"D","text":"90 km/h"}]'::jsonb, 'A', 'Speed = distance / time = 90 km / 1.5 h = 60 km/h.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Statistics - Median', 'Find the median of the data set: 4, 8, 15, 16, 23, 42', '[{"key":"A","text":"15.5"},{"key":"B","text":"15"},{"key":"C","text":"16"},{"key":"D","text":"18"}]'::jsonb, 'A', 'With 6 values, the median is the average of the two middle values (15 and 16): (15+16)/2 = 15.5.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Statistics - Mode', 'Find the mode of the data set: 3, 7, 7, 9, 10, 7, 12', '[{"key":"A","text":"7"},{"key":"B","text":"9"},{"key":"C","text":"3"},{"key":"D","text":"10"}]'::jsonb, 'A', 'The mode is the value that appears most frequently. Here, 7 appears three times, more than any other value.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Probability - Simple', 'A standard six-sided die is rolled once. What is the probability of getting an even number?', '[{"key":"A","text":"1/2"},{"key":"B","text":"1/3"},{"key":"C","text":"1/6"},{"key":"D","text":"2/3"}]'::jsonb, 'A', 'There are 3 even numbers (2, 4, 6) out of 6 possible outcomes, so P(even) = 3/6 = 1/2.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Probability - Combined Events', 'A bag contains 5 red marbles and 3 blue marbles. If two marbles are drawn without replacement, what is the probability that both are red?', '[{"key":"A","text":"5/14"},{"key":"B","text":"5/8"},{"key":"C","text":"15/28"},{"key":"D","text":"1/2"}]'::jsonb, 'A', 'P(both red) = (5/8) x (4/7) = 20/56 = 5/14.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Functions - Evaluating', 'If f(x) = 2x^2 - 3x + 1, what is f(3)?', '[{"key":"A","text":"10"},{"key":"B","text":"16"},{"key":"C","text":"8"},{"key":"D","text":"12"}]'::jsonb, 'A', 'f(3) = 2(3)^2 - 3(3) + 1 = 2(9) - 9 + 1 = 18 - 9 + 1 = 10.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Functions - Domain', 'What is the domain of f(x) = 1 / (x - 4)?', '[{"key":"A","text":"All real numbers except 4"},{"key":"B","text":"All real numbers except 0"},{"key":"C","text":"All real numbers"},{"key":"D","text":"All real numbers except -4"}]'::jsonb, 'A', 'The function is undefined when the denominator equals zero, i.e., when x = 4, so the domain excludes 4.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Theory - LCM', 'What is the least common multiple (LCM) of 12 and 18?', '[{"key":"A","text":"36"},{"key":"B","text":"6"},{"key":"C","text":"216"},{"key":"D","text":"72"}]'::jsonb, 'A', '12 = 2^2 x 3 and 18 = 2 x 3^2. The LCM takes the highest powers of each prime: 2^2 x 3^2 = 36.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Theory - GCF', 'What is the greatest common factor (GCF) of 24 and 36?', '[{"key":"A","text":"12"},{"key":"B","text":"6"},{"key":"C","text":"4"},{"key":"D","text":"72"}]'::jsonb, 'A', '24 = 2^3 x 3 and 36 = 2^2 x 3^2. The GCF takes the lowest powers of shared primes: 2^2 x 3 = 12.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Percentage', 'A shirt originally priced at 800 pesos is discounted by 25%. What is the sale price?', '[{"key":"A","text":"600 pesos"},{"key":"B","text":"200 pesos"},{"key":"C","text":"700 pesos"},{"key":"D","text":"750 pesos"}]'::jsonb, 'A', 'A 25% discount means paying 75% of the original price: 800 x 0.75 = 600 pesos.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Ratio', 'The ratio of boys to girls in a class is 3:5. If there are 24 boys, how many girls are there?', '[{"key":"A","text":"40"},{"key":"B","text":"32"},{"key":"C","text":"15"},{"key":"D","text":"45"}]'::jsonb, 'A', 'Since 24 boys corresponds to 3 parts, each part = 24/3 = 8. Girls = 5 parts = 5 x 8 = 40.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sequences - Arithmetic', 'Find the 10th term of the arithmetic sequence: 4, 7, 10, 13, ...', '[{"key":"A","text":"31"},{"key":"B","text":"30"},{"key":"C","text":"34"},{"key":"D","text":"28"}]'::jsonb, 'A', 'a_n = a_1 + (n-1)d = 4 + (10-1)(3) = 4 + 27 = 31.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sequences - Geometric', 'Find the 6th term of the geometric sequence: 3, 6, 12, 24, ...', '[{"key":"A","text":"96"},{"key":"B","text":"48"},{"key":"C","text":"192"},{"key":"D","text":"64"}]'::jsonb, 'A', 'a_n = a_1 x r^(n-1) = 3 x 2^5 = 3 x 32 = 96.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Trigonometry - Angle of Elevation', 'A ladder leans against a wall, making a 60-degree angle of elevation with the ground. If the ladder is 10 meters long, how high up the wall does it reach (in terms of the exact value)?', '[{"key":"A","text":"5 sqrt(3) meters (about 8.66 m)"},{"key":"B","text":"5 meters"},{"key":"C","text":"10 meters"},{"key":"D","text":"5 sqrt(2) meters"}]'::jsonb, 'A', 'height = ladder length x sin(60 deg) = 10 x (sqrt(3)/2) = 5 sqrt(3), which is approximately 8.66 meters.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'mathematics';

-- =========================================================
-- Science (new)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Photosynthesis', 'Which two substances are the primary raw materials that plants use during photosynthesis to produce glucose?', '[{"key":"A","text":"Carbon dioxide and water"},{"key":"B","text":"Oxygen and glucose"},{"key":"C","text":"Nitrogen and water"},{"key":"D","text":"Carbon dioxide and oxygen"}]'::jsonb, 'A', 'Photosynthesis uses carbon dioxide and water, along with light energy, to produce glucose and oxygen.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Circulatory System', 'Which chamber of the human heart pumps oxygenated blood to the rest of the body?', '[{"key":"A","text":"Left ventricle"},{"key":"B","text":"Right ventricle"},{"key":"C","text":"Left atrium"},{"key":"D","text":"Right atrium"}]'::jsonb, 'A', 'The left ventricle has the thickest muscular wall and pumps oxygen-rich blood out through the aorta to the rest of the body.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Taxonomy', 'What is the correct order of taxonomic classification from broadest to most specific?', '[{"key":"A","text":"Kingdom, Phylum, Class, Order, Family, Genus, Species"},{"key":"B","text":"Species, Genus, Family, Order, Class, Phylum, Kingdom"},{"key":"C","text":"Kingdom, Class, Phylum, Family, Order, Genus, Species"},{"key":"D","text":"Phylum, Kingdom, Class, Order, Family, Genus, Species"}]'::jsonb, 'A', 'The standard biological classification hierarchy from broadest to most specific is Kingdom, Phylum, Class, Order, Family, Genus, Species.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Meiosis', 'Which process results in four genetically distinct daughter cells, each with half the chromosome number of the parent cell?', '[{"key":"A","text":"Mitosis"},{"key":"B","text":"Meiosis"},{"key":"C","text":"Binary fission"},{"key":"D","text":"Budding"}]'::jsonb, 'B', 'Meiosis is a two-stage division process that produces four haploid daughter cells, each genetically distinct due to crossing over and independent assortment.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Homeostasis', 'Sweating in humans during hot weather is an example of which biological process?', '[{"key":"A","text":"Homeostasis"},{"key":"B","text":"Osmosis"},{"key":"C","text":"Photosynthesis"},{"key":"D","text":"Fermentation"}]'::jsonb, 'A', 'Sweating helps regulate and maintain a stable internal body temperature, which is an example of homeostasis.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Atomic Structure', 'An atom of an element has 17 protons and 18 neutrons. What is its mass number?', '[{"key":"A","text":"35"},{"key":"B","text":"17"},{"key":"C","text":"18"},{"key":"D","text":"1"}]'::jsonb, 'A', 'Mass number = number of protons + number of neutrons = 17 + 18 = 35.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - States of Matter', 'The process where a gas changes directly into a solid without passing through the liquid phase is called', '[{"key":"A","text":"Deposition"},{"key":"B","text":"Sublimation"},{"key":"C","text":"Condensation"},{"key":"D","text":"Evaporation"}]'::jsonb, 'A', 'Deposition is the phase change from gas directly to solid, the reverse of sublimation (solid to gas).', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - pH', 'A solution with a pH of 3 is best described as', '[{"key":"A","text":"Strongly acidic"},{"key":"B","text":"Slightly acidic"},{"key":"C","text":"Neutral"},{"key":"D","text":"Basic"}]'::jsonb, 'A', 'The pH scale runs from 0 to 14, with 7 being neutral; a pH of 3 is well below 7, indicating a strongly acidic solution.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Balancing Equations', 'Which set of coefficients correctly balances the equation: N2 + H2 -> NH3?', '[{"key":"A","text":"1, 3, 2"},{"key":"B","text":"2, 3, 1"},{"key":"C","text":"1, 2, 3"},{"key":"D","text":"2, 1, 3"}]'::jsonb, 'A', 'The balanced equation is N2 + 3H2 -> 2NH3, giving 2 nitrogen and 6 hydrogen atoms on each side.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Mixtures and Solutions', 'Saltwater is an example of what kind of mixture?', '[{"key":"A","text":"Homogeneous mixture"},{"key":"B","text":"Heterogeneous mixture"},{"key":"C","text":"Pure compound"},{"key":"D","text":"Colloid"}]'::jsonb, 'A', 'Saltwater has a uniform composition throughout, since the salt is fully dissolved, making it a homogeneous mixture (solution).', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Energy', 'A ball held at a height above the ground possesses what form of energy due to its position?', '[{"key":"A","text":"Gravitational potential energy"},{"key":"B","text":"Kinetic energy"},{"key":"C","text":"Thermal energy"},{"key":"D","text":"Chemical energy"}]'::jsonb, 'A', 'Energy stored due to an object''s position relative to a gravitational field is gravitational potential energy.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Waves', 'What is the term for the distance between two consecutive crests of a wave?', '[{"key":"A","text":"Wavelength"},{"key":"B","text":"Amplitude"},{"key":"C","text":"Frequency"},{"key":"D","text":"Period"}]'::jsonb, 'A', 'Wavelength is defined as the distance between two successive identical points on a wave, such as two consecutive crests.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Electricity', 'In a series circuit with a 12 V battery and two identical 4-ohm resistors, what is the total current flowing through the circuit?', '[{"key":"A","text":"1.5 A"},{"key":"B","text":"3 A"},{"key":"C","text":"0.5 A"},{"key":"D","text":"6 A"}]'::jsonb, 'A', 'In series, total resistance = 4 + 4 = 8 ohms. By Ohm''s law, I = V/R = 12/8 = 1.5 A.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Pressure', 'Pressure is defined as force divided by what quantity?', '[{"key":"A","text":"Area"},{"key":"B","text":"Volume"},{"key":"C","text":"Mass"},{"key":"D","text":"Distance"}]'::jsonb, 'A', 'Pressure is defined as P = F/A, force applied per unit area.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Simple Machines', 'A lever is used to lift a 100 N load using 25 N of effort. What is its mechanical advantage?', '[{"key":"A","text":"4"},{"key":"B","text":"25"},{"key":"C","text":"100"},{"key":"D","text":"0.25"}]'::jsonb, 'A', 'Mechanical advantage = load / effort = 100 / 25 = 4.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Rock Cycle', 'Which type of rock forms from the cooling and solidification of molten magma or lava?', '[{"key":"A","text":"Igneous rock"},{"key":"B","text":"Sedimentary rock"},{"key":"C","text":"Metamorphic rock"},{"key":"D","text":"Organic rock"}]'::jsonb, 'A', 'Igneous rock forms when molten magma or lava cools and solidifies, either underground or on the surface.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Water Cycle', 'The process by which water vapor turns into liquid water, forming clouds, is called', '[{"key":"A","text":"Condensation"},{"key":"B","text":"Evaporation"},{"key":"C","text":"Precipitation"},{"key":"D","text":"Transpiration"}]'::jsonb, 'A', 'Condensation is the change of water vapor into liquid water droplets, which is how clouds form.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Weather and Climate', 'What is the primary difference between weather and climate?', '[{"key":"A","text":"Weather is short-term daily atmospheric conditions, while climate is the long-term average pattern of weather in a region"},{"key":"B","text":"Weather and climate mean exactly the same thing"},{"key":"C","text":"Climate refers only to temperature, while weather refers only to rainfall"},{"key":"D","text":"Weather occurs only in the tropics, while climate occurs everywhere"}]'::jsonb, 'A', 'Weather describes short-term atmospheric conditions, while climate describes the long-term average weather pattern of a region over many years.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Solar System', 'Which planet in the solar system is known as the "Red Planet" due to iron oxide on its surface?', '[{"key":"A","text":"Mars"},{"key":"B","text":"Venus"},{"key":"C","text":"Jupiter"},{"key":"D","text":"Mercury"}]'::jsonb, 'A', 'Mars is called the "Red Planet" because iron oxide (rust) on its surface gives it a reddish color.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Ecology (Energy Pyramid)', 'In an energy pyramid, approximately what percentage of energy is transferred from one trophic level to the next?', '[{"key":"A","text":"About 10%"},{"key":"B","text":"About 50%"},{"key":"C","text":"About 90%"},{"key":"D","text":"About 1%"}]'::jsonb, 'A', 'On average, only about 10% of energy is transferred to the next trophic level, with the rest lost mainly as heat; this is known as the ten percent rule.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Periodic Table Trends', 'As you move from left to right across a period on the periodic table, atomic radius generally', '[{"key":"A","text":"Decreases"},{"key":"B","text":"Increases"},{"key":"C","text":"Stays the same"},{"key":"D","text":"Becomes zero"}]'::jsonb, 'A', 'Moving left to right across a period, increasing nuclear charge pulls electrons closer to the nucleus, causing atomic radius to generally decrease.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Sound Waves', 'Sound waves are classified as what type of wave, requiring a medium such as air or water to travel through?', '[{"key":"A","text":"Mechanical waves"},{"key":"B","text":"Electromagnetic waves"},{"key":"C","text":"Transverse light waves"},{"key":"D","text":"Gravitational waves"}]'::jsonb, 'A', 'Sound waves are mechanical waves that require a physical medium (like air, water, or solids) to propagate, unlike electromagnetic waves.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Evolution', 'Charles Darwin''s theory of evolution proposes that species change over time primarily through which mechanism?', '[{"key":"A","text":"Natural selection"},{"key":"B","text":"Spontaneous generation"},{"key":"C","text":"Use and disuse of organs"},{"key":"D","text":"Divine creation"}]'::jsonb, 'A', 'Darwin proposed that natural selection, the survival and reproduction of individuals best adapted to their environment, drives evolutionary change over time.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Layers of the Earth', 'Which layer of the Earth is primarily composed of molten and semi-molten rock and lies directly beneath the crust?', '[{"key":"A","text":"Mantle"},{"key":"B","text":"Inner core"},{"key":"C","text":"Outer core"},{"key":"D","text":"Lithosphere only"}]'::jsonb, 'A', 'The mantle lies directly beneath the crust and consists of hot, semi-molten to molten rock that can flow slowly over geologic time.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Digestive System', 'Which organ primarily absorbs digested nutrients into the bloodstream?', '[{"key":"A","text":"Small intestine"},{"key":"B","text":"Stomach"},{"key":"C","text":"Large intestine"},{"key":"D","text":"Esophagus"}]'::jsonb, 'A', 'The small intestine, with its villi and microvilli, is the primary site where digested nutrients are absorbed into the bloodstream.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'up' and s.slug = 'science';
