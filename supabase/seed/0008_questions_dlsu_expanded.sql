-- Expanded practice question bank for DLSU / DCAT (De La Salle University College Admission Test).
-- Adds new original, AI-drafted items across all 4 DLSU subjects to broaden topic coverage beyond
-- 0002_questions_dlsu.sql. None of the items below duplicate or closely paraphrase existing rows.
-- All rows must be reviewed by a human before being treated as exam-accurate.

-- =========================================================
-- Reading Comprehension (new topics/items)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Main Idea', 'Passage: "Jeepney drivers in several cities have begun forming cooperatives, pooling resources to buy modern, fuel-efficient units together rather than each driver shouldering the cost of the government''s modernization program alone." What is the main idea?', '[{"key":"A","text":"Jeepney drivers oppose the modernization program."},{"key":"B","text":"Drivers are collaborating through cooperatives to afford modernization."},{"key":"C","text":"Fuel-efficient jeepneys are cheaper than old units."},{"key":"D","text":"The government is funding jeepney cooperatives directly."}]'::jsonb, 'B', 'The passage centers on drivers pooling resources through cooperatives to manage the cost of modernization together, which is the main idea.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'Passage: "Despite three consecutive quarters of declining sales, the company''s board approved a record dividend payout, drawing sharp questions from shareholders at the annual meeting." What can be inferred?', '[{"key":"A","text":"Shareholders were fully satisfied with the board''s decision."},{"key":"B","text":"The dividend payout seemed inconsistent with the company''s recent performance."},{"key":"C","text":"The company''s sales are expected to keep declining forever."},{"key":"D","text":"The board plans to resign after the meeting."}]'::jsonb, 'B', 'The juxtaposition of declining sales with a record payout, plus shareholder pushback, implies the decision appeared inconsistent with performance.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Tone', 'Passage: "At last, after decades of half-hearted promises, the new rail line has finally broken ground -- a small but genuinely hopeful step for commuters who have waited far too long." The tone is best described as:', '[{"key":"A","text":"Sarcastic"},{"key":"B","text":"Cautiously optimistic"},{"key":"C","text":"Angry"},{"key":"D","text":"Detached"}]'::jsonb, 'B', 'Phrases like "genuinely hopeful" paired with acknowledgment of past delays ("half-hearted promises," "waited far too long") signal cautious optimism rather than pure celebration.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'Passage: "Critics dismissed the debut novel as derivative, arguing it borrowed too heavily from earlier, more original works." As used here, "derivative" most nearly means:', '[{"key":"A","text":"Groundbreaking"},{"key":"B","text":"Unoriginal"},{"key":"C","text":"Financially profitable"},{"key":"D","text":"Difficult to understand"}]'::jsonb, 'B', 'In this context "derivative" describes a work that imitates others rather than being original, so "unoriginal" fits best.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Purpose', 'A passage details the health risks of prolonged screen time in children and closes with: "Parents should consider setting firm daily limits and encouraging outdoor play instead." The author''s primary purpose is to:', '[{"key":"A","text":"Persuade parents to adopt specific screen-time practices"},{"key":"B","text":"Report neutral statistics with no recommendation"},{"key":"C","text":"Criticize schools for allowing screen use"},{"key":"D","text":"Advertise an outdoor play program"}]'::jsonb, 'A', 'The closing sentence gives a direct recommendation to parents, indicating a persuasive purpose.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Supporting Detail', 'Passage: "Honeybees communicate the location of food sources through a ''waggle dance,'' in which the angle of the dance relative to vertical indicates direction relative to the sun, and the duration indicates distance." According to the passage, the duration of the waggle dance indicates:', '[{"key":"A","text":"The direction of the food relative to the sun"},{"key":"B","text":"The distance to the food source"},{"key":"C","text":"The quality of the food found"},{"key":"D","text":"The number of bees needed to retrieve the food"}]'::jsonb, 'B', 'The passage states directly that duration indicates distance, while angle indicates direction.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Data Interpretation', 'A report states: "Of the 400 survey respondents, 60% preferred remote work, 25% preferred hybrid arrangements, and the remainder preferred fully on-site work." How many respondents preferred fully on-site work?', '[{"key":"A","text":"40"},{"key":"B","text":"60"},{"key":"C","text":"100"},{"key":"D","text":"140"}]'::jsonb, 'B', 'Remote and hybrid together are 60% + 25% = 85%, leaving 15% on-site. 15% of 400 = 60 respondents.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Fact vs. Opinion', 'Which of the following sentences from a news article expresses an OPINION rather than a fact?', '[{"key":"A","text":"The city council approved the budget by a vote of 8 to 3."},{"key":"B","text":"The new budget allocates 40% of funds to infrastructure."},{"key":"C","text":"This budget is clearly the most sensible one the council has ever passed."},{"key":"D","text":"The budget takes effect on the first day of the next fiscal year."}]'::jsonb, 'C', 'Calling the budget "the most sensible one" is a subjective judgment, not a verifiable fact like the vote count, allocation percentage, or effective date.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Passage Organization', 'A passage first describes the causes of soil erosion, then explains its effects on crop yields, and finally proposes terracing as a solution. This passage is organized primarily by:', '[{"key":"A","text":"Chronological order of historical events"},{"key":"B","text":"Cause-effect-solution structure"},{"key":"C","text":"Comparison and contrast of two farming methods"},{"key":"D","text":"Random anecdotes with no clear structure"}]'::jsonb, 'B', 'The passage moves from causes, to effects, to a proposed solution -- a cause-effect-solution structure.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'Passage: "The startup''s founders declined every acquisition offer for five years, even as competitors sold out for large sums, insisting they wanted to see the product reach its full potential first." What does this suggest about the founders?', '[{"key":"A","text":"They were primarily motivated by immediate financial gain."},{"key":"B","text":"They valued the product''s long-term development over quick profit."},{"key":"C","text":"They believed acquisitions were illegal."},{"key":"D","text":"They had no other offers to consider."}]'::jsonb, 'B', 'Repeatedly declining lucrative offers to focus on the product''s potential implies they prioritized long-term development over quick profit.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'Passage: "The committee''s recommendations were vague and equivocal, leaving implementers uncertain about which policy to actually adopt." As used here, "equivocal" most nearly means:', '[{"key":"A","text":"Ambiguous"},{"key":"B","text":"Enthusiastic"},{"key":"C","text":"Illegal"},{"key":"D","text":"Detailed"}]'::jsonb, 'A', 'Equivocal means open to more than one interpretation, i.e., ambiguous, matching the described uncertainty.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Main Idea', 'Passage: "While social media allows small businesses to reach new customers at low cost, it also exposes them to instant public backlash that can spread faster than any traditional complaint ever could." This passage mainly discusses:', '[{"key":"A","text":"Only the benefits of social media for small businesses"},{"key":"B","text":"Both the opportunities and risks social media poses for small businesses"},{"key":"C","text":"Why small businesses should avoid social media entirely"},{"key":"D","text":"How to handle customer complaints in person"}]'::jsonb, 'B', 'The passage presents both a benefit (low-cost reach) and a risk (fast-spreading backlash), so it discusses both opportunities and risks.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Purpose', 'A passage lists step-by-step instructions for filing a small claims case, without offering any personal opinion. The author''s primary purpose is to:', '[{"key":"A","text":"Persuade readers to avoid the courts"},{"key":"B","text":"Inform readers of a procedure"},{"key":"C","text":"Entertain readers with a courtroom story"},{"key":"D","text":"Criticize the legal system"}]'::jsonb, 'B', 'Step-by-step, opinion-free instructions serve an informative purpose.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'Passage: "The volcano had been dormant for over two hundred years, so when seismologists detected a sudden spike in tremors, evacuation orders were issued within hours." Why were the evacuation orders issued so quickly?', '[{"key":"A","text":"Because the volcano erupts every year."},{"key":"B","text":"Because the sudden tremor spike after long dormancy signaled possible danger."},{"key":"C","text":"Because local officials wanted to test the evacuation plan."},{"key":"D","text":"Because the volcano had already erupted."}]'::jsonb, 'B', 'A sudden spike in tremors after two centuries of dormancy is an unusual, alarming signal, prompting a fast precautionary evacuation.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'Passage: "The witness gave a lucid account of the accident, recalling every detail in clear, logical order." As used here, "lucid" most nearly means:', '[{"key":"A","text":"Confused"},{"key":"B","text":"Clear"},{"key":"C","text":"Emotional"},{"key":"D","text":"Brief"}]'::jsonb, 'B', 'Lucid means easily understood or clear, which matches "clear, logical order" in the sentence.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Data Interpretation', 'A passage notes: "Between 2019 and 2023, the average price of rice rose from Php 38 to Php 50 per kilo, while the minimum wage rose from Php 500 to Php 570 per day." Which conclusion is best supported?', '[{"key":"A","text":"Rice prices rose at a faster percentage rate than the minimum wage."},{"key":"B","text":"The minimum wage rose faster in percentage terms than rice prices."},{"key":"C","text":"Rice became cheaper relative to 2019 prices."},{"key":"D","text":"Wages and rice prices rose at exactly the same rate."}]'::jsonb, 'A', 'Rice rose about 31.6% (12/38) while wages rose about 14% (70/500), so rice prices increased at a faster percentage rate.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Tone', 'Passage: "One more delayed flight, one more unexplained gate change, one more hour wasted in a terminal that seems designed to test human patience." The tone here is best described as:', '[{"key":"A","text":"Exasperated"},{"key":"B","text":"Joyful"},{"key":"C","text":"Indifferent"},{"key":"D","text":"Formal and academic"}]'::jsonb, 'A', 'The repeated "one more" structure and phrase "test human patience" convey frustration, i.e., an exasperated tone.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Supporting Detail', 'Passage: "Unlike bacteria, viruses cannot reproduce on their own; they must hijack a host cell''s machinery to make copies of themselves." According to the passage, what distinguishes viruses from bacteria?', '[{"key":"A","text":"Viruses are larger than bacteria."},{"key":"B","text":"Viruses cannot reproduce without a host cell."},{"key":"C","text":"Bacteria cannot cause disease."},{"key":"D","text":"Viruses do not contain genetic material."}]'::jsonb, 'B', 'The passage explicitly states viruses need to hijack a host cell to reproduce, unlike bacteria which can reproduce independently.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Main Idea', 'Passage: "Microfinance institutions have enabled thousands of small entrepreneurs to access capital they otherwise could not obtain from traditional banks, though critics warn that high interest rates can trap some borrowers in cycles of debt." The passage mainly presents:', '[{"key":"A","text":"A one-sided defense of microfinance"},{"key":"B","text":"A balanced view of microfinance''s benefits and risks"},{"key":"C","text":"A history of traditional banking"},{"key":"D","text":"A call to ban microfinance institutions"}]'::jsonb, 'B', 'The passage presents both a benefit (access to capital) and a risk (debt cycles from high interest), making it a balanced view.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Inference', 'Passage: "The chef refused to serve the dish once she noticed the fish had been left unrefrigerated for over an hour, even though it meant a much shorter menu that night." What quality does this best illustrate about the chef?', '[{"key":"A","text":"Carelessness"},{"key":"B","text":"A commitment to food safety over convenience"},{"key":"C","text":"A dislike of seafood"},{"key":"D","text":"Indifference to customer satisfaction"}]'::jsonb, 'B', 'Choosing to shorten the menu rather than serve improperly stored fish shows she prioritized food safety over convenience.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary in Context', 'Passage: "The professor''s terse reply -- just two words -- left the student unsure whether the answer was correct." As used here, "terse" most nearly means:', '[{"key":"A","text":"Long-winded"},{"key":"B","text":"Brief to the point of curtness"},{"key":"C","text":"Encouraging"},{"key":"D","text":"Written"}]'::jsonb, 'B', 'Terse means using few words, often curtly, matching the description of a two-word reply.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Passage Organization', 'A passage opens by describing the traditional method of brewing coffee, then contrasts it with a newer cold-brew method, listing differences in taste, time, and equipment. This is best described as organized by:', '[{"key":"A","text":"Comparison and contrast"},{"key":"B","text":"Strict chronological narrative"},{"key":"C","text":"Problem and solution only"},{"key":"D","text":"Spatial description"}]'::jsonb, 'A', 'The passage sets two methods side by side and highlights their differences, which is a comparison-and-contrast structure.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Supporting Detail', 'Passage: "The 1986 EDSA People Power Revolution was a largely peaceful, four-day series of demonstrations that led to the departure of President Ferdinand Marcos and the installation of Corazon Aquino." According to the passage, how long did the demonstrations last?', '[{"key":"A","text":"One day"},{"key":"B","text":"Four days"},{"key":"C","text":"One week"},{"key":"D","text":"One month"}]'::jsonb, 'B', 'The passage states directly that it was a "four-day series of demonstrations."', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Author''s Purpose', 'A movie review states: "The cinematography is stunning, but the plot drags so much in the second act that even the visuals cannot save it. I cannot, in good conscience, recommend it for a full-price ticket." The author''s primary purpose is to:', '[{"key":"A","text":"Provide a purely factual plot summary"},{"key":"B","text":"Evaluate the film and advise readers on whether to watch it"},{"key":"C","text":"Promote the film''s soundtrack"},{"key":"D","text":"Interview the director"}]'::jsonb, 'B', 'The review weighs strengths and weaknesses and ends with a direct recommendation, which is an evaluative purpose.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'reading-comprehension';

