--(a)
SELECT s_last, grade
FROM student JOIN enrollment USING (s_id)
WHERE grade IS NOT NULL;

--(b)
SELECT course_name, term_desc, f_last, room, bldg_code
FROM course, term, faculty, location, course_section
WHERE course_section.course_id = course.course_id
AND course_section.term_id = term.term_id
AND course_section.f_id = faculty.f_id
AND course_section.loc_id = location.loc_id;

--(c)
SELECT f_last, term_desc, course_name, room, bldg_code
FROM course_section JOIN term ON course_section.term_id = term.term_id
					JOIN faculty ON course_section.f_id = faculty.f_id
					JOIN location ON course_section.loc_id = location.loc_id
					JOIN course ON course_section.course_id = course.course_id;

--(d)
SELECT f_last, term_desc, course_name, room, bldg_code
FROM course_section JOIN term USING(term_id)
          					JOIN location USING(loc_id)
          					JOIN course USING(course_id)
          					JOIN faculty USING(f_id);
--(e)
SELECT f_last, max_enrl
FROM faculty JOIN course_section USING (f_id);

--(f)
SELECT loc_id, bldg_code, room, COUNT(c_sec_id)
FROM location JOIN course_section USING(loc_id)
GROUP by loc_id;

--(g)
SELECT c1.preq, c2.course_name
FROM course c1, course c2
WHERE c1.preq = c2.course_id;

--(h)
SELECT f1.f_first, f1.f_last
FROM faculty f1, faculty f2
WHERE f1.f_rank = f2.f_rank
AND f1.f_first != 'Kim'
AND f1.f_last != 'Cox'
AND f2.f_id <> f1.f_id;

--(i)
SELECT DISTINCT s1.s_last
FROM student s1, student s2
WHERE s1.s_city = s2.s_city
AND s1.s_id <> s2.s_id;

--(j)
SELECT DISTINCT s1.s_last
FROM student s1, student s2
WHERE s1.f_id = s2.f_id
AND s1.s_last != 'Miller'
AND s1.s_id <> s2.s_id;
