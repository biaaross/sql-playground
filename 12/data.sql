-- ==========================================
-- Departments
-- ==========================================

INSERT INTO Departments VALUES
(1,'Computer Engineering'),
(2,'Software Engineering'),
(3,'Electrical Engineering'),
(4,'Mechanical Engineering'),
(5,'Mathematics');

-- ==========================================
-- Instructors
-- ==========================================

INSERT INTO Instructors VALUES
(1,'Dr. Ahmet Kaya','ahmet@university.edu','2018-09-01'),
(2,'Dr. Ayşe Demir','ayse@university.edu','2017-02-15'),
(3,'Dr. Mehmet Yılmaz','mehmet@university.edu','2015-06-20'),
(4,'Dr. Elif Şahin','elif@university.edu','2020-01-10'),
(5,'Dr. Can Aydın','can@university.edu','2019-08-30'),
(6,'Dr. Zeynep Arslan','zeynep@university.edu','2021-03-01');

-- ==========================================
-- Students
-- ==========================================

INSERT INTO Students VALUES
(1,'Ali Yılmaz','Ankara','2003-04-12'),
(2,'Ayşe Kaya','İstanbul','2002-07-18'),
(3,'Mehmet Demir','Ankara','2001-12-01'),
(4,'Fatma Arslan','İzmir','2003-09-14'),
(5,'Can Çelik','Bursa','2002-05-10'),
(6,'Zeynep Şahin','Trabzon','2003-11-21'),
(7,'Emre Yıldız','Samsun','2001-06-17'),
(8,'Merve Aydın','Ankara','2002-10-08'),
(9,'Burak Koç','Antalya','2003-02-25'),
(10,'Elif Korkmaz','İstanbul','2001-08-11');

-- ==========================================
-- Courses
-- ==========================================

INSERT INTO Courses VALUES
(1,'Database Systems',4,2,1),
(2,'Algorithms',5,1,2),
(3,'Operating Systems',5,1,3),
(4,'Calculus',4,5,6),
(5,'Physics',3,3,4),
(6,'Machine Design',4,4,5),
(7,'Data Structures',5,2,2),
(8,'Artificial Intelligence',5,2,1),
(9,'Linear Algebra',3,5,6),
(10,'Computer Networks',4,1,3);

-- ==========================================
-- Enrollments
-- ==========================================

INSERT INTO Enrollments VALUES
(1,1,1,'2025-Fall',88),
(2,1,2,'2025-Fall',91),
(3,1,8,'2025-Fall',84),

(4,2,1,'2025-Fall',76),
(5,2,4,'2025-Fall',82),
(6,2,9,'2025-Fall',79),

(7,3,2,'2025-Fall',94),
(8,3,3,'2025-Fall',90),
(9,3,10,'2025-Fall',87),

(10,4,5,'2025-Fall',72),
(11,4,6,'2025-Fall',75),

(12,5,4,'2025-Fall',68),
(13,5,9,'2025-Fall',74),

(14,6,1,'2025-Fall',95),
(15,6,7,'2025-Fall',93),
(16,6,8,'2025-Fall',97),

(17,7,2,'2025-Fall',81),
(18,7,3,'2025-Fall',83),
(19,7,10,'2025-Fall',78),

(20,8,4,'2025-Fall',89),
(21,8,9,'2025-Fall',91),
(22,8,1,'2025-Fall',86),

(23,9,5,'2025-Fall',66),
(24,9,6,'2025-Fall',71),

(25,10,2,'2025-Fall',98),
(26,10,7,'2025-Fall',96),
(27,10,8,'2025-Fall',94);