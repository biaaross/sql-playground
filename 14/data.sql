-- ==========================================================
-- INSERT DATA
-- SQL Subqueries Practice Project
-- ==========================================================

-- ==========================================================
-- Departments
-- ==========================================================

INSERT INTO Departments (department_name)
VALUES
('Computer Engineering'),
('Software Engineering'),
('Electrical Engineering'),
('Mechanical Engineering'),
('Civil Engineering');

-- ==========================================================
-- Instructors
-- ==========================================================

INSERT INTO Instructors (instructor_name)
VALUES
('Dr. Ahmet Yılmaz'),
('Dr. Ayşe Demir'),
('Dr. Mehmet Kaya'),
('Dr. Elif Şahin'),
('Dr. Hasan Çelik'),
('Dr. Zeynep Aydın');


-- ==========================================================
-- Students
-- ==========================================================

INSERT INTO Students (full_name, city)
VALUES
('Ali Yılmaz', 'Ankara'),
('Ayşe Demir', 'İstanbul'),
('Mehmet Kaya', 'İzmir'),
('Fatma Şahin', 'Bursa'),
('Can Özkan', 'Ankara'),
('Zeynep Arslan', 'Samsun'),
('Mert Çelik', 'Trabzon'),
('Elif Aydın', 'Antalya'),
('Burak Koç', 'Konya'),
('Ece Yıldız', 'Eskişehir'),
('Emre Kurt', 'Kayseri'),
('Sena Aksoy', 'Adana'),
('Kerem Güneş', 'Gaziantep'),
('Melisa Erdem', 'Mersin'),
('Onur Karaca', 'Ankara'),
('Buse Yıldırım', 'İstanbul'),
('Kaan Polat', 'İzmir'),
('Derya Kılıç', 'Trabzon'),
('Oğuz Demirtaş', 'Samsun'),
('Ceren Acar', 'Bursa');


-- ==========================================================
-- Courses
-- ==========================================================

INSERT INTO Courses
(course_name, credit, department_id, instructor_id)
VALUES

-- Computer Engineering
('Database Systems',          4, 1, 1),
('Data Structures',           5, 1, 1),
('Operating Systems',         4, 1, 2),

-- Software Engineering
('Python Programming',        3, 2, 2),
('Web Development',           4, 2, 3),
('Software Engineering',      5, 2, 3),

-- Electrical Engineering
('Circuit Analysis',          4, 3, 4),
('Digital Electronics',       3, 3, 4),
('Microprocessors',           5, 3, 5),

-- Mechanical Engineering
('Thermodynamics',            4, 4, 5),
('Machine Design',            5, 4, 6),

-- Civil Engineering
('Statics',                   3, 5, 6),
('Construction Management',   4, 5, 1);



-- ==========================================================
-- Enrollments
-- ==========================================================

INSERT INTO Enrollments (student_id, course_id, semester, grade)
VALUES
(1, 1, '2025-Fall', 85),
(1, 2, '2025-Fall', 90),
(1, 4, '2025-Fall', 88),

(2, 1, '2025-Fall', 72),
(2, 5, '2025-Fall', 78),
(2, 6, '2025-Fall', 81),

(3, 2, '2025-Fall', 95),
(3, 3, '2025-Fall', 91),
(3, 7, '2025-Fall', 89),

(4, 4, '2025-Fall', 68),
(4, 5, '2025-Fall', 73),
(4, 8, '2025-Fall', 70),

(5, 1, '2025-Fall', 84),
(5, 6, '2025-Fall', 87),
(5, 9, '2025-Fall', 82),

(6, 7, '2025-Fall', 92),
(6, 8, '2025-Fall', 90),
(6, 9, '2025-Fall', 94),

(7, 10, '2025-Fall', 75),
(7, 11, '2025-Fall', 80),
(7, 12, '2025-Fall', 77),

(8, 3, '2025-Fall', 88),
(8, 4, '2025-Fall', 85),
(8, 13, '2025-Fall', 91),

(9, 5, '2025-Fall', 69),
(9, 6, '2025-Fall', 71),
(9, 10, '2025-Fall', 73),

(10, 2, '2025-Fall', 83),
(10, 8, '2025-Fall', 86),
(10, 11, '2025-Fall', 88),

(11, 1, '2025-Fall', 79),
(11, 9, '2025-Fall', 81),
(11, 12, '2025-Fall', 76),

(12, 3, '2025-Fall', 93),
(12, 4, '2025-Fall', 90),
(12, 5, '2025-Fall', 92),

(13, 6, '2025-Fall', 65),
(13, 7, '2025-Fall', 70),
(13, 13, '2025-Fall', 68),

(14, 2, '2025-Fall', 87),
(14, 10, '2025-Fall', 89),
(14, 11, '2025-Fall', 91),

(15, 1, '2025-Fall', 82),
(15, 4, '2025-Fall', 84),
(15, 9, '2025-Fall', 80),

(16, 3, '2025-Fall', 74),
(16, 6, '2025-Fall', 76),
(16, 12, '2025-Fall', 78),

(17, 5, '2025-Fall', 96),
(17, 8, '2025-Fall', 94),
(17, 13, '2025-Fall', 97),

(18, 2, '2025-Fall', 81),
(18, 7, '2025-Fall', 84),
(18, 10, '2025-Fall', 86),

(19, 11, '2025-Fall', 72),
(19, 12, '2025-Fall', 75),
(19, 13, '2025-Fall', 78),

(20, 1, '2025-Fall', 89),
(20, 5, '2025-Fall', 87),
(20, 9, '2025-Fall', 90);