CREATE DATABASE IF NOT EXISTS student_db;
USE student_db;

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
    course_name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name       VARCHAR(50)  NOT NULL,
    email      VARCHAR(100) NOT NULL,
    course     VARCHAR(50)  NOT NULL,
    semester   INT          NOT NULL,
    FOREIGN KEY (course) REFERENCES courses(course_name)
);

INSERT INTO courses VALUES
    ('B.Tech CSE'), ('B.Tech ECE'), ('BCA'), ('BBA'), ('B.Sc Data Science');

INSERT INTO students VALUES
    (101, 'Anita Sharma', 'anita@example.com', 'B.Tech CSE', 3),
    (102, 'Rahul Verma', 'rahul@example.com', 'BCA', 1),
    (103, 'Meena Iyer', 'meena@example.com', 'BBA', 5);

SELECT * FROM students;

   USE student_db;
   SELECT * FROM students;