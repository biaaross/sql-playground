-- ==========================================================
-- University Database SQL Practice
-- ==========================================================
--
-- Author      : Arda
-- Database    : SQLite
--
-- Topics Covered
-- ----------------------------------------------------------
-- ✔ SELECT
-- ✔ WHERE
-- ✔ ORDER BY
-- ✔ LIMIT
-- ✔ INNER JOIN
-- ✔ LEFT JOIN
-- ✔ GROUP BY
-- ✔ COUNT()
-- ✔ SUM()
-- ✔ AVG()
-- ✔ DISTINCT
--
-- Total Queries : 15
-- ==========================================================



-- ==========================================================
-- GÖREV 01
-- List all students with their course information.
--
-- Show:
-- - Student Name
-- - Course Name
-- - Department Name
-- - Instructor Name
-- - Credit
-- - Semester
-- - Grade
--
-- Order by Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    c.course_name,
    d.department_name,
    i.instructor_name,
    c.credit,
    e.semester,
    e.grade
FROM Students AS s

INNER JOIN Enrollments AS e
    ON s.student_id = e.student_id

INNER JOIN Courses AS c
    ON e.course_id = c.course_id

INNER JOIN Departments AS d
    ON c.department_id = d.department_id

INNER JOIN Instructors AS i
    ON c.instructor_id = i.instructor_id

ORDER BY
    s.full_name ASC;



-- ==========================================================
-- GÖREV 02
-- List courses taken by students living in Ankara.
--
-- Show:
-- - Student Name
-- - City
-- - Course Name
-- - Department Name
-- - Grade
--
-- Filter:
-- - Only students living in Ankara
--
-- Order by Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    s.city,
    c.course_name,
    d.department_name,
    e.grade
FROM Students AS s

INNER JOIN Enrollments AS e
    ON s.student_id = e.student_id

INNER JOIN Courses AS c
    ON e.course_id = c.course_id

INNER JOIN Departments AS d
    ON c.department_id = d.department_id

WHERE
    s.city = 'Ankara'

ORDER BY
    s.full_name ASC;



-- ==========================================================
-- GÖREV 03
-- Count the number of courses in each department.
--
-- Show:
-- - Department Name
-- - Total Courses
--
-- Include departments with no courses.
--
-- Order by Department Name (A-Z)
-- ==========================================================

SELECT
    d.department_name,
    COUNT(c.course_id) AS total_courses
FROM Departments AS d

LEFT JOIN Courses AS c
    ON d.department_id = c.department_id

GROUP BY
    d.department_id,
    d.department_name

ORDER BY
    d.department_name ASC;



    -- ==========================================================
-- GÖREV 04
-- Count the number of courses taught by each instructor.
--
-- Show:
-- - Instructor Name
-- - Total Courses
--
-- Include instructors with no courses.
--
-- Order by:
-- - Instructor Name (A-Z)
-- ==========================================================

SELECT
    i.instructor_name,
    COUNT(c.course_id) AS total_courses
FROM Instructors AS i

LEFT JOIN Courses AS c
    ON i.instructor_id = c.instructor_id

GROUP BY
    i.instructor_id,
    i.instructor_name

ORDER BY
    i.instructor_name ASC;



-- ==========================================================
-- GÖREV 05
-- Count the number of courses taken by each student.
--
-- Show:
-- - Student Name
-- - Total Courses
--
-- Include students who have not enrolled in any course.
--
-- Order by:
-- - Total Courses (DESC)
-- - Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    COUNT(e.course_id) AS total_courses
FROM Students AS s

LEFT JOIN Enrollments AS e
    ON s.student_id = e.student_id

GROUP BY
    s.student_id,
    s.full_name

ORDER BY
    total_courses DESC,
    student_name ASC;



    -- ==========================================================
-- GÖREV 06
-- Calculate the GPA of each student.
--
-- Show:
-- - Student Name
-- - GPA
--
-- Round GPA to 2 decimal places.
--
-- Include students with no enrollments.
--
-- Order by:
-- - GPA (DESC)
-- - Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    ROUND(AVG(e.grade), 2) AS gpa
FROM Students AS s

LEFT JOIN Enrollments AS e
    ON s.student_id = e.student_id

GROUP BY
    s.student_id,
    s.full_name

ORDER BY
    gpa DESC,
    student_name ASC;



-- ==========================================================
-- GÖREV 07
-- Find the course with the highest credit.
--
-- Show:
-- - Course Name
-- - Credit
-- - Instructor Name
--
-- Order by:
-- - Credit (DESC)
-- - Course Name (A-Z)
--
-- Return only one record.
-- ==========================================================

SELECT
    c.course_name,
    c.credit,
    i.instructor_name
FROM Courses AS c

INNER JOIN Instructors AS i
    ON c.instructor_id = i.instructor_id

ORDER BY
    c.credit DESC,
    c.course_name ASC

LIMIT 1;



-- ==========================================================
-- GÖREV 08
-- Find the most popular course.
--
-- Show:
-- - Course Name
-- - Student Count
--
-- The most popular course is the one taken
-- by the highest number of students.
--
-- Order by:
-- - Student Count (DESC)
-- - Course Name (A-Z)
--
-- Return only one record.
-- ==========================================================

