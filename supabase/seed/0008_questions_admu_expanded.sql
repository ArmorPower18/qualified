-- ACET (Ateneo College Entrance Test) practice questions — EXPANSION SET.
-- Adds new original questions on top of 0002_questions_admu.sql to broaden topic
-- coverage per subject for verbal-ability, mathematical-ability, science, and
-- essay-writing. All questions below are original, AI-drafted, and written to be
-- representative of publicly reported ACET content areas and difficulty — none are
-- copied from any reviewer material found online. None duplicate or closely mirror
-- any question already present in 0002_questions_admu.sql.

-- =========================================================
-- VERBAL ABILITY (new)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word that is closest in meaning to "BENEVOLENT."', '[{"key":"A","text":"Kind"},{"key":"B","text":"Wealthy"},{"key":"C","text":"Cunning"},{"key":"D","text":"Reserved"}]'::jsonb, 'A', '"Benevolent" means well-meaning and kindly. "Kind" is the closest synonym among the choices; the others describe unrelated traits.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word that is most nearly OPPOSITE in meaning to "TRANQUIL."', '[{"key":"A","text":"Serene"},{"key":"B","text":"Chaotic"},{"key":"C","text":"Quiet"},{"key":"D","text":"Distant"}]'::jsonb, 'B', '"Tranquil" means calm and peaceful. "Chaotic" (disordered, turbulent) is its clearest opposite among the choices.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'BIRD is to NEST as BEE is to ____.', '[{"key":"A","text":"Flower"},{"key":"B","text":"Hive"},{"key":"C","text":"Honey"},{"key":"D","text":"Wing"}]'::jsonb, 'B', 'A bird lives and shelters in a nest, just as a bee lives and shelters in a hive. The relationship is "animal to its dwelling."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'DOCTOR is to PATIENT as TEACHER is to ____.', '[{"key":"A","text":"School"},{"key":"B","text":"Classroom"},{"key":"C","text":"Student"},{"key":"D","text":"Lesson"}]'::jsonb, 'C', 'A doctor provides professional care to a patient, just as a teacher provides instruction to a student. The relationship is "professional to the person they serve."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'OCEAN is to WAVE as DESERT is to ____.', '[{"key":"A","text":"Cactus"},{"key":"B","text":"Dune"},{"key":"C","text":"Oasis"},{"key":"D","text":"Heat"}]'::jsonb, 'B', 'A wave is a characteristic surface formation of an ocean, just as a dune is a characteristic surface formation of a desert. The relationship is "landscape to its typical formation."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'THERMOMETER is to TEMPERATURE as SCALE is to ____.', '[{"key":"A","text":"Weight"},{"key":"B","text":"Height"},{"key":"C","text":"Balance"},{"key":"D","text":"Size"}]'::jsonb, 'A', 'A thermometer is an instrument that measures temperature, just as a scale is an instrument that measures weight. The relationship is "instrument to the quantity it measures."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word that best defines "EPHEMERAL."', '[{"key":"A","text":"Everlasting"},{"key":"B","text":"Short-lived"},{"key":"C","text":"Mysterious"},{"key":"D","text":"Powerful"}]'::jsonb, 'B', '"Ephemeral" describes something that lasts for a very short time, making "short-lived" the correct definition.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word that is most nearly OPPOSITE in meaning to "METICULOUS."', '[{"key":"A","text":"Thorough"},{"key":"B","text":"Careless"},{"key":"C","text":"Precise"},{"key":"D","text":"Patient"}]'::jsonb, 'B', '"Meticulous" means showing great attention to detail. "Careless" (lacking attention or care) is its clearest opposite among the choices.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Reading Comprehension', 'Passage: "Coral reefs cover less than one percent of the ocean floor, yet they support roughly a quarter of all known marine species. Rising ocean temperatures, however, cause corals to expel the algae living in their tissues, a process known as bleaching, which can lead to widespread coral death if prolonged." What does the passage suggest about coral bleaching?', '[{"key":"A","text":"It is caused primarily by overfishing."},{"key":"B","text":"It is a natural and harmless seasonal cycle."},{"key":"C","text":"It is linked to rising ocean temperatures and can be fatal to coral."},{"key":"D","text":"It only affects algae, not coral itself."}]'::jsonb, 'C', 'The passage directly states that rising ocean temperatures cause bleaching, and that prolonged bleaching "can lead to widespread coral death," making option C the accurate restatement.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Reading Comprehension', 'Passage: "The printing press, introduced in Europe in the fifteenth century, did more than speed up the copying of books. By making texts cheaper and more widely available, it accelerated the spread of literacy and gave rise to new forms of public debate that had previously been limited to a small, educated elite." According to the passage, the printing press''s most significant effect was that it ____.', '[{"key":"A","text":"Made books more decorative"},{"key":"B","text":"Broadened access to information and public discourse"},{"key":"C","text":"Eliminated the need for handwritten manuscripts"},{"key":"D","text":"Was invented by an educated elite"}]'::jsonb, 'B', 'The passage emphasizes that the press made texts "cheaper and more widely available," spreading literacy and enabling public debate beyond the elite — this is best captured by option B.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Reading Comprehension', 'Passage: "Unlike most mammals, elephants continue growing new sets of molars throughout their lives, cycling through up to six sets. Once the final set wears down, an elephant can no longer chew food efficiently, a major factor limiting their lifespan in the wild." Based on the passage, an elephant''s lifespan in the wild is most directly limited by ____.', '[{"key":"A","text":"Predators hunting older elephants"},{"key":"B","text":"The number of times it can reproduce"},{"key":"C","text":"The wearing down of its final set of molars"},{"key":"D","text":"A lack of new mammal species nearby"}]'::jsonb, 'C', 'The passage states that once the final set of molars wears down, the elephant can no longer chew efficiently and identifies this as "a major factor limiting their lifespan," directly supporting option C.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar', 'Choose the sentence that is grammatically correct.', '[{"key":"A","text":"Each of the students are required to submit their essay by Friday."},{"key":"B","text":"Each of the students is required to submit his or her essay by Friday."},{"key":"C","text":"Each of the students were required to submit their essay by Friday."},{"key":"D","text":"Each of the students has submit their essay by Friday."}]'::jsonb, 'B', '"Each" is singular and requires a singular verb ("is") and, in formally correct usage, a singular pronoun ("his or her"), making option B the grammatically precise choice.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar', 'Choose the sentence with correct pronoun usage.', '[{"key":"A","text":"The award was given to my sister and I."},{"key":"B","text":"The award was given to my sister and me."},{"key":"C","text":"The award was given to my sister and myself."},{"key":"D","text":"The award was given to I and my sister."}]'::jsonb, 'B', 'As the object of the preposition "to," the pronoun must be in the objective case ("me"), not the subjective ("I") or reflexive ("myself") case, making option B correct.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sentence Completion', 'The scientist''s hypothesis was so ____ that even skeptical colleagues found it difficult to dispute.', '[{"key":"A","text":"vague"},{"key":"B","text":"well-supported"},{"key":"C","text":"outdated"},{"key":"D","text":"irrelevant"}]'::jsonb, 'B', 'The sentence states that skeptics found the hypothesis "difficult to dispute," which logically follows only if the hypothesis was strong or "well-supported," not vague, outdated, or irrelevant.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sentence Completion', 'The negotiations, once thought to be ____, collapsed abruptly after both sides refused to make any further ____.', '[{"key":"A","text":"doomed . . demands"},{"key":"B","text":"promising . . concessions"},{"key":"C","text":"pointless . . apologies"},{"key":"D","text":"hostile . . threats"}]'::jsonb, 'B', 'The word "once" signals a contrast with the outcome. Negotiations seen as "promising" that then "collapsed" makes sense if both sides stopped offering "concessions," the compromises needed to keep talks alive.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'AUTHOR is to BOOK as COMPOSER is to ____.', '[{"key":"A","text":"Orchestra"},{"key":"B","text":"Symphony"},{"key":"C","text":"Piano"},{"key":"D","text":"Concert"}]'::jsonb, 'B', 'An author creates a book, just as a composer creates a symphony. The relationship is "creator to the work they produce."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word that is closest in meaning to "GARRULOUS."', '[{"key":"A","text":"Talkative"},{"key":"B","text":"Shy"},{"key":"C","text":"Angry"},{"key":"D","text":"Wise"}]'::jsonb, 'A', '"Garrulous" describes someone who talks excessively, especially about trivial matters, making "talkative" the closest synonym.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'FISH is to SCHOOL as WOLF is to ____.', '[{"key":"A","text":"Den"},{"key":"B","text":"Pack"},{"key":"C","text":"Herd"},{"key":"D","text":"Litter"}]'::jsonb, 'B', 'A group of fish is called a "school," just as a group of wolves is called a "pack." The relationship is "animal to the name of its group."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary (Idiom)', 'What does it mean when someone says they are ready "to bite the bullet"?', '[{"key":"A","text":"To avoid a difficult situation entirely"},{"key":"B","text":"To face a difficult or unpleasant task with resolve"},{"key":"C","text":"To argue aggressively with someone"},{"key":"D","text":"To celebrate a hard-won victory"}]'::jsonb, 'B', 'The idiom "to bite the bullet" means to bravely endure a painful or unpleasant situation that cannot be avoided, matching option B.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word that is closest in meaning to "OBSTINATE."', '[{"key":"A","text":"Stubborn"},{"key":"B","text":"Generous"},{"key":"C","text":"Curious"},{"key":"D","text":"Nervous"}]'::jsonb, 'A', '"Obstinate" describes someone who is stubbornly refusing to change their mind, which is closest in meaning to "stubborn."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'KNIFE is to CUT as HAMMER is to ____.', '[{"key":"A","text":"Pound"},{"key":"B","text":"Handle"},{"key":"C","text":"Nail"},{"key":"D","text":"Build"}]'::jsonb, 'A', 'A knife''s primary function is to cut, just as a hammer''s primary function is to pound (strike). The relationship is "tool to the action it performs."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Reading Comprehension', 'Passage: "Microplastics, fragments smaller than five millimeters, have been found in ocean water, table salt, and even human blood. While their long-term health effects remain under study, researchers agree that their sheer prevalence in the environment warrants closer scientific attention." The passage implies that researchers are most certain about which of the following?', '[{"key":"A","text":"Microplastics cause serious long-term illness in humans."},{"key":"B","text":"Microplastics are present in many parts of the environment and deserve further study."},{"key":"C","text":"Microplastics are harmless and require no further research."},{"key":"D","text":"Microplastics are found only in ocean water."}]'::jsonb, 'B', 'The passage says the long-term health effects "remain under study" (uncertain) but that researchers "agree" the prevalence "warrants closer scientific attention" — this certainty matches option B, not the overstated claims in A, C, or D.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar', 'Choose the sentence with correct punctuation.', '[{"key":"A","text":"I bought apples, bananas, and, oranges."},{"key":"B","text":"I bought apples bananas, and oranges."},{"key":"C","text":"I bought apples, bananas, and oranges."},{"key":"D","text":"I bought, apples, bananas and oranges."}]'::jsonb, 'C', 'A comma correctly separates each item in a list of three or more, including before the conjunction "and" (the Oxford comma), and no comma is needed anywhere else, making option C correctly punctuated.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word that is closest in meaning to "PRUDENT."', '[{"key":"A","text":"Reckless"},{"key":"B","text":"Wise and cautious"},{"key":"C","text":"Wealthy"},{"key":"D","text":"Charming"}]'::jsonb, 'B', '"Prudent" describes someone who acts with careful, sensible judgment, especially about practical matters, closest in meaning to "wise and cautious."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'LIBRARY is to BOOKS as MUSEUM is to ____.', '[{"key":"A","text":"Artifacts"},{"key":"B","text":"Visitors"},{"key":"C","text":"Tickets"},{"key":"D","text":"Curators"}]'::jsonb, 'A', 'A library is a place that houses and organizes books, just as a museum is a place that houses and organizes artifacts. The relationship is "institution to the items it collects."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sentence Completion', 'Although the intern was ____ about presenting to senior executives, her ____ preparation ensured the meeting went smoothly.', '[{"key":"A","text":"excited . . rushed"},{"key":"B","text":"anxious . . thorough"},{"key":"C","text":"confident . . nonexistent"},{"key":"D","text":"indifferent . . lazy"}]'::jsonb, 'B', '"Although" signals a contrast between the intern''s feeling and the outcome. Being "anxious" about the task but having "thorough" preparation logically explains why the meeting still went smoothly.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'verbal-ability';

