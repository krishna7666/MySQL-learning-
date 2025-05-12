show databases;
create database joins_and_union;
use joins_and_union;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO employees (emp_id, emp_name, department)
VALUES
(1, 'John Doe', 'HR'),
(2, 'Jane Smith', 'Sales');

alter table employees add department_id int;

UPDATE employees
SET department_id = 101
WHERE emp_id = 1;

UPDATE employees
SET department_id = 102
WHERE emp_id = 2;

UPDATE employees
SET department_id = 101
WHERE emp_id = 3;

UPDATE employees
SET department_id = 103
WHERE emp_id = 4;


CREATE TABLE contractors (
    cont_id INT PRIMARY KEY,
    cont_name VARCHAR(100),
    department VARCHAR(50)
);
INSERT INTO contractors (cont_id, cont_name, department)
VALUES
(101, 'Mark Johnson', 'Finance'),
(102, 'Sarah Brown', 'IT');

SELECT column1, column2 FROM table1
UNION                                                                                                         -- union join
SELECT column1, column2 FROM table2;

SELECT column1, column2 FROM table1
INNER JOIN table2 ON table1.common_column = table2.common_column;     

select emp_id , emp_name , department from employees
union
select cont_id , cont_name , department from contractors;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT
);
INSERT INTO orders (order_id, order_date, customer_id)
VALUES
(101, '2023-05-01', 1),(102, '2023-05-02', 2),(103, '2023-05-03', 1),(104, '2023-05-04', 3),(105, '2023-05-05', 2);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);
INSERT INTO customers (customer_id, customer_name, city)
VALUES
(1, 'John Doe', 'New York'),(2, 'Jane Smith', 'Los Angeles'),(3, 'Michael Lee', 'Chicago');

SELECT orders.order_id, orders.order_date, customers.customer_name , city
FROM orders INNER JOIN customers                                                                             -- inner join
ON orders.customer_id = customers.customer_id;

-- Create the 'departments' table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
-- Insert data into 'departments' table
INSERT INTO departments (department_id, department_name)
VALUES(101, 'HR'),(102, 'Sales'),(103, 'Marketing');

SELECT employees.emp_name, departments.department_name
FROM employees LEFT JOIN departments                                                                        -- left join
ON employees.department_id = departments.department_id;

select * from departments;

SELECT employees.emp_name, departments.department_name
FROM employees RIGHT JOIN departments                                                                      -- right join
ON employees.department_id = departments.department_id;

SELECT Employees.emp_name, Employees.emp_id ,    Departments.department_name
FROM Employees CROSS JOIN Departments;                                                                     -- cross join

SELECT a.emp_name AS Employee1, b.department_name AS Employee2
FROM Employees a
INNER JOIN Employees b                                                                                     -- self join
ON a.department_id = b.department_id
WHERE a.id != b.id;

SELECT Employees.emp_name, Departments.department_name                                      
FROM Employees LEFT JOIN Departments
ON Employees.department_id = Departments.department_id                                                    -- full outer join
UNION
SELECT Employees.emp_name, Departments.department_name
FROM Employees RIGHT JOIN Departments
ON Employees.department_id = Departments.Department_id;

desc employees;
desc departments;