SELECT
    c.course_name,
    COUNT(e.student_id) AS student_count
FROM Courses AS c

INNER JOIN Enrollments AS e
    ON c.course_id = e.course_id

GROUP BY
    c.course_id,
    c.course_name

ORDER BY
    student_count DESC,
    c.course_name ASC

LIMIT 1;



-- ==========================================================
-- GÖREV 09
-- Calculate total credits for each department.
--
-- Show:
-- - Department Name
-- - Total Credits
--
-- Include departments with no courses.
--
-- Order by:
-- - Total Credits (DESC)
-- - Department Name (A-Z)
-- ==========================================================

SELECT
    d.department_name,
    SUM(c.credit) AS total_credits
FROM Departments AS d

LEFT JOIN Courses AS c
    ON d.department_id = c.department_id

GROUP BY
    d.department_id,
    d.department_name

ORDER BY
    total_credits DESC,
    d.department_name ASC;



-- ==========================================================
-- GÖREV 10
-- Student Academic Report
--
-- Show:
-- - Student Name
-- - City
-- - Total Courses
-- - GPA
--
-- Include students with no enrollments.
--
-- Round GPA to 2 decimal places.
--
-- Order by:
-- - GPA (DESC)
-- - Total Courses (DESC)
-- - Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    s.city,
    COUNT(e.course_id) AS total_courses,
    ROUND(AVG(e.grade), 2) AS gpa
FROM Students AS s

LEFT JOIN Enrollments AS e
    ON s.student_id = e.student_id

GROUP BY
    s.student_id,
    s.full_name,
    s.city

ORDER BY
    gpa DESC,
    total_courses DESC,
    student_name ASC;



    -- ==========================================================
-- GÖREV 11
-- Instructor Performance Report
--
-- Show:
-- - Instructor Name
-- - Total Courses
-- - Total Students
-- - Average Grade
--
-- Include instructors with no courses.
--
-- Round average grade to 2 decimal places.
--
-- Order by:
-- - Average Grade (DESC)
-- - Total Students (DESC)
-- - Instructor Name (A-Z)
-- ==========================================================

SELECT
    i.instructor_name,
    COUNT(DISTINCT c.course_id) AS total_courses,
    COUNT(e.student_id) AS total_students,
    ROUND(AVG(e.grade), 2) AS average_grade
FROM Instructors AS i

LEFT JOIN Courses AS c
    ON i.instructor_id = c.instructor_id

LEFT JOIN Enrollments AS e
    ON c.course_id = e.course_id

GROUP BY
    i.instructor_id,
    i.instructor_name

ORDER BY
    average_grade DESC,
    total_students DESC,
    instructor_name ASC;



-- ==========================================================
-- GÖREV 12
-- Student Performance Dashboard
--
-- Show:
-- - Student Name
-- - Department Name
-- - Total Courses
-- - Total Credits
-- - GPA
--
-- Include students with no enrollments.
--
-- Round GPA to 2 decimal places.
--
-- Order by:
-- - GPA (DESC)
-- - Total Credits (DESC)
-- - Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    d.department_name,
    COUNT(DISTINCT c.course_id) AS total_courses,
    SUM(c.credit) AS total_credits,
    ROUND(AVG(e.grade), 2) AS gpa
FROM Students AS s

LEFT JOIN Enrollments AS e
    ON s.student_id = e.student_id

LEFT JOIN Courses AS c
    ON e.course_id = c.course_id

LEFT JOIN Departments AS d
    ON c.department_id = d.department_id

GROUP BY
    s.student_id,
    s.full_name,
    d.department_name

ORDER BY
    gpa DESC,
    total_credits DESC,
    student_name ASC;



-- ==========================================================
-- GÖREV 13
-- Find the Course with the Lowest Credit
--
-- Show:
-- - Course Name
-- - Credit
-- - Department Name
--
-- Order by:
-- - Credit (ASC)
-- - Course Name (A-Z)
--
-- Return only one record.
-- ==========================================================

SELECT
    c.course_name,
    c.credit,
    d.department_name
FROM Courses AS c

INNER JOIN Departments AS d
    ON c.department_id = d.department_id

ORDER BY
    c.credit ASC,
    c.course_name ASC

LIMIT 1;



-- ==========================================================
-- GÖREV 14
-- Find the Student with the Highest Grade
--
-- Show:
-- - Student Name
-- - Course Name
-- - Grade
--
-- Order by:
-- - Grade (DESC)
-- - Student Name (A-Z)
--
-- Return only one record.
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

ORDER BY
    e.grade DESC,
    s.full_name ASC

LIMIT 1;



-- ==========================================================
-- GÖREV 15
-- List All Different Student Cities
--
-- Show:
-- - City
--
-- List each city only once.
--
-- Order by:
-- - City (A-Z)
-- ==========================================================

SELECT DISTINCT
    s.city
FROM Students AS s

ORDER BY
    s.city ASC;