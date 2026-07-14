-- ==========================================================
-- GÖREV 1
-- Students Above the Overall Average
--
-- Find the students whose grade is higher than the overall
-- average grade of all enrollments.
--
-- Show:
-- - Student Name
-- - Course Name
-- - Grade
--
-- Requirements:
-- - Use a Scalar Subquery.
-- - Do NOT use GROUP BY.
--
-- Order by:
-- 1. Grade (Highest to Lowest)
-- 2. Student Name (A-Z)
-- ==========================================================

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



    -- ==========================================================
-- GÖREV 2
-- Courses Above the Average Credit
--
-- Find the courses whose credit is higher than the average
-- credit of all courses.
--
-- Show:
-- - Course Name
-- - Credit
-- - Department Name
--
-- Requirements:
-- - Use a Scalar Subquery.
-- - Do NOT use GROUP BY.
--
-- Order by:
-- 1. Credit (Highest to Lowest)
-- 2. Course Name (A-Z)
-- ==========================================================

SELECT
    c.course_name,
    c.credit,
    d.department_name

FROM Courses AS c

INNER JOIN Departments AS d
    ON c.department_id = d.department_id

WHERE
    c.credit >
    (
        SELECT AVG(credit)
        FROM Courses
    )

ORDER BY
    c.credit DESC,
    c.course_name ASC;



-- ==========================================================
-- GÖREV 3
-- Students Above the Overall Average Grade
--
-- Calculate the GPA of each student and list only the
-- students whose GPA is higher than the overall average
-- grade of all enrollments.
--
-- Show:
-- - Student Name
-- - GPA
--
-- Requirements:
-- - Use GROUP BY
-- - Use HAVING
-- - Use a Scalar Subquery
--
-- Order by:
-- 1. GPA (Highest to Lowest)
-- 2. Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    ROUND(AVG(e.grade), 2) AS gpa

FROM Students AS s

INNER JOIN Enrollments AS e
    ON s.student_id = e.student_id

GROUP BY
    s.student_id,
    s.full_name

HAVING
    AVG(e.grade) >
    (
        SELECT AVG(grade)
        FROM Enrollments
    )

ORDER BY
    gpa DESC,
    student_name ASC;



-- ==========================================================
-- GÖREV 4
-- Courses Above the Average Credit
--
-- List the courses whose credit is greater than the average
-- credit of all courses.
--
-- Show:
-- - Course Name
-- - Credit
-- - Instructor Name
--
-- Requirements:
-- - Use a Scalar Subquery.
-- - Do NOT use GROUP BY.
--
-- Order by:
-- 1. Credit (Highest to Lowest)
-- 2. Course Name (A-Z)
-- ==========================================================

SELECT
    c.course_name,
    c.credit,
    i.instructor_name

FROM Courses AS c

INNER JOIN Instructors AS i
    ON c.instructor_id = i.instructor_id

WHERE
    c.credit >
    (
        SELECT AVG(credit)
        FROM Courses
    )

ORDER BY
    c.credit DESC,
    c.course_name ASC;



    -- ==========================================================
-- GÖREV 5
-- Students Who Took Python Programming
--
-- Find all students who enrolled in the
-- "Python Programming" course.
--
-- Show:
-- - Student Name
-- - City
--
-- Requirements:
-- - Use a Multi-row Subquery with IN.
-- - Do NOT use JOIN in the main query.
-- - The course name must be found using a subquery.
--
-- Order by:
-- 1. Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    s.city

FROM Students AS s

WHERE s.student_id IN
(
    SELECT student_id
    FROM Enrollments
    WHERE course_id =
    (
        SELECT course_id
        FROM Courses
        WHERE course_name = 'Python Programming'
    )
)

ORDER BY
    student_name ASC;



    -- ==========================================================
-- GÖREV 6
-- Students in the Software Engineering Department
--
-- Find all students who enrolled in any course offered
-- by the Software Engineering department.
--
-- Show:
-- - Student Name
-- - City
--
-- Requirements:
-- - Use Multi-row Subqueries.
-- - Use IN.
-- - Do NOT use JOIN in the main query.
-- - Do NOT hard-code department_id.
--
-- Order by:
-- 1. Student Name (A-Z)
-- ==========================================================

