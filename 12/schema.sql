DROP TABLE IF EXISTS Enrollments;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Instructors;
DROP TABLE IF EXISTS Departments;

-- ==========================================
-- Departments
-- ==========================================

CREATE TABLE Departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL UNIQUE
);

-- ==========================================
-- Instructors
-- ==========================================

CREATE TABLE Instructors (
    instructor_id INTEGER PRIMARY KEY,
    instructor_name TEXT NOT NULL,
    email TEXT UNIQUE,
    hire_date DATE
);

-- ==========================================
-- Students
-- ==========================================

CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    city TEXT NOT NULL,
    birth_date DATE
);

-- ==========================================
-- Courses
-- ==========================================

CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    credit INTEGER NOT NULL CHECK(credit BETWEEN 2 AND 6),

    department_id INTEGER NOT NULL,
    instructor_id INTEGER NOT NULL,

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (instructor_id)
        REFERENCES Instructors(instructor_id)
);

-- ==========================================
-- Enrollments
-- ==========================================

CREATE TABLE Enrollments (

    enrollment_id INTEGER PRIMARY KEY,

    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,

    semester TEXT NOT NULL,

    grade REAL CHECK(grade BETWEEN 0 AND 100),

    FOREIGN KEY(student_id)
        REFERENCES Students(student_id),

    FOREIGN KEY(course_id)
        REFERENCES Courses(course_id)
);