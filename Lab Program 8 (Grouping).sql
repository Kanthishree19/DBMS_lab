CREATE TABLE StudentMarks (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(30),
    class_name VARCHAR(20),
    subject VARCHAR(30),
    marks INT
);

INSERT INTO StudentMarks VALUES
(101, 'Asha', 'BCA-A', 'Java', 85),
(102, 'Rahul', 'BCA-A', 'Java', 70),
(103, 'Priya', 'BCA-B', 'Java', 92),
(104, 'Kiran', 'BCA-B', 'DBMS', 78),
(105, 'Sneha', 'BCA-A', 'DBMS', 88),
(106, 'Arun', 'BCA-B', 'DBMS', 65),
(107, 'Meena', 'BCA-A', 'Java', 95),
(108, 'Rohan', 'BCA-B', 'Java', 80);


SELECT subject, AVG(marks) AS Average_Marks
FROM StudentMarks
GROUP BY subject;


SELECT class_name, COUNT(*) AS Total_Students
FROM StudentMarks
GROUP BY class_name;


SELECT subject, SUM(marks) AS Total_Marks
FROM StudentMarks
GROUP BY subject;


SELECT subject, AVG(marks) AS Average_Marks
FROM StudentMarks
GROUP BY subject
HAVING AVG(marks) > 80;


SELECT class_name, COUNT(*) AS Total_Students
FROM StudentMarks
GROUP BY class_name
HAVING COUNT(*) > 3;


SELECT * FROM StudentMarks
ORDER BY marks ASC;


SELECT * FROM StudentMarks
ORDER BY marks DESC;


SELECT * FROM StudentMarks
ORDER BY class_name ASC, marks DESC;


SELECT subject, AVG(marks) AS Average_Marks
FROM StudentMarks
GROUP BY subject
ORDER BY Average_Marks DESC;


SELECT class_name, AVG(marks) AS Average_Marks
FROM StudentMarks
GROUP BY class_name
HAVING AVG(marks) > 75
ORDER BY Average_Marks DESC;