-- =========================================================
-- Verbal Reasoning (vocabulary, analogies, grammar, and DCAT-style logical reasoning)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word most nearly SIMILAR in meaning to "meticulous":', '[{"key":"A","text":"Careless"},{"key":"B","text":"Painstaking"},{"key":"C","text":"Hasty"},{"key":"D","text":"Generous"}]'::jsonb, 'B', 'Meticulous means showing great attention to detail, which is synonymous with painstaking.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'PUPPY is to DOG as SAPLING is to:', '[{"key":"A","text":"Forest"},{"key":"B","text":"Tree"},{"key":"C","text":"Seed"},{"key":"D","text":"Branch"}]'::jsonb, 'B', 'A puppy is a young dog; a sapling is a young tree -- the analogy is young-form-to-adult-form.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Series', 'Find the next number in the series: 3, 7, 15, 31, 63, ___', '[{"key":"A","text":"95"},{"key":"B","text":"111"},{"key":"C","text":"127"},{"key":"D","text":"124"}]'::jsonb, 'C', 'Each term is double the previous term plus 1 (3x2+1=7, 7x2+1=15, 15x2+1=31, 31x2+1=63, 63x2+1=127).', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Clock Angles', 'What is the angle between the hour and minute hands of a clock at 4:00?', '[{"key":"A","text":"100 degrees"},{"key":"B","text":"110 degrees"},{"key":"C","text":"120 degrees"},{"key":"D","text":"130 degrees"}]'::jsonb, 'C', 'Each hour mark represents 30 degrees (360/12). At 4:00 the minute hand is at 12 and the hour hand is at 4, so the angle is 4 x 30 = 120 degrees.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Clock Angles', 'What is the angle between the hour and minute hands of a clock at 3:30?', '[{"key":"A","text":"75 degrees"},{"key":"B","text":"70 degrees"},{"key":"C","text":"90 degrees"},{"key":"D","text":"105 degrees"}]'::jsonb, 'A', 'At 3:30 the minute hand is at 180 degrees. The hour hand moves 0.5 degrees per minute, so at 3:30 it is at 3x30 + 30x0.5 = 90 + 15 = 105 degrees. The difference is 180 - 105 = 75 degrees.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Blood Relations', 'A man introduces a woman as "the daughter of my grandfather''s only son." How is the woman related to the man, assuming the man himself is not the only son?', '[{"key":"A","text":"Sister"},{"key":"B","text":"Mother"},{"key":"C","text":"Cousin"},{"key":"D","text":"Wife"}]'::jsonb, 'A', 'The man''s grandfather''s only son is the man''s father (assuming the man is not that son), so the daughter of the man''s father is the man''s sister.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Blood Relations', 'Introducing a boy, a girl said, "He is the son of my mother''s only brother." How is the boy related to the girl?', '[{"key":"A","text":"Brother"},{"key":"B","text":"Nephew"},{"key":"C","text":"Cousin"},{"key":"D","text":"Uncle"}]'::jsonb, 'C', 'The girl''s mother''s only brother is the girl''s uncle, and the uncle''s son is the girl''s cousin.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Coding-Decoding', 'In a certain code, "FLOWER" is written as "GMPXFS". Using the same code, how would "GARDEN" be written?', '[{"key":"A","text":"HBSEFO"},{"key":"B","text":"HBSEFN"},{"key":"C","text":"HBTEFO"},{"key":"D","text":"IBSEFO"}]'::jsonb, 'A', 'Each letter in the code is shifted forward by one (F->G, L->M, O->P, W->X, E->F, R->S). Applying the same shift to GARDEN: G->H, A->B, R->S, D->E, E->F, N->O gives HBSEFO.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Coding-Decoding', 'If in a code language "APPLE" is written as "12235" (A=1, P=2, L=3, E=5, each distinct letter assigned a distinct digit in order of first appearance), how would "PEEL" be written using the same key?', '[{"key":"A","text":"2553"},{"key":"B","text":"2535"},{"key":"C","text":"5523"},{"key":"D","text":"3255"}]'::jsonb, 'A', 'Using the key A=1, P=2, L=3, E=5: P=2, E=5, E=5, L=3, so PEEL = 2553.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Figure/Pattern Reasoning', 'A sequence of figures shows a single dot inside a square, then two dots inside a pentagon, then three dots inside a hexagon. If the pattern continues, the next figure should show:', '[{"key":"A","text":"Four dots inside a heptagon (7-sided figure)"},{"key":"B","text":"Four dots inside a hexagon"},{"key":"C","text":"Three dots inside a heptagon"},{"key":"D","text":"Five dots inside an octagon"}]'::jsonb, 'A', 'Both the number of dots and the number of sides of the polygon increase by one each step (square/4-sides+1dot, pentagon/5-sides+2dots, hexagon/6-sides+3dots), so next is a 7-sided heptagon with 4 dots.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Figure/Pattern Reasoning', 'A series of figures shows an arrow rotating 45 degrees clockwise at each step, starting pointing straight up (North). After 5 rotations, which direction does the arrow point?', '[{"key":"A","text":"Southwest"},{"key":"B","text":"East"},{"key":"C","text":"Southeast"},{"key":"D","text":"South"}]'::jsonb, 'A', 'Starting at North (0 degrees, measuring clockwise), 5 rotations of 45 degrees each total 225 degrees clockwise from North, which points to Southwest.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar and Usage', 'Choose the sentence that is grammatically correct:', '[{"key":"A","text":"Each of the applicants were asked to submit their portfolio."},{"key":"B","text":"Each of the applicants was asked to submit their portfolio."},{"key":"C","text":"Each of the applicants was asked to submitted their portfolio."},{"key":"D","text":"Each of the applicants were asked to submitted his portfolio."}]'::jsonb, 'B', '"Each" is singular and takes a singular verb ("was"), making B the grammatically correct choice.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Sentence Correction', 'Identify the best replacement for the underlined portion: "The team of researchers _have concluded_ that the new drug is effective."', '[{"key":"A","text":"have concluded"},{"key":"B","text":"has concluded"},{"key":"C","text":"having concluded"},{"key":"D","text":"conclude"}]'::jsonb, 'B', '"Team" is a collective noun treated as singular here, so it takes the singular verb "has concluded."', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word most nearly OPPOSITE in meaning to "candid":', '[{"key":"A","text":"Honest"},{"key":"B","text":"Evasive"},{"key":"C","text":"Blunt"},{"key":"D","text":"Direct"}]'::jsonb, 'B', 'Candid means open and truthful; evasive, meaning deliberately vague or avoiding directness, is the opposite.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'DOCTOR is to HOSPITAL as TEACHER is to:', '[{"key":"A","text":"Book"},{"key":"B","text":"School"},{"key":"C","text":"Student"},{"key":"D","text":"Lesson"}]'::jsonb, 'B', 'A doctor typically works in a hospital; a teacher typically works in a school -- the analogy is worker-to-workplace.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Logical Reasoning', 'All members of the choir can read musical notation. Reading musical notation is one requirement for joining the orchestra. Which conclusion must be true?', '[{"key":"A","text":"All choir members can join the orchestra."},{"key":"B","text":"All choir members meet at least one requirement for joining the orchestra."},{"key":"C","text":"No choir members are in the orchestra."},{"key":"D","text":"Everyone who reads musical notation is in the choir."}]'::jsonb, 'B', 'Choir members can read notation, and reading notation is stated as one requirement for the orchestra, so choir members meet that one requirement -- not a guarantee of full membership.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Logical Reasoning', 'If it rains, the game is postponed. The game was not postponed. What can be concluded?', '[{"key":"A","text":"It rained."},{"key":"B","text":"It did not rain."},{"key":"C","text":"The game was cancelled."},{"key":"D","text":"Nothing can be concluded."}]'::jsonb, 'B', 'This is a valid modus tollens: if rain implies postponement, and postponement did not happen, then it did not rain.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Odd One Out', 'Which word does NOT belong with the others?', '[{"key":"A","text":"Trumpet"},{"key":"B","text":"Violin"},{"key":"C","text":"Flute"},{"key":"D","text":"Painting"}]'::jsonb, 'D', 'Trumpet, violin, and flute are all musical instruments, while painting is a visual art form, not an instrument.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Series', 'Find the missing number: 2, 6, 12, 20, 30, ___', '[{"key":"A","text":"36"},{"key":"B","text":"40"},{"key":"C","text":"42"},{"key":"D","text":"44"}]'::jsonb, 'C', 'The differences between terms are 4, 6, 8, 10, increasing by 2 each time, so the next difference is 12: 30 + 12 = 42.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Letter Series', 'Find the next term: Z, X, V, T, ___', '[{"key":"A","text":"S"},{"key":"B","text":"R"},{"key":"C","text":"Q"},{"key":"D","text":"P"}]'::jsonb, 'B', 'The letters skip one place going backward through the alphabet (Z, X, V, T, R), so the next term is R.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Vocabulary', 'Choose the word most nearly SIMILAR in meaning to "ubiquitous":', '[{"key":"A","text":"Rare"},{"key":"B","text":"Omnipresent"},{"key":"C","text":"Ancient"},{"key":"D","text":"Fragile"}]'::jsonb, 'B', 'Ubiquitous means present everywhere, which is synonymous with omnipresent.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Blood Relations', 'Pointing to a man, a woman says, "His mother is my mother-in-law." How is the man related to the woman?', '[{"key":"A","text":"Husband"},{"key":"B","text":"Brother"},{"key":"C","text":"Father"},{"key":"D","text":"Son"}]'::jsonb, 'A', 'The man''s mother being the woman''s mother-in-law means the woman married into that family through the man, so the man is the woman''s husband.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Analogy', 'PESSIMIST is to HOPEFUL as MISER is to:', '[{"key":"A","text":"Generous"},{"key":"B","text":"Wealthy"},{"key":"C","text":"Frugal"},{"key":"D","text":"Selfish"}]'::jsonb, 'A', 'A pessimist lacks being hopeful; a miser lacks being generous -- the analogy pairs a personality type with the trait it lacks.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Grammar and Usage', 'Choose the sentence that uses the correct verb tense:', '[{"key":"A","text":"By the time she arrived, the meeting had already started."},{"key":"B","text":"By the time she arrived, the meeting has already started."},{"key":"C","text":"By the time she arrived, the meeting already starts."},{"key":"D","text":"By the time she arrives, the meeting had already started."}]'::jsonb, 'A', 'The past perfect "had already started" correctly indicates an action completed before another past action ("arrived").', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Coding-Decoding', 'In a code, numbers 1 to 5 represent the letters A, B, C, D, E respectively, but reversed so that 1=E, 2=D, 3=C, 4=B, 5=A. What word do the numbers 5-4-3 spell?', '[{"key":"A","text":"ABC"},{"key":"B","text":"CBA"},{"key":"C","text":"EDC"},{"key":"D","text":"BCA"}]'::jsonb, 'A', 'Using the reversed key: 5=A, 4=B, 3=C, so 5-4-3 spells ABC.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Relationships', 'Which pair of words has a relationship most similar to "SCISSORS : CUT"?', '[{"key":"A","text":"BOOK : READ"},{"key":"B","text":"HAMMER : NAIL"},{"key":"C","text":"BROOM : SWEEP"},{"key":"D","text":"CHAIR : SIT"}]'::jsonb, 'C', 'Scissors are a tool used to perform the action of cutting; a broom is a tool used to perform the action of sweeping, matching the tool-to-action relationship.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'verbal-reasoning';