-- =========================================================
-- MATHEMATICAL ABILITY (new)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra', 'If 2x + 3y = 12 and x = 3, what is the value of y?', '[{"key":"A","text":"1"},{"key":"B","text":"2"},{"key":"C","text":"3"},{"key":"D","text":"4"}]'::jsonb, 'B', 'Substitute x = 3: 2(3) + 3y = 12, so 6 + 3y = 12, 3y = 6, y = 2.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Series', 'What number completes the series? 2, 6, 12, 20, 30, ____', '[{"key":"A","text":"36"},{"key":"B","text":"40"},{"key":"C","text":"42"},{"key":"D","text":"44"}]'::jsonb, 'C', 'The differences between consecutive terms increase by 2 each time: +4, +6, +8, +10, +12. So 30 + 12 = 42.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Coding-Decoding', 'In a certain code, each letter is written as its position number in the alphabet, so DOG is written as 4-15-7. How is CAT written in this code?', '[{"key":"A","text":"3-1-20"},{"key":"B","text":"3-1-19"},{"key":"C","text":"2-1-20"},{"key":"D","text":"3-2-20"}]'::jsonb, 'A', 'C is the 3rd letter, A is the 1st letter, and T is the 20th letter of the alphabet, so CAT is written as 3-1-20.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry', 'A triangle has a base of 10 cm and a height of 6 cm. What is its area?', '[{"key":"A","text":"16 cm^2"},{"key":"B","text":"30 cm^2"},{"key":"C","text":"60 cm^2"},{"key":"D","text":"32 cm^2"}]'::jsonb, 'B', 'Area of a triangle = 1/2 * base * height = 1/2 * 10 * 6 = 30 cm^2.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem', 'Five years ago, Maria was three times as old as Jon. If Jon is now 12 years old, how old was Maria five years ago?', '[{"key":"A","text":"21"},{"key":"B","text":"24"},{"key":"C","text":"26"},{"key":"D","text":"18"}]'::jsonb, 'A', 'Five years ago, Jon was 12 - 5 = 7 years old. Since Maria was three times as old, Maria was 3 * 7 = 21 years old at that time.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem', 'A jacket originally priced at 1500 pesos is discounted by 15%, and then an additional 10% is taken off the already-discounted price during a flash sale. What is the final price?', '[{"key":"A","text":"1125.00 pesos"},{"key":"B","text":"1147.50 pesos"},{"key":"C","text":"1200.00 pesos"},{"key":"D","text":"1275.00 pesos"}]'::jsonb, 'B', 'After the first discount: 1500 * 0.85 = 1275. After the second discount: 1275 * 0.90 = 1147.50 pesos.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem', 'The ratio of boys to girls in a class is 3:5. If there are 40 students in total, how many are girls?', '[{"key":"A","text":"15"},{"key":"B","text":"20"},{"key":"C","text":"24"},{"key":"D","text":"25"}]'::jsonb, 'D', 'The ratio 3:5 splits the class into 8 equal parts. Each part = 40 / 8 = 5 students. Girls = 5 parts * 5 = 25.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Probability', 'A fair six-sided die is rolled once. What is the probability of rolling a number greater than 4?', '[{"key":"A","text":"1/6"},{"key":"B","text":"1/3"},{"key":"C","text":"1/2"},{"key":"D","text":"2/3"}]'::jsonb, 'B', 'Numbers greater than 4 on a six-sided die are 5 and 6, giving 2 favorable outcomes out of 6 total, or 2/6 = 1/3.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Statistics', 'The average of five numbers is 18. If one number is removed, the average of the remaining four numbers is 20. What was the value of the number that was removed?', '[{"key":"A","text":"8"},{"key":"B","text":"10"},{"key":"C","text":"12"},{"key":"D","text":"14"}]'::jsonb, 'B', 'Sum of the original five numbers = 18 * 5 = 90. Sum of the remaining four = 20 * 4 = 80. Removed number = 90 - 80 = 10.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Series', 'What number completes the series? 3, 9, 27, 81, ____', '[{"key":"A","text":"162"},{"key":"B","text":"189"},{"key":"C","text":"216"},{"key":"D","text":"243"}]'::jsonb, 'D', 'This is a geometric series where each term is multiplied by 3. 81 * 3 = 243.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Letter Series', 'What letter completes the series? A, C, F, J, O, ____', '[{"key":"A","text":"S"},{"key":"B","text":"T"},{"key":"C","text":"U"},{"key":"D","text":"V"}]'::jsonb, 'C', 'The gaps between letters increase by one each time: +2 (A to C), +3 (C to F), +4 (F to J), +5 (J to O), +6 (O to U). O is the 15th letter, so the 21st letter, U, completes the series.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra', 'Solve for x: x^2 - 5x + 6 = 0', '[{"key":"A","text":"x = 1 or x = 6"},{"key":"B","text":"x = -2 or x = -3"},{"key":"C","text":"x = 2 or x = 3"},{"key":"D","text":"x = -1 or x = -6"}]'::jsonb, 'C', 'Factoring gives (x - 2)(x - 3) = 0, so x = 2 or x = 3.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry', 'What is the circumference of a circle with a radius of 14 cm? (Use pi = 22/7)', '[{"key":"A","text":"44 cm"},{"key":"B","text":"66 cm"},{"key":"C","text":"88 cm"},{"key":"D","text":"98 cm"}]'::jsonb, 'C', 'Circumference = 2 * pi * r = 2 * (22/7) * 14 = 2 * 44 = 88 cm.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem', 'Pipe A can fill an empty tank in 4 hours and Pipe B can fill it in 6 hours, while Pipe C alone can drain a full tank in 12 hours. If all three pipes operate together on an empty tank, how many hours will it take to fill it?', '[{"key":"A","text":"2 hours"},{"key":"B","text":"3 hours"},{"key":"C","text":"4 hours"},{"key":"D","text":"5 hours"}]'::jsonb, 'B', 'Combined rate = 1/4 + 1/6 - 1/12 = 3/12 + 2/12 - 1/12 = 4/12 = 1/3 tank per hour. Time to fill = 1 / (1/3) = 3 hours.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Trigonometry', 'In a right triangle, angle theta satisfies sin(theta) = 3/5. What is cos(theta)?', '[{"key":"A","text":"1/5"},{"key":"B","text":"3/4"},{"key":"C","text":"4/5"},{"key":"D","text":"5/3"}]'::jsonb, 'C', 'This corresponds to a 3-4-5 right triangle where the opposite side is 3 and the hypotenuse is 5, so the adjacent side is 4. Thus cos(theta) = adjacent/hypotenuse = 4/5.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Series', 'What number completes the series? 1, 1, 2, 3, 5, 8, 13, ____', '[{"key":"A","text":"18"},{"key":"B","text":"19"},{"key":"C","text":"20"},{"key":"D","text":"21"}]'::jsonb, 'D', 'This is the Fibonacci sequence, where each term is the sum of the two preceding terms: 8 + 13 = 21.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Coding-Decoding', 'In a certain code, each letter is replaced by the letter the same number of positions from the end of the alphabet (A becomes Z, B becomes Y, and so on). Under this code, what does "WORLD" become?', '[{"key":"A","text":"DLIOW"},{"key":"B","text":"DLOIW"},{"key":"C","text":"DILOW"},{"key":"D","text":"DOLIW"}]'::jsonb, 'A', 'Each letter n maps to position (27 - n): W(23)->D(4), O(15)->L(12), R(18)->I(9), L(12)->O(15), D(4)->W(23). Reading the results in order gives DLIOW.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem', 'In a class of 50 students, 30 play basketball, 25 play volleyball, and 10 play both sports. How many students play neither sport?', '[{"key":"A","text":"5"},{"key":"B","text":"10"},{"key":"C","text":"15"},{"key":"D","text":"20"}]'::jsonb, 'A', 'Students playing at least one sport = 30 + 25 - 10 (both) = 45. Students playing neither = 50 - 45 = 5.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem', 'Two trains start from stations 300 km apart and move toward each other at constant speeds of 60 km/h and 90 km/h respectively. After how many hours will they meet?', '[{"key":"A","text":"1 hour"},{"key":"B","text":"1.5 hours"},{"key":"C","text":"2 hours"},{"key":"D","text":"2.5 hours"}]'::jsonb, 'C', 'Since the trains move toward each other, their speeds add: 60 + 90 = 150 km/h combined. Time to meet = 300 km / 150 km/h = 2 hours.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Probability', 'A card is drawn at random from a standard deck of 52 playing cards. What is the probability that it is a face card (jack, queen, or king)?', '[{"key":"A","text":"1/13"},{"key":"B","text":"3/13"},{"key":"C","text":"1/4"},{"key":"D","text":"4/13"}]'::jsonb, 'B', 'There are 12 face cards (3 per suit x 4 suits) in a 52-card deck, giving a probability of 12/52 = 3/13.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra', 'Simplify: (2^3)^2 / 2^4', '[{"key":"A","text":"2"},{"key":"B","text":"4"},{"key":"C","text":"8"},{"key":"D","text":"16"}]'::jsonb, 'B', '(2^3)^2 = 2^6 = 64. Then 64 / 2^4 = 64 / 16 = 4. Equivalently, 2^6 / 2^4 = 2^2 = 4.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry', 'A cube has a side length of 5 cm. What is its volume?', '[{"key":"A","text":"25 cm^3"},{"key":"B","text":"75 cm^3"},{"key":"C","text":"100 cm^3"},{"key":"D","text":"125 cm^3"}]'::jsonb, 'D', 'Volume of a cube = side^3 = 5^3 = 125 cm^3.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem', 'How many liters of a 40% acid solution must be mixed with 10 liters of a 10% acid solution to obtain a 25% acid solution?', '[{"key":"A","text":"5 liters"},{"key":"B","text":"8 liters"},{"key":"C","text":"10 liters"},{"key":"D","text":"12 liters"}]'::jsonb, 'C', 'Let x be the liters of 40% solution needed. 0.40x + 0.10(10) = 0.25(x + 10). This gives 0.40x + 1 = 0.25x + 2.5, so 0.15x = 1.5, and x = 10 liters.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Logical Reasoning', 'All engineers are analytical thinkers. Some analytical thinkers are also musicians. Which conclusion follows logically from these two statements?', '[{"key":"A","text":"All engineers are musicians."},{"key":"B","text":"Some engineers are definitely musicians."},{"key":"C","text":"No engineers are musicians."},{"key":"D","text":"It cannot be determined whether any engineers are musicians."}]'::jsonb, 'D', 'The statements establish that engineers are a subset of analytical thinkers, and that only some analytical thinkers are musicians, without specifying whether that overlapping group includes any engineers. No valid conclusion about engineers and musicians can be drawn.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Series', 'Which number does NOT belong in the following series: 4, 9, 16, 26, 36, 49?', '[{"key":"A","text":"9"},{"key":"B","text":"16"},{"key":"C","text":"26"},{"key":"D","text":"49"}]'::jsonb, 'C', 'The series is meant to be consecutive perfect squares: 4 (2^2), 9 (3^2), 16 (4^2), 25 (5^2), 36 (6^2), 49 (7^2). The value 26 breaks the pattern and does not belong.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'mathematical-ability';

