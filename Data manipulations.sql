show databases;
create database SQL_Learnings;
USE SQL_Learnings;
create table employees( 
id int AUTO_INCREMENT primary key,
name VARCHAR(50),
age INT,
salary INT,
department VARCHAR(50),
phone_number VARCHAR(15),
hire_date DATE);

desc employees;

INSERT INTO employees (id, name, age, salary, department, phone_number, hire_date)
VALUES 
(1, 'Alice', 30, 60000, 'IT', '9876543210', '2021-03-15'),
(2, 'Bob', 25, 45000, 'HR', NULL, '2022-06-10'),
(3, 'Charlie', 28, 70000, 'Sales', '9123456789', '2020-11-25'),
(4, 'David', 35, 55000, 'Marketing', NULL, '2019-09-05'),
(5, 'Eve', 40, 80000, 'IT', '9988776655', '2023-01-20'),
(6, 'Frank', 22, 40000, 'HR', '9112233445', '2021-08-30'),
(7, 'Grace', 29, 75000, 'Sales', '9556677889', '2018-07-14'),
(8, 'Martin', 31, 72000, 'IT', '9001122334', '2022-02-28'),
(9, 'Helen', 27, 68000, 'Marketing', '9887766554', '2020-05-18'),
(10, 'Darren', 33, 74000, 'Sales', '9776655443', '2019-11-10'),
(11, 'Ian', 26, 52000, 'IT', '9654321876', '2022-07-19'),
(12, 'Jasmine', 34, 62000, 'HR', NULL, '2017-12-05'),
(13, 'Kevin', 41, 90000, 'Sales', '9543217890', '2016-09-30'),
(14, 'Laura', 36, 88000, 'Marketing', '9234567890', '2015-06-21'),
(15, 'Nathan', 29, 76000, 'IT', '9871236540', '2018-02-14'),
(16, 'Olivia', 24, 48000, 'HR', '9009988776', '2023-05-25');

select * from employees;

CREATE TABLE Users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NULL,
    age INT NULL,
    city VARCHAR(50) NULL
);

INSERT INTO Users (name, age, city)
VALUES
('John', 20, 'New York'),
('Sarah', 25, 'London'),
('Mike', 30, 'Los Angeles'),
('Emma', 17, 'Chicago'),
('Sophia', 60, 'Paris'),
('Daniel', 35, 'Berlin');

SELECT name, salary, salary * 1.10 AS new_salary
FROM employees;

select  * from employees;

SELECT * FROM employees
WHERE salary > 50000;

SELECT * FROM employees 
WHERE age BETWEEN 25 AND 40;

SELECT * FROM employees 
WHERE age NOT BETWEEN 20 AND 30;

SELECT * FROM employees
WHERE age IN (25, 30, 35);

SELECT * FROM employees
WHERE age NOT IN (25, 30, 35);

SELECT * FROM employees 
WHERE phone_number IS NULL;

SELECT * FROM employees 
WHERE phone_number IS NOT NULL;

SELECT * FROM employees 
WHERE department = 'IT' AND salary > 55000;

SELECT * FROM employees 
WHERE department = 'Sales' OR department = 'Marketing';

SELECT * FROM employees 
WHERE NOT department = 'HR';

select* from employees 
where age>30 and (salary>50000 or department = 'it');

select * from employees
where department = 'hr' ;

select * from employees
where department= 'it' and salary > 55000;

select * from employees
where department='sales'  or department = 'marketing';

SELECT * FROM employees WHERE NOT department = 'HR';

SELECT * FROM employees
WHERE name  LIKE 'A%';

SELECT * FROM employees WHERE name LIKE '%n';

SELECT * FROM employees WHERE name LIKE '_o%';

SELECT * FROM employees WHERE name NOT LIKE 'A%';

SELECT * FROM employees ORDER BY salary ASC;

SELECT * FROM employees ORDER BY hire_date DESC;

