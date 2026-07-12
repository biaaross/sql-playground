-- ==========================================================
-- GÖREV 1
-- Student Report
--
-- List all students with their enrolled courses.
--
-- Show:
-- - Student Name
-- - City
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
    s.city,
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
    student_name ASC;



    -- ==========================================================
-- GÖREV 2
-- Students from Ankara
--
-- List students who live in Ankara.
--
-- Show:
-- - Student Name
-- - City
-- - Course Name
-- - Department Name
-- - Grade
--
-- Conditions:
-- - City must be 'Ankara'
-- - Grade must be 70 or higher
--
-- Order by:
-- 1. Grade (Highest to Lowest)
-- 2. Student Name (A-Z)
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
    
WHERE s.city = 'Ankara' AND e.grade >=70

ORDER BY
    e.grade DESC,
    student_name ASC;



-- ==========================================================
-- GÖREV 3
-- Department Course Statistics
--
-- Count the number of courses in each department.
--
-- Show:
-- - Department Name
-- - Total Courses
--
-- Include departments with no courses.
--
-- Order by:
-- 1. Total Courses (Highest to Lowest)
-- 2. Department Name (A-Z)
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
    total_courses DESC,
    d.department_name ASC;



    -- ==========================================================
-- GÖREV 4
-- Instructor Course Report
--
-- Count the number of courses taught by each instructor.
--
-- Show:
-- - Instructor Name
-- - Total Courses
--
-- Include instructors with no courses.
--
-- Order by:
-- 1. Total Courses (Highest to Lowest)
-- 2. Instructor Name (A-Z)
-- ==========================================================

SELECT
    i.instructor_name,
    COUNT(c.course_id) AS total_courses

FROM Instructors AS i

LEFT JOIN Courses AS c
    ON c.instructor_id = i.instructor_id

GROUP BY
    i.instructor_id,
    i.instructor_name

ORDER BY
    total_courses DESC,
    i.instructor_name ASC;



-- ==========================================================
-- GÖREV 5
-- Student Course Report
--
-- Count the number of courses taken by each student.
--
-- Show:
-- - Student Name
-- - Total Courses
--
-- Only include students who have taken
-- at least 3 courses.
--
-- Order by:
-- 1. Total Courses (Highest to Lowest)
-- 2. Student Name (A-Z)
-- ==========================================================


SELECT
    s.full_name AS student_name,
    COUNT(c.course_id) AS total_courses

FROM Students AS s

LEFT JOIN Enrollments AS e
    ON s.student_id = e.student_id

LEFT JOIN Courses AS c
    ON e.course_id = c.course_id

GROUP BY
    s.student_id,
    s.full_name

HAVING
    COUNT(c.course_id) >= 3

ORDER BY
    total_courses DESC,
    student_name ASC;



-- ==========================================================
-- GÖREV 6
-- Student GPA Report
--
-- Calculate the GPA of each student.
--
-- Show:
-- - Student Name
-- - GPA
--
-- Conditions:
-- - Only include students whose GPA is 80 or higher.
-- - Round the GPA to 2 decimal places.
--
-- Order by:
-- 1. GPA (Highest to Lowest)
-- 2. Student Name (A-Z)
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

HAVING
    AVG(e.grade) >= 80

ORDER BY
    gpa DESC,
    student_name ASC;



-- ==========================================================
-- GÖREV 7
-- Top 5 Highest Credit Courses
--
-- List the top 5 courses with the highest credits.
--
-- Show:
-- - Course Name
-- - Credit
-- - Department Name
-- - Instructor Name
--
-- Order by:
-- 1. Credit (Highest to Lowest)
-- 2. Course Name (A-Z)
--
-- Return only the first 5 records.
-- ==========================================================



SELECT
    c.course_name,
    c.credit,
    d.department_name,
    i.instructor_name

FROM Courses AS c

INNER JOIN Departments AS d
    ON c.department_id = d.department_id

INNER JOIN Instructors AS i
    ON c.instructor_id = i.instructor_id

ORDER BY
    c.credit DESC,
    c.course_name ASC

LIMIT 5;



-- ==========================================================
-- GÖREV 8
-- Department Credit Report
--
-- Calculate the total credits for each department.
--
-- Show:
-- - Department Name
-- - Total Credits
--
-- Include departments with no courses.
--
-- Order by:
-- 1. Total Credits (Highest to Lowest)
-- 2. Department Name (A-Z)
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
-- GÖREV 9
-- Student Academic Performance Report
--
-- Generate an academic report for each student.
--
-- Show:
-- - Student Name
-- - City
-- - Total Courses
-- - Total Credits
-- - GPA
--
-- Conditions:
-- - Include all students.
--
-- Order by:
-- 1. GPA (Highest to Lowest)
-- 2. Total Credits (Highest to Lowest)
-- 3. Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    s.city,
    COUNT(c.course_id) AS total_courses,
    SUM(c.credit) AS total_credits,
    ROUND(AVG(e.grade), 2) AS gpa

FROM Students AS s

LEFT JOIN Enrollments AS e
    ON s.student_id = e.student_id

LEFT JOIN Courses AS c
    ON e.course_id = c.course_id

GROUP BY
    s.student_id,
    s.full_name,
    s.city