-- =========================================================
-- SCIENCE (new)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology', 'Which type of blood cell is primarily responsible for fighting infection in the human body?', '[{"key":"A","text":"Red blood cells"},{"key":"B","text":"White blood cells"},{"key":"C","text":"Platelets"},{"key":"D","text":"Plasma cells (plasma fluid)"}]'::jsonb, 'B', 'White blood cells (leukocytes) are the primary component of the immune system responsible for detecting and fighting pathogens.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry', 'What is the chemical symbol for sodium?', '[{"key":"A","text":"So"},{"key":"B","text":"Sd"},{"key":"C","text":"Na"},{"key":"D","text":"Sn"}]'::jsonb, 'C', 'Sodium''s chemical symbol, Na, comes from its Latin name "natrium." "Sn" is tin, and "So" and "Sd" are not real element symbols.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics', 'A seesaw is an example of which type of simple machine?', '[{"key":"A","text":"Pulley"},{"key":"B","text":"Lever"},{"key":"C","text":"Wedge"},{"key":"D","text":"Screw"}]'::jsonb, 'B', 'A seesaw pivots around a fixed point (fulcrum) to lift a load, which is the defining characteristic of a lever.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science', 'Which type of rock is formed from the cooling and solidification of magma or lava?', '[{"key":"A","text":"Sedimentary"},{"key":"B","text":"Metamorphic"},{"key":"C","text":"Igneous"},{"key":"D","text":"Organic"}]'::jsonb, 'C', 'Igneous rocks form when molten rock (magma below the surface, or lava above it) cools and solidifies.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology', 'Which structure in the human respiratory system is the primary site of gas exchange between air and blood?', '[{"key":"A","text":"Trachea"},{"key":"B","text":"Bronchi"},{"key":"C","text":"Alveoli"},{"key":"D","text":"Larynx"}]'::jsonb, 'C', 'Alveoli are tiny, thin-walled air sacs in the lungs surrounded by capillaries, providing the large surface area needed for oxygen and carbon dioxide exchange.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry', 'In the balanced equation for the combustion of methane, CH4 + ? O2 -> CO2 + 2H2O, what coefficient belongs in place of the question mark?', '[{"key":"A","text":"1"},{"key":"B","text":"2"},{"key":"C","text":"3"},{"key":"D","text":"4"}]'::jsonb, 'B', 'Balancing oxygen atoms: the products contain 2 (from CO2) + 2 (from 2H2O) = 4 oxygen atoms, which requires 2 molecules of O2 (4 oxygen atoms) as a reactant. The balanced equation is CH4 + 2O2 -> CO2 + 2H2O.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics', 'A wave has a frequency of 5 Hz and a wavelength of 2 meters. What is its speed?', '[{"key":"A","text":"2.5 m/s"},{"key":"B","text":"7 m/s"},{"key":"C","text":"10 m/s"},{"key":"D","text":"20 m/s"}]'::jsonb, 'C', 'Wave speed = frequency x wavelength = 5 Hz x 2 m = 10 m/s.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science', 'What is the term for a tectonic plate boundary where two plates move apart from each other?', '[{"key":"A","text":"Convergent boundary"},{"key":"B","text":"Divergent boundary"},{"key":"C","text":"Transform boundary"},{"key":"D","text":"Subduction boundary"}]'::jsonb, 'B', 'A divergent boundary is where two tectonic plates move apart, often allowing magma to rise and form new crust, as seen at mid-ocean ridges.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology', 'Which macromolecule serves as the primary carrier of genetic information in most living organisms?', '[{"key":"A","text":"DNA"},{"key":"B","text":"ATP"},{"key":"C","text":"Cellulose"},{"key":"D","text":"Lipids"}]'::jsonb, 'A', 'DNA (deoxyribonucleic acid) stores and transmits the genetic instructions used in the development, functioning, and reproduction of almost all organisms.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry', 'Which subatomic particle carries a negative electric charge?', '[{"key":"A","text":"Proton"},{"key":"B","text":"Neutron"},{"key":"C","text":"Electron"},{"key":"D","text":"Nucleon"}]'::jsonb, 'C', 'Electrons carry a negative charge and orbit the nucleus, while protons carry a positive charge and neutrons carry no charge.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics', 'What is the SI unit of electric current?', '[{"key":"A","text":"Volt"},{"key":"B","text":"Watt"},{"key":"C","text":"Ohm"},{"key":"D","text":"Ampere"}]'::jsonb, 'D', 'The ampere (A) is the SI base unit used to measure electric current, the rate of flow of electric charge.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Astronomy', 'Which planet in our solar system is known for having the most extensive and visible ring system?', '[{"key":"A","text":"Jupiter"},{"key":"B","text":"Saturn"},{"key":"C","text":"Uranus"},{"key":"D","text":"Neptune"}]'::jsonb, 'B', 'While several gas giants have rings, Saturn''s ring system is by far the largest, brightest, and most extensive, making it visible even through small telescopes.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology', 'What is the main function of red blood cells in the human body?', '[{"key":"A","text":"Fighting infection"},{"key":"B","text":"Clotting blood"},{"key":"C","text":"Transporting oxygen"},{"key":"D","text":"Producing antibodies"}]'::jsonb, 'C', 'Red blood cells contain hemoglobin, a protein that binds oxygen in the lungs and carries it to tissues throughout the body.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry', 'What type of chemical reaction occurs when an acid reacts with a base to produce a salt and water?', '[{"key":"A","text":"Oxidation reaction"},{"key":"B","text":"Neutralization reaction"},{"key":"C","text":"Decomposition reaction"},{"key":"D","text":"Combustion reaction"}]'::jsonb, 'B', 'A neutralization reaction occurs when an acid and a base react, with the H+ ions from the acid combining with the OH- ions from the base to form water, and the remaining ions forming a salt.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics', 'An object with a mass of 2 kg is moving at a speed of 3 m/s. What is its kinetic energy?', '[{"key":"A","text":"3 J"},{"key":"B","text":"6 J"},{"key":"C","text":"9 J"},{"key":"D","text":"18 J"}]'::jsonb, 'C', 'Kinetic energy = 1/2 * m * v^2 = 0.5 * 2 * 3^2 = 0.5 * 2 * 9 = 9 joules.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Ecology', 'In a food chain, organisms that produce their own food through photosynthesis are called ____.', '[{"key":"A","text":"Consumers"},{"key":"B","text":"Decomposers"},{"key":"C","text":"Producers"},{"key":"D","text":"Predators"}]'::jsonb, 'C', 'Producers, such as plants and algae, generate their own energy from sunlight through photosynthesis and form the base of most food chains.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Genetics', 'A man with blood type AB has children with a woman with blood type OO. What blood type(s) could their children have?', '[{"key":"A","text":"Type AB only"},{"key":"B","text":"Type O only"},{"key":"C","text":"Type A or Type B only"},{"key":"D","text":"Type A, B, AB, or O"}]'::jsonb, 'C', 'The AB parent can pass on either the A or B allele, while the OO parent can only pass on the O allele. This produces genotypes AO (blood type A) or BO (blood type B), so children can only have blood type A or B.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science', 'Which layer of Earth''s atmosphere contains the ozone layer that absorbs most of the sun''s harmful ultraviolet radiation?', '[{"key":"A","text":"Troposphere"},{"key":"B","text":"Stratosphere"},{"key":"C","text":"Mesosphere"},{"key":"D","text":"Thermosphere"}]'::jsonb, 'B', 'The ozone layer is located within the stratosphere, where it absorbs and blocks most of the sun''s ultraviolet radiation before it reaches the Earth''s surface.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry', 'Which of the following is an example of a physical change rather than a chemical change?', '[{"key":"A","text":"Iron rusting"},{"key":"B","text":"Wood burning"},{"key":"C","text":"Ice melting"},{"key":"D","text":"Milk souring"}]'::jsonb, 'C', 'Ice melting into water is a physical change because it alters only the state of matter, not its chemical composition. Rusting, burning, and souring are all chemical changes that produce new substances.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics', 'According to the law of conservation of energy, energy in a closed system ____.', '[{"key":"A","text":"Can be created but not destroyed"},{"key":"B","text":"Can be destroyed but not created"},{"key":"C","text":"Cannot be created or destroyed, only transformed"},{"key":"D","text":"Gradually disappears over time"}]'::jsonb, 'C', 'The law of conservation of energy states that the total energy in a closed system remains constant; it can change form (e.g., kinetic to potential) but is neither created nor destroyed.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology', 'Enzymes function as biological catalysts primarily by ____.', '[{"key":"A","text":"Increasing the temperature of a reaction"},{"key":"B","text":"Lowering the activation energy required for a reaction"},{"key":"C","text":"Permanently changing the products of a reaction"},{"key":"D","text":"Being consumed in the reaction they catalyze"}]'::jsonb, 'B', 'Enzymes speed up biochemical reactions by lowering the activation energy needed for the reaction to proceed, without being consumed or permanently altered themselves.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Astronomy', 'What causes the different phases of the Moon as seen from Earth?', '[{"key":"A","text":"The Earth''s shadow falling on the Moon"},{"key":"B","text":"The changing distance between the Earth and the Moon"},{"key":"C","text":"The changing relative positions of the Earth, Moon, and Sun"},{"key":"D","text":"The Moon''s rotation on its own axis"}]'::jsonb, 'C', 'The Moon''s phases result from the changing angle between the Earth, Moon, and Sun, which determines how much of the Moon''s sunlit half is visible from Earth. This is distinct from a lunar eclipse, which is caused by Earth''s shadow.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics', 'Two resistors, 4 ohms and 6 ohms, are connected in series in a circuit powered by a 20-volt battery. What is the total current flowing in the circuit?', '[{"key":"A","text":"1 A"},{"key":"B","text":"2 A"},{"key":"C","text":"4 A"},{"key":"D","text":"5 A"}]'::jsonb, 'B', 'In a series circuit, resistances add: total resistance = 4 + 6 = 10 ohms. By Ohm''s law, I = V/R = 20 V / 10 ohms = 2 A.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Ecology', 'Which term describes the variety of different species living within a particular ecosystem?', '[{"key":"A","text":"Symbiosis"},{"key":"B","text":"Biodiversity"},{"key":"C","text":"Population density"},{"key":"D","text":"Adaptation"}]'::jsonb, 'B', 'Biodiversity refers to the variety of life, including the number and variety of species, present in a given ecosystem.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry', 'According to the equation 2H2 + O2 -> 2H2O, how many moles of water are produced when 2 moles of hydrogen gas react completely with oxygen gas?', '[{"key":"A","text":"1 mole"},{"key":"B","text":"2 moles"},{"key":"C","text":"3 moles"},{"key":"D","text":"4 moles"}]'::jsonb, 'B', 'The balanced equation shows a 2:2 mole ratio between H2 and H2O, so 2 moles of H2 reacting completely produces 2 moles of H2O.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'science';

