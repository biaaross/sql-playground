/*
==========================================================
TASK 3

Department Performance Report

The university administration wants to evaluate
the performance of each department.

Show:
- Department Name
- Total Courses
- Average Grade

Requirements:
- Use INNER JOIN.
- Use GROUP BY.
- Use HAVING.
- Use AVG().
- Use COUNT(DISTINCT ...).

Only show departments whose average grade is
greater than or equal to 75.

Order by:
1. Average Grade (Highest to Lowest)
2. Total Courses (Highest to Lowest)
3. Department Name (A-Z)
==========================================================
*/



SELECT
    d.department_name,
    COUNT(DISTINCT c.course_id) AS total_courses,
    ROUND(AVG(e.grade), 2) AS average_grade

FROM Departments AS d

INNER JOIN Courses AS c
    ON d.department_id = c.department_id

INNER JOIN Enrollments AS e
    ON c.course_id = e.course_id

GROUP BY
    d.department_id,
    d.department_name

HAVING
    AVG(e.grade) >= 75

ORDER BY
    average_grade DESC,
    total_courses DESC,
    d.department_name ASC;