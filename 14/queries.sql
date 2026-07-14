-- ==========================================================
-- GÖREV 1

-- Students Above the Overall Average

-- List the students whose grade is higher than the overall
-- average grade of all enrollments.

-- Show:
-- - Student Name
-- - Course Name
-- - Grade

-- Requirements:
-- - Use a Scalar Subquery.
-- - Use INNER JOIN.
-- -Do NOT use GROUP BY.

-- Order by:
-- 1. Grade (Highest to Lowest)
-- 2. Student Name (A-Z)
-- =========================================================="

SELECT
    s.full_name AS student_name,
    c.course_name,
    e.grade

FROM Students AS s

INNER JOIN Enrollments AS e
    ON s.student_id = e.student_id

INNER JOIN Courses AS c
    ON e.course_id = c.course_id

WHERE
    e.grade >
    (
        SELECT AVG(grade)
        FROM Enrollments
    )

ORDER BY
    e.grade DESC,
    student_name ASC;



    /*
==========================================================
TASK 2

Students Enrolled in Computer Science Department Courses

List all students who are enrolled in any course offered
by the Computer Science department.

Show:
- Student Name
- City

Requirements:
- Use a Multi-row Subquery.
- Use IN.
- Do NOT use JOIN in the main query.
- Do NOT hard-code the department_id.

Order by:
1. Student Name (A-Z)
==========================================================
*/

SELECT
    s.full_name AS student_name,
    s.city

FROM Students AS s

WHERE s.student_id IN
(
    SELECT e.student_id
    FROM Enrollments AS e
    WHERE e.course_id IN
    (
        SELECT c.course_id
        FROM Courses AS c
        WHERE c.department_id =
        (
            SELECT d.department_id
            FROM Departments AS d
            WHERE d.department_name = 'Computer Science'
        )
    )
)

ORDER BY
    student_name ASC;



    /*
==========================================================
TASK 3

Students Who Never Took Database Systems

List all students who have never enrolled in the
"Database Systems" course.

Show:
- Student Name
- City

Requirements:
- Use a Multi-row Subquery.
- Use NOT IN.
- Do NOT use JOIN in the main query.
- Do NOT hard-code the course_id.

Order by:
1. Student Name (A-Z)
==========================================================
*/


SELECT
    s.full_name AS student_name,
    s.city

FROM Students AS s

WHERE s.student_id NOT IN
(
    SELECT e.student_id
    FROM Enrollments AS e
    WHERE e.course_id =
    (
        SELECT c.course_id
        FROM Courses AS c
        WHERE c.course_name = 'Database Systems'
    )
)

ORDER BY
    student_name ASC;



    /*
==========================================================
TASK 4

Students Above Their Course Average

List all students whose grade is higher than the
average grade of the course they are enrolled in.

Show:
- Student Name
- Course Name
- Grade

Requirements:
- Use a Correlated Subquery.
- Use INNER JOIN.
- Do NOT use GROUP BY in the main query.

Order by:
1. Grade (Highest to Lowest)
2. Student Name (A-Z)
==========================================================
*/

SELECT 
    s.full_name AS student_name,
    c.course_name,
    e.grade

FROM Students AS s

INNER JOIN Enrollments AS e
    ON s.student_id = e.student_id

INNER JOIN Courses AS c
    ON e.course_id = c.course_id

WHERE e.grade >
(
    SELECT AVG(e2.grade)
    FROM Enrollments AS e2
    WHERE e2.course_id = e.course_id
)

ORDER BY 
    e.grade DESC,
    s.student_name ASC



    /*
==========================================================
TASK 5

Instructors Teaching At Least One Course

List all instructors who teach at least one course.

Show:
- Instructor Name

Requirements:
- Use EXISTS.
- Use a Correlated Subquery.
- Do NOT use JOIN in the main query.

Order by:
1. Instructor Name (A-Z)
==========================================================
*/

SELECT
    i.instructor_name

FROM Instructors AS i

WHERE EXISTS
(
    SELECT 1
    FROM Courses AS c
    WHERE c.instructor_id = i.instructor_id
)

ORDER BY
    i.instructor_name ASC;



    /*
==========================================================
TASK 6

Departments Without Any Courses

List all departments that do not offer any courses.

Show:
- Department Name

Requirements:
- Use NOT EXISTS.
- Use a Correlated Subquery.
- Do NOT use JOIN in the main query.

Order by:
1. Department Name (A-Z)
==========================================================
*/

SELECT
    d.department_name

FROM Departments AS d

WHERE NOT EXISTS
(
    SELECT 1
    FROM Courses AS c
    WHERE c.department_id = d.department_id
)

ORDER BY
    d.department_name ASC;



    /*
==========================================================
TASK 7

Students Who Have the Highest Grade
in Their Own Course

List the students who have the highest grade
in the course they are enrolled in.

Show:
- Student Name
- Course Name
- Grade

Requirements:
- Use a Correlated Subquery.
- Use MAX().
- Use INNER JOIN.
- Do NOT use GROUP BY in the main query.

Order by:
1. Course Name (A-Z)
2. Student Name (A-Z)
==========================================================
*/

SELECT 
    s.full_name AS student_name,
    c.course_name,
    e.grade

FROM students AS s

INNER JOIN Enrollments AS e
    ON s.student_id = e.student_id

INNER JOIN Courses AS c
    ON e.course_id = c.course_id

WHERE e.grade =
(
    SELECT MAX(e2.grade)
    FROM Enrollments AS e2
    WHERE e2.course_id = e.course_id
)

ORDER BY 
    c.course_name ASC, 
    s.student_name ASC



/*
==========================================================
TASK 8

Students Taking More Courses Than
the Overall Average

List students who are enrolled in more courses than the
average number of courses taken by all students.

Show:
- Student Name
- Total Courses

Requirements:
- Use a Correlated Subquery.
- Use COUNT().
- Use a Scalar Subquery.
- Do NOT use GROUP BY in the main query.

Order by:
1. Total Courses (Highest to Lowest)
2. Student Name (A-Z)
==========================================================
*/



/*
==========================================================
TASK 8

Students Taking More Courses Than
the Overall Average

List students who are enrolled in more courses than the
average number of courses taken by all students.

Show:
- Student Name
- Total Courses

Requirements:
- Use a Correlated Subquery.
- Use COUNT().
- Use a Scalar Subquery.
- Do NOT use GROUP BY in the main query.

Order by:
1. Total Courses (Highest to Lowest)
2. Student Name (A-Z)
==========================================================
*/

SELECT 
    s.full_name AS student_name,
      (
        SELECT COUNT(*)
        FROM Enrollments AS e
        WHERE e.student_id = s.student_id
    ) AS total_courses

FROM Students AS s

WHERE
(
    SELECT COUNT(*)
    FROM Enrollments AS e
    WHERE e.student_id = s.student_id
)
>
(
        SELECT AVG(course_count)
    FROM
    (
        SELECT
            COUNT(*) AS course_count
        FROM Enrollments
        GROUP BY student_id
    ) AS student_course_counts
)

ORDER BY
    total_courses DESC,
    student_name ASC;