-- =========================================================
-- ESSAY WRITING (new)
-- Timed essay prompts. Not auto-graded — choices are a single placeholder
-- option, correct_answer is always 'A', and the explanation field is used
-- to hold guidance on what a strong response should cover.
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Narrative Essay', 'Write about a time you had to make a difficult decision with limited information. Describe the situation, the choice you made, and how it turned out.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response establishes a concrete situation quickly, clearly conveys what made the decision difficult (competing values, uncertainty, time pressure), and narrates the choice and its outcome without skipping the reasoning process. It should close with genuine reflection on what the experience revealed about the writer''s judgment or values, not just a summary of events.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Expository Essay', 'Explain how a habit — good or bad — is formed and what it would take to change it. Use a specific example to illustrate your explanation.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response explains cause-and-effect clearly and logically (trigger, routine, reward, or similar framework), uses one well-developed example rather than several shallow ones, and maintains an informative, objective tone rather than a purely narrative or persuasive one. Organization should move from general explanation to specific illustration in a clear sequence.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Compare-Contrast Essay', 'Compare and contrast learning a skill on your own versus learning it with a teacher or mentor. Which approach do you think produces better results, and why?', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response identifies clear points of comparison (pace, feedback, motivation, cost, depth of understanding) rather than a vague general contrast, treats both sides fairly before taking a position, and uses a consistent organizational pattern (either point-by-point or block structure) throughout. The conclusion should state a clear, well-supported preference.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Problem-Solution Essay', 'Traffic congestion is a major problem in many Philippine cities. Propose one specific solution and explain how it would realistically be implemented and what challenges it might face.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response clearly defines the scope of the problem before proposing a solution, offers a specific and feasible (not vague or utopian) proposal, and honestly addresses at least one practical obstacle to implementation (cost, politics, infrastructure, public behavior). It should avoid simply listing multiple solutions without depth.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Descriptive Essay', 'Describe a place that holds strong personal meaning for you. Use sensory details to help the reader experience it as you do.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response uses specific, concrete sensory details (sight, sound, smell, texture) rather than generic adjectives, organizes the description in a coherent spatial or thematic order, and connects the physical description to why the place matters personally, rather than describing it in a purely detached way.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Critical Analysis Essay', 'Some people argue that standardized entrance exams are a fair way to measure a student''s readiness for college, while others argue they unfairly favor students with more resources. Analyze both positions and present your own reasoned conclusion.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response accurately represents both positions before critiquing them, uses specific reasoning rather than sweeping generalizations, and reaches a conclusion that is clearly derived from the analysis rather than asserted without support. It should avoid false balance (treating both sides as equally valid without evaluation) if the writer''s analysis suggests otherwise.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Persuasive Essay', 'Should college students be required to take courses outside their major field of study? Argue for or against this requirement.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response takes a clear position immediately, supports it with at least two distinct, well-reasoned points (not just restatements of the same idea), and addresses a plausible counterargument rather than ignoring it. The essay should end with a conclusion that reinforces the position based on the evidence given.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Reflective Essay', 'Think of a piece of advice you received that you initially disagreed with but later came to appreciate. Explain what changed your mind.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response clearly states the original advice and the writer''s initial reaction, then traces a specific event or realization that caused the shift in perspective, rather than a vague "I grew up" explanation. It should end with a clear articulation of what the writer now understands that they did not before.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Argumentative Essay', 'Should artificial intelligence tools be allowed in the college admissions writing process? Take a position and defend it, addressing at least one objection to your view.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response states a clear, specific position (not merely "it depends"), supports it with concrete reasoning about fairness, learning, or authenticity, and directly names and responds to at least one strong counterargument. The tone should remain measured and evidence-based rather than purely emotional.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analytical Essay', 'Is competition or collaboration a more effective driver of achievement among students? Support your view with reasoning and specific examples.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response defines both terms clearly before comparing them, avoids treating the issue as strictly binary if nuance is warranted, and supports its claim with specific, plausible examples (academic, athletic, or workplace settings). The essay should reach a clear judgment supported by the reasoning presented, not just a summary of both sides.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Expository Essay', 'Explain the process by which a piece of legislation typically becomes law in a democratic government, and discuss one reason the process is designed this way.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response presents the process steps in a clear, logical sequence (proposal, deliberation, approval, and so on) using accurate general civic knowledge, and offers a plausible explanation for why the process includes checks or multiple stages (e.g., preventing hasty or unchecked decisions). It should stay factual and organized rather than becoming an argumentative essay.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Narrative Essay', 'Write about a moment when you failed at something you cared about. Describe what happened and how the experience shaped your approach to similar situations afterward.', '[{"key":"A","text":"(Open-ended essay — no auto-grading; see prompt)"}]'::jsonb, 'A', 'A strong response is honest and specific about the failure rather than minimizing or over-dramatizing it, clearly narrates the sequence of events, and demonstrates concrete evidence of growth or changed behavior afterward rather than a generic "I learned from my mistakes" statement. Tone should be reflective and mature.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'admu' and s.slug = 'essay-writing';
