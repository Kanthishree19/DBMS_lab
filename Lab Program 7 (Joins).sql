CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Department VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Finance');

INSERT INTO Employee VALUES
(101, 'Ravi', 25000, 1),
(102, 'Priya', 35000, 2),
(103, 'Arun', 40000, 1),
(104, 'Sneha', 30000, 3);

SELECT Employee.emp_id, Employee.emp_name,
       Department.dept_name
FROM Employee
INNER JOIN Department
ON Employee.dept_id = Department.dept_id;

SELECT Employee.emp_id, Employee.emp_name,
       Department.dept_name
FROM Employee
LEFT OUTER JOIN Department
ON Employee.dept_id = Department.dept_id;

SELECT Employee.emp_id, Employee.emp_name,
       Department.dept_name
FROM Employee
RIGHT OUTER JOIN Department
ON Employee.dept_id = Department.dept_id;


SELECT Employee.emp_id, Employee.emp_name,
       Department.dept_name
FROM Employee
LEFT JOIN Department
ON Employee.dept_id = Department.dept_id

UNION

SELECT Employee.emp_id, Employee.emp_name,
       Department.dept_name
FROM Employee
RIGHT JOIN Department
ON Employee.dept_id = Department.dept_id;


SELECT emp_id, emp_name, salary, dept_id, dept_name
FROM Employee
NATURAL JOIN Department;


SELECT Employee.emp_name, Department.dept_name
FROM Employee
CROSS JOIN Department;