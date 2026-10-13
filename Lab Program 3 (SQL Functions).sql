CREATE TABLE SchoolStudents (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    class_name VARCHAR(20),
    marks DECIMAL(5,2),
    fees DECIMAL(10,2),
    admission_date DATE
);

INSERT INTO SchoolStudents VALUES
(101, 'Ananya Sharma', '10A', 85.50, 15000, '2022-06-10'),
(102, 'Rahul Kumar', '10B', 72.00, 14000, '2023-06-15'),
(103, 'Meera Reddy', '10A', 91.50, 15000, '2021-06-12'),
(104, 'Arjun Patel', '9A', 68.00, 13000, '2023-06-20'),
(105, 'Sneha Rao', '9B', 88.00, 13500, '2022-06-18');

SELECT UPPER(student_name) AS Uppercase_Name
FROM SchoolStudents;

SELECT LOWER(student_name) AS Lowercase_Name
FROM SchoolStudents;

SELECT student_name, LENGTH(student_name) AS Name_Length
FROM SchoolStudents;

SELECT CONCAT(student_name, ' - ', class_name) AS Student_Details
FROM SchoolStudents;

SELECT student_name, SUBSTRING(student_name, 1, 5) AS Short_Name
FROM SchoolStudents;

SELECT TRIM('   School Database   ') AS Trimmed_Text;

SELECT student_name, ROUND(marks) AS Rounded_Marks
FROM SchoolStudents;

SELECT student_name, CEIL(marks) AS Ceiling_Marks
FROM SchoolStudents;

SELECT student_name, FLOOR(marks) AS Floor_Marks
FROM SchoolStudents;

SELECT ABS(-25) AS Absolute_Value;

SELECT student_name, MOD(marks, 10) AS Remainder
FROM SchoolStudents;

SELECT CURDATE() AS Today;

SELECT NOW() AS Current_Date_Time;

SELECT student_name, YEAR(admission_date) AS Admission_Year
FROM SchoolStudents;

SELECT student_name, MONTH(admission_date) AS Admission_Month
FROM SchoolStudents;

SELECT student_name, DAY(admission_date) AS Admission_Day
FROM SchoolStudents;

SELECT student_name,
       DATE_ADD(admission_date, INTERVAL 30 DAY) AS After_30_Days
FROM SchoolStudents;

SELECT student_name,
       DATEDIFF(CURDATE(), admission_date) AS Days_Since_Admission
FROM SchoolStudents;

SELECT student_name,
       DATE_FORMAT(admission_date, '%d-%m-%Y') AS Formatted_Date
FROM SchoolStudents;


SELECT COUNT(*) AS Total_Students
FROM SchoolStudents;

SELECT SUM(marks) AS Total_Marks
FROM SchoolStudents;

SELECT AVG(marks) AS Average_Marks
FROM SchoolStudents;

SELECT MAX(marks) AS Highest_Marks
FROM SchoolStudents;

SELECT MIN(marks) AS Lowest_Marks
FROM SchoolStudents;

SELECT SUM(fees) AS Total_Fees
FROM SchoolStudents;

SELECT class_name,
       COUNT(*) AS Total_Students,
       AVG(marks) AS Average_Marks,
       MAX(marks) AS Highest_Marks,
       MIN(marks) AS Lowest_Marks
FROM SchoolStudents
GROUP BY class_name;

SELECT * FROM SchoolStudents;
