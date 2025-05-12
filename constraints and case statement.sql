show databases;

create database Constraints;
use constraints;

-- Creating a table with a Primary Key
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(30)
);


-- Creating related tables with a Foreign Key
CREATE TABLE departments (
    dept_id INT NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


-- Creating a table with a Unique Constraint
CREATE TABLE users (
    user_id INT NOT NULL PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    username VARCHAR(50)
);


-- Creating a table with a Default Constraint
CREATE TABLE orders (
    order_id INT NOT NULL PRIMARY KEY,
    order_date DATE DEFAULT 'CURRENT_DATE',
    status VARCHAR(20) DEFAULT 'Pending'
);



-- Creating a table with a Check Constraint
CREATE TABLE products (
    product_id INT NOT NULL PRIMARY KEY,
    price DECIMAL(10, 2) CHECK (price > 0),
    stock INT CHECK (stock >= 0)
);

-- using not null
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2)
);


-- ALTER TABLE table_name MODIFY column_name column_definition NOT NULL;
ALTER TABLE Employees MODIFY first_name VARCHAR(50) NOT NULL;


-- ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column_name);
ALTER TABLE Employees ADD CONSTRAINT unique_phone UNIQUE (phone_number);


-- ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK (condition);
ALTER TABLE Employees ADD CONSTRAINT check_salary CHECK (salary > 0);


-- ALTER TABLE table_name ADD CONSTRAINT constraint_name FOREIGN KEY (column_name) REFERENCES referenced_table (referenced_column);
ALTER TABLE Employees ADD CONSTRAINT fk_department FOREIGN KEY (department) REFERENCES Departments(department_name);


-- ALTER TABLE table_name ADD CONSTRAINT constraint_name PRIMARY KEY (column_name);
ALTER TABLE Employees ADD CONSTRAINT pk_employee_id PRIMARY KEY (id);


-- ALTER TABLE table_name DROP CONSTRAINT constraint_name;
ALTER TABLE Employees DROP CONSTRAINT unique_phone;


CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE result
END;

SELECT name, salary,
    CASE
        WHEN salary < 50000 THEN 'Low Salary'
        WHEN salary >= 50000 AND salary < 80000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS salary_category
FROM employees;

SELECT name, department, salary,
    CASE department
        WHEN 'HR' THEN salary * 0.1
        WHEN 'Sales' THEN salary * 0.15
        WHEN 'IT' THEN salary * 0.12
        ELSE 0
    END AS bonus
FROM employees;