-- =========================================================
-- Quantitative Reasoning (DCAT-style business math and word problems)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Discount and Tax Ordering', 'A store offers a 20% discount on a Php 1,500 item, and then applies a 12% VAT on the discounted price. What is the final price the customer pays?', '[{"key":"A","text":"Php 1,344.00"},{"key":"B","text":"Php 1,200.00"},{"key":"C","text":"Php 1,320.00"},{"key":"D","text":"Php 1,680.00"}]'::jsonb, 'A', '20% discount on 1,500 gives 1,500 x 0.8 = 1,200. Then 12% VAT is added: 1,200 x 1.12 = 1,344.00.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Discount and Tax Ordering', 'A retailer applies a 12% tax first on a Php 2,000 item, then gives a 10% discount on the taxed price. What is the final price?', '[{"key":"A","text":"Php 2,016.00"},{"key":"B","text":"Php 1,980.00"},{"key":"C","text":"Php 2,000.00"},{"key":"D","text":"Php 1,960.00"}]'::jsonb, 'A', 'Tax first: 2,000 x 1.12 = 2,240. Then 10% discount: 2,240 x 0.9 = 2,016.00.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Simple Interest', 'Php 40,000 is invested at a simple interest rate of 6% per year. How much total interest is earned after 3 years?', '[{"key":"A","text":"Php 2,400"},{"key":"B","text":"Php 7,200"},{"key":"C","text":"Php 6,000"},{"key":"D","text":"Php 8,400"}]'::jsonb, 'B', 'Simple interest = Principal x Rate x Time = 40,000 x 0.06 x 3 = 7,200.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Simple Interest', 'How many years will it take for Php 15,000 to earn Php 3,600 in simple interest at an annual rate of 8%?', '[{"key":"A","text":"2 years"},{"key":"B","text":"3 years"},{"key":"C","text":"4 years"},{"key":"D","text":"5 years"}]'::jsonb, 'B', 'Time = Interest / (Principal x Rate) = 3,600 / (15,000 x 0.08) = 3,600 / 1,200 = 3 years.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Mixture Problem', 'A chemist has a 10% saline solution and needs to mix it with a 40% saline solution to make 30 liters of a 20% saline solution. How many liters of the 10% solution are needed?', '[{"key":"A","text":"10 liters"},{"key":"B","text":"15 liters"},{"key":"C","text":"20 liters"},{"key":"D","text":"25 liters"}]'::jsonb, 'C', 'Let x = liters of 10% solution, (30-x) = liters of 40% solution. 0.10x + 0.40(30-x) = 0.20(30) => 0.10x + 12 - 0.40x = 6 => -0.30x = -6 => x = 20 liters.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Mixture Problem', 'A vendor mixes 5 kg of coffee beans worth Php 300/kg with 3 kg of coffee beans worth Php 500/kg. What is the price per kilogram of the resulting mixture?', '[{"key":"A","text":"Php 375"},{"key":"B","text":"Php 400"},{"key":"C","text":"Php 350"},{"key":"D","text":"Php 425"}]'::jsonb, 'A', 'Total cost = (5 x 300) + (3 x 500) = 1,500 + 1,500 = 3,000. Total weight = 8 kg. Price per kg = 3,000 / 8 = 375.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Work-Rate Problem', 'Pipe A can fill a tank in 5 hours, and Pipe B can drain a full tank in 10 hours. If both pipes are opened together on an empty tank, how long will it take to fill the tank?', '[{"key":"A","text":"6 hours"},{"key":"B","text":"7.5 hours"},{"key":"C","text":"8 hours"},{"key":"D","text":"10 hours"}]'::jsonb, 'D', 'Combined rate = 1/5 - 1/10 = 2/10 - 1/10 = 1/10 of the tank per hour, so it takes 10 hours to fill.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Work-Rate Problem', 'Three workers, each working at the same rate, can complete a job in 12 days. How many days would it take 4 workers of the same rate to complete the same job?', '[{"key":"A","text":"6 days"},{"key":"B","text":"8 days"},{"key":"C","text":"9 days"},{"key":"D","text":"16 days"}]'::jsonb, 'C', 'Total work = 3 workers x 12 days = 36 worker-days. With 4 workers: 36 / 4 = 9 days.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Probability', 'A standard deck of 52 playing cards is shuffled. What is the probability of drawing a King or a Queen?', '[{"key":"A","text":"1/13"},{"key":"B","text":"2/13"},{"key":"C","text":"1/26"},{"key":"D","text":"4/13"}]'::jsonb, 'B', 'There are 4 Kings and 4 Queens, totaling 8 favorable cards out of 52. 8/52 simplifies to 2/13.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Probability', 'Two fair six-sided dice are rolled. What is the probability that the sum of the two dice is exactly 7?', '[{"key":"A","text":"1/6"},{"key":"B","text":"1/12"},{"key":"C","text":"1/9"},{"key":"D","text":"5/36"}]'::jsonb, 'A', 'There are 6 ways to get a sum of 7 out of 36 total outcomes (1-6, 2-5, 3-4, 4-3, 5-2, 6-1), so the probability is 6/36 = 1/6.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Ratio and Proportion', 'A recipe requires flour and sugar in a ratio of 5:2. If a baker uses 750 grams of flour, how many grams of sugar should be used?', '[{"key":"A","text":"200 grams"},{"key":"B","text":"250 grams"},{"key":"C","text":"300 grams"},{"key":"D","text":"350 grams"}]'::jsonb, 'C', 'The ratio 5:2 means sugar = (2/5) x flour = (2/5) x 750 = 300 grams.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Profit and Loss', 'A vendor buys a phone case for Php 80 and sells it for Php 100. What is the percentage profit?', '[{"key":"A","text":"20%"},{"key":"B","text":"25%"},{"key":"C","text":"80%"},{"key":"D","text":"15%"}]'::jsonb, 'B', 'Profit = 100 - 80 = 20. Percentage profit = (Profit / Cost Price) x 100 = (20/80) x 100 = 25%.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Profit and Loss', 'A merchant sells a bag for Php 1,200, incurring a loss of 20% on the cost price. What was the cost price?', '[{"key":"A","text":"Php 1,440"},{"key":"B","text":"Php 1,500"},{"key":"C","text":"Php 1,000"},{"key":"D","text":"Php 960"}]'::jsonb, 'B', 'If selling price is 80% of cost price (100% - 20% loss), then Cost Price = 1,200 / 0.8 = 1,500.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem - Distance', 'A bus travels from City A to City B, a distance of 240 km, at an average speed of 60 km/h. It then returns at an average speed of 80 km/h. What is the average speed for the entire round trip?', '[{"key":"A","text":"68.57 km/h"},{"key":"B","text":"70 km/h"},{"key":"C","text":"65 km/h"},{"key":"D","text":"75 km/h"}]'::jsonb, 'A', 'Time to go = 240/60 = 4 hrs. Time to return = 240/80 = 3 hrs. Total distance = 480 km. Total time = 7 hrs. Average speed = 480/7 ~= 68.57 km/h.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem - Age', 'The sum of the ages of a father and son is 60. Ten years ago, the father was three times as old as the son. What is the son''s current age?', '[{"key":"A","text":"15"},{"key":"B","text":"20"},{"key":"C","text":"25"},{"key":"D","text":"30"}]'::jsonb, 'B', 'Let f + s = 60. Ten years ago: f - 10 = 3(s - 10) => f = 3s - 20. Substituting: 3s - 20 + s = 60 => 4s = 80 => s = 20.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Algebra', 'If 2(x + 3) = 3(x - 1), what is the value of x?', '[{"key":"A","text":"7"},{"key":"B","text":"8"},{"key":"C","text":"9"},{"key":"D","text":"10"}]'::jsonb, 'C', 'Expand: 2x + 6 = 3x - 3. Rearranging: 6 + 3 = 3x - 2x => x = 9.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry', 'A right triangle has legs of length 6 cm and 8 cm. What is the length of the hypotenuse?', '[{"key":"A","text":"9 cm"},{"key":"B","text":"10 cm"},{"key":"C","text":"12 cm"},{"key":"D","text":"14 cm"}]'::jsonb, 'B', 'By the Pythagorean theorem: hypotenuse = sqrt(6^2 + 8^2) = sqrt(36 + 64) = sqrt(100) = 10 cm.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Geometry', 'A circular pool has a radius of 7 meters. What is its approximate circumference? (Use pi = 22/7)', '[{"key":"A","text":"22 meters"},{"key":"B","text":"44 meters"},{"key":"C","text":"49 meters"},{"key":"D","text":"154 meters"}]'::jsonb, 'B', 'Circumference = 2 x pi x r = 2 x (22/7) x 7 = 44 meters.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Statistics', 'A set of 6 exam scores has a mean of 85. If five of the scores are 80, 82, 88, 90, and 84, what is the sixth score?', '[{"key":"A","text":"84"},{"key":"B","text":"86"},{"key":"C","text":"88"},{"key":"D","text":"90"}]'::jsonb, 'B', 'Sum of all 6 scores = 85 x 6 = 510. Sum of the five known scores = 80+82+88+90+84 = 424. Sixth score = 510 - 424 = 86.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem - Business Math', 'A store buys shirts at Php 250 each and wants to mark up the price so that after giving a 15% discount during a sale, it still makes a 20% profit on cost. What should the marked (pre-discount) price be?', '[{"key":"A","text":"Php 300.00"},{"key":"B","text":"Php 352.94"},{"key":"C","text":"Php 345.00"},{"key":"D","text":"Php 375.00"}]'::jsonb, 'B', 'Desired selling price after discount = 250 x 1.20 = 300. If marked price M gives 300 after a 15% discount: M x 0.85 = 300 => M = 300/0.85 ~= 352.94.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Number Theory', 'What is the least common multiple (LCM) of 12 and 18?', '[{"key":"A","text":"24"},{"key":"B","text":"36"},{"key":"C","text":"48"},{"key":"D","text":"72"}]'::jsonb, 'B', '12 = 2^2 x 3, 18 = 2 x 3^2. LCM takes the highest powers: 2^2 x 3^2 = 4 x 9 = 36.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Percentages', 'A student answered 45 out of 60 questions correctly on a test. What percentage did the student score?', '[{"key":"A","text":"70%"},{"key":"B","text":"72.5%"},{"key":"C","text":"75%"},{"key":"D","text":"80%"}]'::jsonb, 'C', 'Percentage = (45/60) x 100 = 75%.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem - Compound Growth', 'A savings account with Php 10,000 earns 10% interest compounded annually. What is the balance after 2 years?', '[{"key":"A","text":"Php 12,000"},{"key":"B","text":"Php 12,100"},{"key":"C","text":"Php 11,000"},{"key":"D","text":"Php 12,210"}]'::jsonb, 'B', 'After year 1: 10,000 x 1.10 = 11,000. After year 2: 11,000 x 1.10 = 12,100.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem - Mixture', 'A juice stand mixes fruit concentrate with water in a ratio of 1:4 to make a pitcher. If the pitcher holds 20 liters total, how many liters of water are used?', '[{"key":"A","text":"4 liters"},{"key":"B","text":"5 liters"},{"key":"C","text":"16 liters"},{"key":"D","text":"15 liters"}]'::jsonb, 'C', 'The ratio 1:4 means 5 total parts, with water being 4 parts. Each part = 20/5 = 4 liters. Water = 4 x 4 = 16 liters.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Exponents and Radicals', 'Simplify: (2^3) x (2^4)', '[{"key":"A","text":"2^7"},{"key":"B","text":"2^12"},{"key":"C","text":"4^7"},{"key":"D","text":"2^1"}]'::jsonb, 'A', 'When multiplying powers with the same base, add the exponents: 2^3 x 2^4 = 2^(3+4) = 2^7.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Word Problem - Rate', 'A car travels 150 km using 12 liters of gasoline. At this rate, how many liters would it need to travel 250 km?', '[{"key":"A","text":"18 liters"},{"key":"B","text":"20 liters"},{"key":"C","text":"22 liters"},{"key":"D","text":"24 liters"}]'::jsonb, 'B', 'Rate = 150 km / 12 L = 12.5 km per liter. Liters needed for 250 km = 250 / 12.5 = 20 liters.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'quantitative-reasoning';