SELECT * FROM employees ORDER BY department ASC, salary DESC;

SELECT * FROM employees LIMIT 3;

SELECT * FROM employees ORDER BY hire_date LIMIT 5 OFFSET 5;

SELECT * FROM employees ORDER BY hire_date LIMIT 5 OFFSET 5;

SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

SELECT * FROM employees ORDER BY salary ASC LIMIT 3;

UPDATE Employees  
SET salary = 75000  
WHERE first_name = 'Alice' AND last_name = 'Smith';

INSERT INTO Employees (id, first_name, last_name, department, salary)
VALUES (1, 'Alice', 'Smith', 'HR', 60000);

INSERT INTO Employees (id, first_name, last_name, department, salary)
VALUES 
(2, 'Bob', 'Johnson', 'IT', 70000),
(3, 'Carol', 'Davis', 'Marketing', 55000);

SELECT * FROM Employees;

DELETE FROM Employees WHERE id = 3;

SELECT first_name, department FROM Employees;

TRUNCATE TABLE Employees;

drop table employees;


-- Check if the Employees table exists, then drop it
DROP TABLE IF EXISTS Employees;

-- Create the Employees table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    job_title VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,2),
    phone_number VARCHAR(20),
    age INT,
    office_location VARCHAR(100)
);

-- Insert sample data into Employees table
INSERT INTO Employees (id, first_name, last_name, department, state, city, job_title, hire_date, salary, phone_number, age, office_location) VALUES 
(1, 'John', 'Doe', 'Marketing', 'Texas', 'Houston', 'Marketing Manager', '2019-05-23', 60000, '(212)555-1234', 35, 'Houston Office'),
(2, 'Sarah', 'Smith', 'Sales', 'California', 'San Diego', 'Sales Representative', '2018-07-15', 45000, '(619)555-5678', 28, 'San Diego Office'),
(3, 'James', 'Johnson', 'Engineering', 'Florida', 'Miami', 'Senior Engineer', '2016-03-11', 75000, '(305)555-7890', 42, 'Miami Office'),
(4, 'Patricia', 'Carter', 'IT', 'Texas', 'Austin', 'IT Specialist', '2020-01-04', 65000, '(512)555-3456', 30, 'Austin Office'),
(5, 'Jennifer', 'Wright', 'Marketing', 'California', 'Los Angeles', 'Marketing Coordinator', '2017-09-26', 50000, '(213)555-6789', 27, 'Los Angeles Office'),
(6, 'Michael', 'Anderson', 'Finance', 'New York', 'New York', 'Finance Manager', '2015-02-20', 85000, '(646)555-1234', 45, 'New York Office'),
(7, 'Linda', 'Martinez', 'HR', 'Arizona', 'Phoenix', 'HR Director', '2013-10-13', 90000, '(480)555-5678', 38, 'Phoenix Office'),
(8, 'Robert', 'Lee', 'Sales', 'New York', 'New York', 'Sales Manager', '2014-08-29', 70000, '(646)555-7890', 32, 'New York Office'),
(9, 'Maria', 'Garcia', 'Engineering', 'California', 'San Francisco', 'Chief Engineer', '2012-06-17', 95000, '(415)555-3456', 40, 'San Francisco Office'),
(10, 'David', 'Robinson', 'Customer Service', 'Nevada', 'Las Vegas', 'Customer Service Rep', '2021-12-01', 40000, '(702)555-6789', 29, 'Las Vegas Office');


select * from employees;

SELECT * FROM Employees 
where department = 'Marketing';

SELECT * FROM Employees WHERE first_name = 'sarah';

SELECT * FROM Employees WHERE last_name like'C%';

SELECT * FROM Employees WHERE job_title LIKE '%Manager%';

SELECT * FROM Employees WHERE city = 'New York' and salary > 70000;

SELECT * FROM Employees ORDER BY salary 
desc;

select * from employees where job_title like '%director%' or state= 'arizona' ;