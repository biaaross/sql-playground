-- ==========================================================
-- DATABASE SCHEMA
-- SQL Subqueries Practice Project
-- ==========================================================

DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Departments;

-- ==========================================================
-- Departments
-- ==========================================================

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);

-- ==========================================================
-- Instructors
-- ==========================================================

CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY AUTO_INCREMENT,
    instructor_name VARCHAR(100) NOT NULL
);

-- ==========================================================
-- Students
-- ==========================================================

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);



-- ==========================================================
-- Courses
-- ==========================================================

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credit INT NOT NULL,
    department_id INT NOT NULL,
    instructor_id INT NOT NULL,

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (instructor_id)
        REFERENCES Instructors(instructor_id)
);

-- ==========================================================
-- Enrollments
-- ==========================================================

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester VARCHAR(20) NOT NULL,
    grade DECIMAL(5,2) NOT NULL,

    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),

    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);