-- =========================================================
-- Science (includes DCAT-style "EXCEPT"-phrased items)
-- =========================================================

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Human Body Systems', 'All of the following are functions of the human respiratory system EXCEPT:', '[{"key":"A","text":"Gas exchange between air and blood"},{"key":"B","text":"Regulating blood pH through carbon dioxide removal"},{"key":"C","text":"Filtering waste products from the blood into urine"},{"key":"D","text":"Warming and humidifying inhaled air"}]'::jsonb, 'C', 'Filtering blood waste into urine is a function of the excretory system (kidneys), not the respiratory system, which handles gas exchange, pH regulation via CO2, and conditioning of inhaled air.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - States of Matter', 'All of the following are examples of physical changes EXCEPT:', '[{"key":"A","text":"Ice melting into water"},{"key":"B","text":"Water boiling into steam"},{"key":"C","text":"Iron rusting into iron oxide"},{"key":"D","text":"Sugar dissolving in water"}]'::jsonb, 'C', 'Rusting is a chemical change because it produces a new substance (iron oxide) with different chemical properties, unlike melting, boiling, or dissolving, which do not change chemical composition.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Forces', 'All of the following are examples of Newton''s Third Law of Motion EXCEPT:', '[{"key":"A","text":"A swimmer pushing water backward to move forward"},{"key":"B","text":"A rocket expelling gas downward to launch upward"},{"key":"C","text":"A ball rolling to a stop due to friction"},{"key":"D","text":"A person jumping off a small boat, causing the boat to move backward"}]'::jsonb, 'C', 'A ball slowing due to friction illustrates Newton''s First Law (inertia) and the effect of an opposing force, not the action-reaction pairs described by the Third Law.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Rock Cycle', 'All of the following are types of rocks classified by their formation process EXCEPT:', '[{"key":"A","text":"Igneous"},{"key":"B","text":"Sedimentary"},{"key":"C","text":"Metamorphic"},{"key":"D","text":"Synthetic"}]'::jsonb, 'D', 'The three natural rock classifications based on formation are igneous, sedimentary, and metamorphic; "synthetic" is not a recognized natural rock type.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Ecology', 'All of the following describe a food chain relationship EXCEPT:', '[{"key":"A","text":"Grass is eaten by a grasshopper"},{"key":"B","text":"A grasshopper is eaten by a frog"},{"key":"C","text":"A frog is eaten by a snake"},{"key":"D","text":"A snake sheds its skin as it grows"}]'::jsonb, 'D', 'Shedding skin is a biological process unrelated to feeding relationships; the other options describe predator-prey energy transfer links in a food chain.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Atomic Structure', 'An atom of an element has 17 protons and 18 neutrons. What is its mass number?', '[{"key":"A","text":"17"},{"key":"B","text":"18"},{"key":"C","text":"35"},{"key":"D","text":"1"}]'::jsonb, 'C', 'Mass number = number of protons + number of neutrons = 17 + 18 = 35.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Waves', 'A sound wave has a frequency of 20 Hz and a wavelength of 17 meters. What is its approximate speed?', '[{"key":"A","text":"170 m/s"},{"key":"B","text":"340 m/s"},{"key":"C","text":"0.85 m/s"},{"key":"D","text":"37 m/s"}]'::jsonb, 'B', 'Wave speed = frequency x wavelength = 20 x 17 = 340 m/s, consistent with the approximate speed of sound in air.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Photosynthesis', 'Which of the following is a raw material required for photosynthesis?', '[{"key":"A","text":"Oxygen"},{"key":"B","text":"Carbon dioxide"},{"key":"C","text":"Glucose"},{"key":"D","text":"Nitrogen gas"}]'::jsonb, 'B', 'Photosynthesis uses carbon dioxide and water (with light energy) as raw materials to produce glucose and release oxygen as a byproduct.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - The Mole Concept', 'How many moles are there in 88 grams of carbon dioxide (CO2), given its molar mass is 44 g/mol?', '[{"key":"A","text":"1 mole"},{"key":"B","text":"2 moles"},{"key":"C","text":"4 moles"},{"key":"D","text":"0.5 moles"}]'::jsonb, 'B', 'Moles = mass / molar mass = 88 / 44 = 2 moles.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Electricity', 'A circuit has a voltage of 12 volts and a resistance of 4 ohms. What is the current flowing through it, according to Ohm''s Law?', '[{"key":"A","text":"3 amperes"},{"key":"B","text":"48 amperes"},{"key":"C","text":"8 amperes"},{"key":"D","text":"0.33 amperes"}]'::jsonb, 'A', 'Ohm''s Law: I = V / R = 12 / 4 = 3 amperes.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Plate Tectonics', 'Which type of plate boundary is most associated with the formation of new oceanic crust?', '[{"key":"A","text":"Convergent boundary"},{"key":"B","text":"Divergent boundary"},{"key":"C","text":"Transform boundary"},{"key":"D","text":"Subduction boundary"}]'::jsonb, 'B', 'At divergent boundaries, tectonic plates move apart and magma rises to fill the gap, forming new oceanic crust, as seen at mid-ocean ridges.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Human Body Systems', 'All of the following are components of the human circulatory system EXCEPT:', '[{"key":"A","text":"Heart"},{"key":"B","text":"Blood vessels"},{"key":"C","text":"Blood"},{"key":"D","text":"Alveoli"}]'::jsonb, 'D', 'Alveoli are tiny air sacs in the lungs, part of the respiratory system, not the circulatory system, which consists of the heart, blood vessels, and blood.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Bonding', 'What type of bond is formed when electrons are shared between two nonmetal atoms?', '[{"key":"A","text":"Ionic bond"},{"key":"B","text":"Covalent bond"},{"key":"C","text":"Metallic bond"},{"key":"D","text":"Hydrogen bond"}]'::jsonb, 'B', 'A covalent bond forms when two atoms, typically nonmetals, share electrons, as opposed to ionic bonds, which involve electron transfer.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Simple Machines', 'A lever has an effort arm of 3 meters and a load arm of 1 meter. If a load of 90 N is placed on the load arm, what minimum effort force is needed to balance it?', '[{"key":"A","text":"30 N"},{"key":"B","text":"90 N"},{"key":"C","text":"270 N"},{"key":"D","text":"15 N"}]'::jsonb, 'A', 'For a balanced lever: Effort x Effort arm = Load x Load arm. Effort x 3 = 90 x 1, so Effort = 90/3 = 30 N.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Classification', 'Which of the following is the correct order of biological classification, from broadest to most specific?', '[{"key":"A","text":"Kingdom, Phylum, Class, Order, Family, Genus, Species"},{"key":"B","text":"Species, Genus, Family, Order, Class, Phylum, Kingdom"},{"key":"C","text":"Kingdom, Class, Phylum, Order, Family, Genus, Species"},{"key":"D","text":"Phylum, Kingdom, Class, Family, Order, Genus, Species"}]'::jsonb, 'A', 'The standard taxonomic hierarchy from broadest to most specific is Kingdom, Phylum, Class, Order, Family, Genus, Species.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Water Cycle', 'All of the following are processes in the water cycle EXCEPT:', '[{"key":"A","text":"Evaporation"},{"key":"B","text":"Condensation"},{"key":"C","text":"Precipitation"},{"key":"D","text":"Photosynthesis"}]'::jsonb, 'D', 'Photosynthesis is a biological process for producing glucose, not a stage of the water cycle, which includes evaporation, condensation, and precipitation.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Solutions', 'A solution is prepared by dissolving 20 grams of salt in enough water to make 500 mL of solution. What is the concentration in grams per liter?', '[{"key":"A","text":"20 g/L"},{"key":"B","text":"40 g/L"},{"key":"C","text":"10 g/L"},{"key":"D","text":"4 g/L"}]'::jsonb, 'B', 'Concentration = mass / volume in liters = 20 g / 0.5 L = 40 g/L.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Heat Transfer', 'Which mode of heat transfer occurs through direct contact between particles, such as a metal spoon heating up in hot soup?', '[{"key":"A","text":"Conduction"},{"key":"B","text":"Convection"},{"key":"C","text":"Radiation"},{"key":"D","text":"Sublimation"}]'::jsonb, 'A', 'Conduction is heat transfer through direct contact between particles, as seen when a metal spoon heats up while touching hot soup.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Human Reproduction', 'All of the following are functions of the female reproductive system EXCEPT:', '[{"key":"A","text":"Producing egg cells"},{"key":"B","text":"Supporting fetal development during pregnancy"},{"key":"C","text":"Producing insulin to regulate blood sugar"},{"key":"D","text":"Producing estrogen and progesterone"}]'::jsonb, 'C', 'Insulin production is a function of the pancreas (endocrine system), not the female reproductive system, which is responsible for egg production, hormone secretion, and supporting pregnancy.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Gas Laws', 'A gas occupies 4 liters at a pressure of 2 atm. If the temperature is held constant and the pressure is increased to 8 atm, what is the new volume, according to Boyle''s Law?', '[{"key":"A","text":"16 liters"},{"key":"B","text":"1 liter"},{"key":"C","text":"2 liters"},{"key":"D","text":"8 liters"}]'::jsonb, 'B', 'Boyle''s Law: P1V1 = P2V2. (2)(4) = (8)(V2), so V2 = 8/8 = 1 liter.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Nervous System', 'Which part of the human brain is primarily responsible for coordinating balance and voluntary muscle movement?', '[{"key":"A","text":"Cerebrum"},{"key":"B","text":"Cerebellum"},{"key":"C","text":"Medulla oblongata"},{"key":"D","text":"Hypothalamus"}]'::jsonb, 'B', 'The cerebellum coordinates balance, posture, and fine voluntary muscle movements.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Earth Science - Astronomy', 'All of the following are inner (terrestrial) planets in our solar system EXCEPT:', '[{"key":"A","text":"Mercury"},{"key":"B","text":"Venus"},{"key":"C","text":"Mars"},{"key":"D","text":"Jupiter"}]'::jsonb, 'D', 'Jupiter is a gas giant and one of the outer planets, unlike Mercury, Venus, and Mars, which are rocky terrestrial inner planets.', 'easy', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Chemistry - Chemical Reactions', 'In the reaction CaCO3 -> CaO + CO2, what type of reaction is taking place?', '[{"key":"A","text":"Synthesis"},{"key":"B","text":"Decomposition"},{"key":"C","text":"Single replacement"},{"key":"D","text":"Double replacement"}]'::jsonb, 'B', 'One reactant (CaCO3) breaks down into two simpler products (CaO and CO2), which defines a decomposition reaction.', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Physics - Optics', 'Which type of lens causes light rays to converge and can be used to correct farsightedness?', '[{"key":"A","text":"Concave lens"},{"key":"B","text":"Convex lens"},{"key":"C","text":"Flat lens"},{"key":"D","text":"Cylindrical lens only"}]'::jsonb, 'B', 'A convex (converging) lens bends light rays inward to a focal point and is used to correct farsightedness (hyperopia).', 'medium', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';

insert into questions (subject_id, topic, prompt, choices, correct_answer, explanation, difficulty, source, is_ai_generated)
select s.id, 'Biology - Cell Division', 'All of the following occur during mitosis EXCEPT:', '[{"key":"A","text":"Chromosomes align at the cell''s equator"},{"key":"B","text":"Sister chromatids separate to opposite poles"},{"key":"C","text":"The nuclear envelope breaks down"},{"key":"D","text":"Crossing over occurs between homologous chromosomes"}]'::jsonb, 'D', 'Crossing over between homologous chromosomes occurs during meiosis I, not mitosis; mitosis produces genetically identical daughter cells without this exchange.', 'hard', 'Qualified AI-drafted (needs human review)', true
from subjects s join colleges c on c.id = s.college_id
where c.slug = 'dlsu' and s.slug = 'science';
