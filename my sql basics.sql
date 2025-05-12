show databases;
create database newdb;

show databases;

use newdb;

CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Salary FLOAT
);

alter table employees add email varchar(100);
describe employees;
select * from employees;
ALTER TABLE Employees MODIFY Salary DECIMAL(10,2);
describe employees;
alter table employees drop column email;
select * from employees;

-- drop table employees;

-- INSERT INTO table_name (column1, column2, column3) VALUES (value1, value2, value3);
INSERT INTO Employees (ID, Name, Position, Salary)VALUES
(1, 'Alice Smith', 'Manager', 70000),
(2, 'Bob Johnson', 'Sales Associate', 45000),
(3, 'Carol Davis', 'Developer', 60000);

describe employees;
select * from employees;
insert into employees(Id ,  name , position) values(4, 'devil' ,  'marketing');
select * from employees;
select name , salary from employees;
select * from employees where salary> 50000;
SELECT * FROM Employees WHERE Position = 'Manager';

-- UPDATE table_name
-- SET column1 = new_value
-- WHERE condition;

UPDATE Employees
SET Salary = 50000
WHERE Name = 'Bob Johnson';

select * from employees;

-- DELETE FROM table_name WHERE condition;
DELETE FROM Employees WHERE Position = 'Sales Associate';





CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    manufacture_date DATE
);

select * from products;
INSERT INTO Products (product_id, product_name, price, manufacture_date)
VALUES(1, 'Laptop', 1200.00, '2023-01-15'),
(2, 'Smartphone', 800.00, '2023-03-10'),
(3, 'Tablet', 300.00, '2022-11-05');

SELECT product_name, price FROM Products;





CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATETIME,
    order_amount FLOAT
);

select * from orders;

ALTER TABLE Orders ADD delivery_status VARCHAR(20);
describe orders;

ALTER TABLE Orders DROP COLUMN delivery_status;

INSERT INTO Orders (order_id, customer_name, order_date, order_amount)
VALUES
(1, 'John Doe', '2023-05-01 14:23:00', 150.00),
(2, 'Jane Smith', '2023-05-02 10:45:00', 250.00),
(3, 'Mark Johnson', '2023-04-30 16:20:00', 75.00);

UPDATE Orders 
SET order_amount = 300 
WHERE order_id = 2;

delete from orders 
where order_amount< 100;

select* from orders;

