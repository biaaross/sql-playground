-- ==========================================================
-- UNIVERSITY COURSE MANAGEMENT SYSTEM
-- Sample Data
-- Part 1
-- ==========================================================

-- ==========================================================
-- STUDENTS
-- ==========================================================

INSERT INTO Students
(student_id, full_name, city, age)
VALUES
(1, 'Arda Yilmaz', 'Ankara', 20),
(2, 'Mehmet Kaya', 'Istanbul', 21),
(3, 'Ayse Demir', 'Izmir', 19),
(4, 'Can Kurt', 'Bursa', 22),
(5, 'Elif Sahin', 'Antalya', 20),
(6, 'Ahmet Yildiz', 'Trabzon', 23),
(7, 'Merve Aslan', 'Samsun', 21),
(8, 'Fatma Koc', 'Konya', 22),
(9, 'Emre Celik', 'Eskisehir', 20),
(10, 'Zeynep Aydin', 'Ankara', 19),
(11, 'Ali Ozdemir', 'Istanbul', 21),
(12, 'Buse Arslan', 'Izmir', 20);

-- ==========================================================
-- DEPARTMENTS
-- ==========================================================

INSERT INTO Departments
(department_id, department_name)
VALUES
(1, 'Software Engineering'),
(2, 'Computer Engineering'),
(3, 'Electrical Engineering'),
(4, 'Mechanical Engineering'),
(5, 'Civil Engineering'),
(6, 'Industrial Engineering');



-- ==========================================================
-- INSTRUCTORS
-- ==========================================================

INSERT INTO Instructors
(instructor_id, instructor_name)
VALUES
(1, 'Prof. Dr. Ahmet Yilmaz'),
(2, 'Prof. Dr. Ayse Demir'),
(3, 'Dr. Mehmet Kaya'),
(4, 'Dr. Elif Sahin'),
(5, 'Prof. Dr. Can Kurt'),
(6, 'Dr. Zeynep Aydin'),
(7, 'Assoc. Prof. Emre Celik'),
(8, 'Prof. Dr. Hakan Yilmaz');

-- ==========================================================
-- COURSES
-- ==========================================================

INSERT INTO Courses
(course_id, course_name, department_id, instructor_id, credit)
VALUES

-- Software Engineering
(1, 'Introduction to Programming', 1, 1, 4),
(2, 'Data Structures',             1, 1, 5),
(3, 'Database Systems',            1, 2, 4),
(4, 'Software Engineering',        1, 5, 4),

-- Computer Engineering
(5, 'Computer Networks',           2, 3, 4),
(6, 'Operating Systems',           2, 3, 5),
(7, 'Computer Architecture',       2, 7, 4),

-- Electrical Engineering
(8, 'Digital Electronics',         3, 4, 4),
(9, 'Signals and Systems',         3, 4, 5),
(10, 'Microprocessors',            3, 6, 4),

-- Mechanical Engineering
(11, 'Thermodynamics',             4, 5, 5),
(12, 'Fluid Mechanics',            4, 5, 4),

-- Civil Engineering
(13, 'Structural Analysis',        5, 6, 5),
(14, 'Construction Materials',     5, 7, 4),
(15, 'Soil Mechanics',             5, 2, 4);



-- ==========================================================
-- ENROLLMENTS (1 - 20)
-- ==========================================================

INSERT INTO Enrollments
(enrollment_id, student_id, course_id, semester, grade)
VALUES
(1, 1, 1, '2025-Fall', 95),
(2, 1, 2, '2025-Fall', 88),
(3, 1, 3, '2026-Spring', 91),

(4, 2, 1, '2025-Fall', 76),
(5, 2, 5, '2025-Fall', 81),
(6, 2, 6, '2026-Spring', 79),

(7, 3, 2, '2025-Fall', 93),
(8, 3, 3, '2025-Fall', 89),

(9, 4, 5, '2025-Fall', 84),
(10, 4, 7, '2026-Spring', 90),

(11, 5, 8, '2025-Fall', 86),
(12, 5, 9, '2026-Spring', 92),

(13, 6, 11, '2025-Fall', 71),
(14, 6, 12, '2026-Spring', 80),

(15, 7, 13, '2025-Fall', 85),
(16, 7, 14, '2026-Spring', 90),

(17, 8, 1, '2025-Fall', 67),
(18, 8, 3, '2026-Spring', 73),

(19, 9, 5, '2025-Fall', 94),
(20, 9, 6, '2026-Spring', 88);



-- ==========================================================
-- ENROLLMENTS (21 - 40)
-- ==========================================================

INSERT INTO Enrollments
(enrollment_id, student_id, course_id, semester, grade)
VALUES
(21, 10, 2,  '2025-Fall',   96),
(22, 10, 5,  '2026-Spring', 91),

(23, 11, 8,  '2025-Fall',   87),
(24, 11, 9,  '2026-Spring', 90),

(25, 12, 11, '2025-Fall',   78),
(26, 12, 13, '2026-Spring', 82),

(27, 1, 5,   '2026-Fall',   93),
(28, 2, 3,   '2026-Fall',   85),

(29, 3, 8,   '2026-Spring', 94),
(30, 4, 11,  '2026-Spring', 88),

(31, 5, 13,  '2026-Fall',   91),
(32, 6, 9,   '2026-Fall',   84),

(33, 7, 2,   '2026-Fall',   89),
(34, 8, 5,   '2026-Fall',   80),

(35, 9, 14,  '2026-Fall',   95),
(36, 10, 1,  '2026-Fall',   90),

(37, 11, 6,  '2026-Fall',   83),
(38, 12, 3,  '2026-Fall',   88),

(39, 3, 14,  '2026-Fall',   97),
(40, 5, 2,   '2026-Fall',   92);