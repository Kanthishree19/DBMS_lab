CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    hod_name VARCHAR(50)
);

CREATE TABLE UniversityStudent (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);

CREATE TABLE UniversityFaculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50) NOT NULL,
    designation VARCHAR(30),
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);

CREATE TABLE UniversityCourse (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INT,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
);

INSERT INTO Department VALUES
(1, 'Computer Science', 'Dr. Mehta'),
(2, 'Commerce', 'Dr. Sharma'),
(3, 'Electronics', 'Dr. Rao');

INSERT INTO UniversityStudent VALUES
(101, 'Ananya', 19, 'ananya@example.com', 1),
(102, 'Rahul', 20, 'rahul@example.com', 2),
(103, 'Meera', 19, 'meera@example.com', 3);

INSERT INTO UniversityFaculty VALUES
(201, 'Dr. Kumar', 'Professor', 75000, 1),
(202, 'Dr. Priya', 'Lecturer', 50000, 2),
(203, 'Dr. Suresh', 'Assistant Professor', 60000, 3);

INSERT INTO UniversityCourse VALUES
(301, 'Database Management', 4, 1),
(302, 'Financial Accounting', 3, 2),
(303, 'Digital Electronics', 4, 3);

SELECT * FROM Department;
SELECT * FROM UniversityStudent;
SELECT * FROM UniversityFaculty;
SELECT * FROM UniversityCourse;

ALTER TABLE UniversityStudent
ADD phone VARCHAR(15);

ALTER TABLE UniversityStudent
MODIFY email VARCHAR(150);

ALTER TABLE Department
ADD office_location VARCHAR(100);

ALTER TABLE UniversityCourse
RENAME COLUMN credits TO course_credits;

DESCRIBE UniversityStudent;
DESCRIBE Department;
DESCRIBE UniversityCourse;


CREATE TABLE TemporaryClassroom (
    classroom_id INT PRIMARY KEY,
    classroom_name VARCHAR(50)
);

DROP TABLE TemporaryClassroom;

SHOW TABLES;


