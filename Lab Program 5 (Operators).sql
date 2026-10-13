CREATE TABLE CourseEnrollment (
    enrollment_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_name VARCHAR(50),
    course_fee DECIMAL(10,2),
    discount DECIMAL(10,2),
    age INT,
    status VARCHAR(20)
);

INSERT INTO CourseEnrollment VALUES
(1, 'Aditi', 'Java', 12000, 1000, 20, 'Active'),
(2, 'Vikram', 'Python', 15000, 2000, 22, 'Active'),
(3, 'Neha', 'SQL', 8000, 500, 19, 'Completed'),
(4, 'Rohan', 'Cybersecurity', 18000, 3000, 24, 'Active'),
(5, 'Divya', 'Web Development', 10000, 1500, 21, 'Completed');


SELECT student_name, course_fee,
       course_fee + 500 AS Fee_With_Service_Charge
FROM CourseEnrollment;

SELECT student_name, course_fee, discount,
       course_fee - discount AS Final_Fee
FROM CourseEnrollment;

SELECT student_name, course_fee,
       course_fee * 2 AS Fee_For_Two_Courses
FROM CourseEnrollment;

SELECT student_name, course_fee,
       course_fee / 2 AS Half_Fee
FROM CourseEnrollment;

SELECT enrollment_id,
       enrollment_id % 2 AS Remainder
FROM CourseEnrollment;


SELECT * FROM CourseEnrollment
WHERE status = 'Active';

SELECT * FROM CourseEnrollment
WHERE status != 'Completed';

SELECT * FROM CourseEnrollment
WHERE course_fee > 10000;

SELECT * FROM CourseEnrollment
WHERE age < 21;

SELECT * FROM CourseEnrollment
WHERE course_fee >= 12000;

SELECT * FROM CourseEnrollment
WHERE age <= 21;


SELECT * FROM CourseEnrollment
WHERE status = 'Active' AND course_fee > 10000;

SELECT * FROM CourseEnrollment
WHERE course_name = 'Java' OR course_name = 'Python';

SELECT * FROM CourseEnrollment
WHERE NOT status = 'Completed';


SELECT * FROM CourseEnrollment
WHERE course_fee BETWEEN 8000 AND 15000;

SELECT * FROM CourseEnrollment
WHERE course_name IN ('Java', 'SQL', 'Python');

SELECT * FROM CourseEnrollment
WHERE course_name NOT IN ('Java', 'SQL');

SELECT * FROM CourseEnrollment
WHERE student_name LIKE 'A%';

SELECT * FROM CourseEnrollment
WHERE discount IS NULL;

SELECT * FROM CourseEnrollment;
