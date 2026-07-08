-- Patches lesson sort_order for the 3 lessons that were out of numerical order in the
-- original topics.docx (Circles I/II, Motion Problems I/II, Business Math Problems I/II).
-- Safe to run any time — updates existing rows in place, no duplicates created.

update lessons l
set sort_order = x.new_order
from modules mo
join subject_areas sa on sa.id = mo.subject_area_id,
(values
  ('circles-i-measure-of-angles', 2),
  ('measurements-of-geometric-angles', 3),
  ('mensuration', 4),
  ('circles-ii-measure-of-segments', 5)
) as x(slug, new_order)
where l.module_id = mo.id
  and sa.scope = 'general' and sa.slug = 'mathematics' and mo.slug = 'geometry'
  and l.slug = x.slug;

update lessons l
set sort_order = x.new_order
from modules mo
join subject_areas sa on sa.id = mo.subject_area_id,
(values
  ('motion-problems-i', 0),
  ('motion-problems-ii', 1),
  ('number-problems', 2),
  ('business-math-problems-i', 3),
  ('age-problems', 4),
  ('work-problems', 5),
  ('mixture-and-solution-problems', 6),
  ('business-math-problems-ii', 7)
) as x(slug, new_order)
where l.module_id = mo.id
  and sa.scope = 'general' and sa.slug = 'mathematics' and mo.slug = 'word-problems'
  and l.slug = x.slug;