ORDER BY
    gpa DESC,
    total_credits DESC,
    student_name ASC;



-- ==========================================================
-- GÖREV 10
-- Instructor Performance Report
--
-- Generate a performance report for each instructor.
--
-- Show:
-- - Instructor Name
-- - Total Courses
-- - Total Students
-- - Average Grade
--
-- Include instructors with no courses.
--
-- Order by:
-- 1. Average Grade (Highest to Lowest)
-- 2. Total Students (Highest to Lowest)
-- 3. Instructor Name (A-Z)
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
-- GÖREV 11
-- Top Performing Departments
--
-- Generate a report for each department.
--
-- Show:
-- - Department Name
-- - Total Courses
-- - Total Students
-- - Average Grade
--
-- Include departments with no courses.
--
-- Order by:
-- 1. Average Grade (Highest to Lowest)
-- 2. Total Students (Highest to Lowest)
-- 3. Department Name (A-Z)
-- ==========================================================

SELECT
    d.department_name,
    COUNT(DISTINCT c.course_id) AS total_courses,
    COUNT(e.student_id) AS total_students,
    ROUND(AVG(e.grade), 2) AS average_grade

FROM Departments AS d

LEFT JOIN Courses AS c
    ON d.department_id = c.department_id

LEFT JOIN Enrollments AS e
    ON c.course_id = e.course_id

GROUP BY
    d.department_id,
    d.department_name

ORDER BY
    average_grade DESC,
    total_students DESC,
    d.department_name ASC;



-- ==========================================================
-- GÖREV 12
-- Student Scholarship Evaluation Report
--
-- Generate a report to evaluate students for scholarships.
--
-- Show:
-- - Student Name
-- - Department Name
-- - Total Courses
-- - Total Credits
-- - GPA
--
-- Conditions:
-- - Only include students who have taken at least 4 courses.
-- - Only include students whose GPA is 75 or higher.
--
-- Order by:
-- 1. GPA (Highest to Lowest)
-- 2. Total Credits (Highest to Lowest)
-- 3. Student Name (A-Z)
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

HAVING
    COUNT(DISTINCT c.course_id) >= 4
    AND AVG(e.grade) >= 75

ORDER BY
    gpa DESC,
    total_credits DESC,
    student_name ASC;



    -- ==========================================================
-- GÖREV 13
-- Instructor Workload Report
--
-- Generate a workload report for each instructor.
--
-- Show:
-- - Instructor Name
-- - Total Courses
-- - Total Credits
-- - Total Students
--
-- Conditions:
-- - Include only instructors who teach at least 2 courses.
--
-- Order by:
-- 1. Total Students (Highest to Lowest)
-- 2. Total Credits (Highest to Lowest)
-- 3. Instructor Name (A-Z)
-- ==========================================================

SELECT
    i.instructor_name,
    COUNT(DISTINCT c.course_id) AS total_courses,
    SUM(c.credit) AS total_credits,
    COUNT(e.student_id) AS total_students

FROM Instructors AS i

LEFT JOIN Courses AS c
    ON i.instructor_id = c.instructor_id

LEFT JOIN Enrollments AS e
    ON c.course_id = e.course_id

GROUP BY
    i.instructor_id,
    i.instructor_name

HAVING
    COUNT(DISTINCT c.course_id) >= 2

ORDER BY
    total_students DESC,
    total_credits DESC,
    i.instructor_name ASC;



    -- ==========================================================
-- GÖREV 14
-- Department Academic Summary
--
-- Generate an academic summary for each department.
--
-- Show:
-- - Department Name
-- - Total Courses
-- - Total Credits
-- - Average Grade
--
-- Include departments with no courses.
--
-- Order by:
-- 1. Average Grade (Highest to Lowest)
-- 2. Total Credits (Highest to Lowest)
-- 3. Department Name (A-Z)
-- ==========================================================

SELECT
    d.department_name,
    COUNT(DISTINCT c.course_id) AS total_courses,
    SUM(c.credit) AS total_credits,
    ROUND(AVG(e.grade), 2) AS average_grade

FROM Departments AS d

LEFT JOIN Courses AS c
    ON d.department_id = c.department_id

LEFT JOIN Enrollments AS e
    ON c.course_id = e.course_id

GROUP BY
    d.department_id,
    d.department_name

ORDER BY
    average_grade DESC,
    total_credits DESC,
    d.department_name ASC;



    -- ==========================================================
-- GÖREV 15
-- Student Achievement Report
--
-- Generate a report showing students with strong academic
-- performance.
--
-- Show:
-- - Student Name
-- - City
-- - Department Name
-- - Total Courses
-- - GPA
--
-- Conditions:
-- - GPA must be at least 80.
-- - Student must have taken at least 3 courses.
--
-- Order by:
-- 1. GPA (Highest to Lowest)
-- 2. Total Courses (Highest to Lowest)
-- 3. Student Name (A-Z)
-- ==========================================================

SELECT
    s.full_name AS student_name,
    s.city,
    d.department_name,
    COUNT(DISTINCT c.course_id) AS total_courses,
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
    s.city,
    d.department_name

HAVING
    COUNT(DISTINCT c.course_id) >= 3
    AND AVG(e.grade) >= 80

ORDER BY
    gpa DESC,
    total_courses DESC,
    student_name ASC;