-- ==========================================================
-- GÖREV 6
-- Students in the Software Engineering Department
--
-- Find all students who enrolled in any course offered
-- by the Software Engineering department.
--
-- Show:
-- - Student Name
-- - City
--
-- Requirements:
-- - Use Multi-row Subqueries.
-- - Use IN.
-- - Do NOT use JOIN in the main query.
-- - Do NOT hard-code department_id.
--
-- Order by:
-- 1. Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    s.city

FROM Students AS s

WHERE s.student_id IN
(
    SELECT student_id
    FROM Enrollments
    WHERE course_id IN
    (
        SELECT course_id
        FROM Courses
        WHERE department_id =
        (
            SELECT department_id
            FROM Departments
            WHERE department_name = 'Software Engineering'
        )
    )
)

ORDER BY
    student_name ASC;



-- ==========================================================
-- GÖREV 7
-- Students Who Never Took Database Systems
--
-- Find all students who have never enrolled in the
-- "Database Systems" course.
--
-- Show:
-- - Student Name
-- - City
--
-- Requirements:
-- - Use NOT IN.
-- - Use a Multi-row Subquery.
-- - Do NOT use JOIN in the main query.
-- - The course name must be found using a subquery.
--
-- Order by:
-- 1. Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    s.city

FROM Students AS s

WHERE s.student_id NOT IN
(
    SELECT student_id
    FROM Enrollments
    WHERE course_id =
    (
        SELECT course_id
        FROM Courses
        WHERE course_name = 'Database Systems'
    )
)

ORDER BY
    student_name ASC;



-- ==========================================================
-- GÖREV 8
-- Students Above Their Course Average
--
-- Find the students whose grade is higher than the average
-- grade of the course they are enrolled in.
--
-- Show:
-- - Student Name
-- - Course Name
-- - Grade
--
-- Requirements:
-- - Use a Correlated Subquery.
-- - Do NOT use GROUP BY in the main query.
--
-- Order by:
-- 1. Grade (Highest to Lowest)
-- 2. Student Name (A-Z)
-- ==========================================================

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
        SELECT AVG(e2.grade)
        FROM Enrollments AS e2
        WHERE e2.course_id = e.course_id
    )

ORDER BY
    e.grade DESC,
    student_name ASC;



-- ==========================================================
-- GÖREV 9
-- Students Above Their City Average
--
-- Find the students whose average grade is higher than
-- the average grade of students from the same city.
-- ==========================================================

SELECT
    s.full_name AS student_name,
    s.city,
    ROUND(AVG(e.grade), 2) AS gpa

FROM Students AS s

INNER JOIN Enrollments AS e
    ON s.student_id = e.student_id

GROUP BY
    s.student_id,
    s.full_name,
    s.city

HAVING
    AVG(e.grade) >
    (
        SELECT AVG(e2.grade)
        FROM Students AS s2

        INNER JOIN Enrollments AS e2
            ON s2.student_id = e2.student_id

        WHERE s2.city = s.city
    )

ORDER BY
    gpa DESC,
    student_name ASC;



    -- ==========================================================
-- GÖREV 10
-- Students With At Least One Enrollment
--
-- Find all students who have enrolled in at least
-- one course.
--
-- Show:
-- - Student Name
-- - City
--
-- Requirements:
-- - Use EXISTS.
-- - Use a Correlated Subquery.
-- - Do NOT use JOIN in the main query.
--
-- Order by:
-- 1. Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    s.city

FROM Students AS s

WHERE EXISTS
(
    SELECT *
    FROM Enrollments AS e
    WHERE e.student_id = s.student_id
)

ORDER BY
    student_name ASC;



    -- ==========================================================
-- GÖREV 11
-- Students Without Any Enrollment
--
-- Find all students who have never enrolled in
-- any course.
--
-- Show:
-- - Student Name
-- - City
--
-- Requirements:
-- - Use NOT EXISTS.
-- - Use a Correlated Subquery.
-- - Do NOT use JOIN in the main query.
--
-- Order by:
-- 1. Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    s.city

FROM Students AS s

WHERE NOT EXISTS
(
    SELECT 1
    FROM Enrollments AS e
    WHERE e.student_id = s.student_id
)

ORDER BY
    student_name ASC;

