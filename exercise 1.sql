show databases;
create database exercise1;

use exercise1;
drop table employees;
CREATE TABLE Employees (
    id INT auto_increment  primary key, 
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    job_title VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10, 2),
    phone_number VARCHAR(20),
    age INT,
    office_location VARCHAR(100)
);

INSERT INTO Employees (id, first_name, last_name, department, state, city, job_title, hire_date, salary, phone_number, age, office_location) 
VALUES 
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

select distinct id from employees;

select * from employees;
-- 1. Select all employees who work in the ‘Marketing’ department.
select * from employees
where department= 'Marketing';

-- 2. Find all employees whose first name is ‘Sarah’. 
select *  from employees
where first_name= 'Sarah'; 

-- 3. Get all employees who live in the city ‘Miami’
select *  from employees
where city= 'miami';

-- 4. Retrieve all employees whose last name starts with ‘C’
select *  from employees
where last_name like 'c%' ;

-- 5. List all employees who have ‘Manager’ in their job title.
select *  from employees
where job_title like '%manager%' ;

-- 6. Write a SQL query to retrieve the first 5 records from the Employees table.
SELECT * FROM employees
LIMIT 5;

-- 7. Create a SQL query to select the top 3 highest-paid employees from the Employees table.
select first_name ,salary from employees
order by salary desc
limit 3 ;

-- 8. Select all employees whose last name contains the letter ‘e’.
select * from employees
where last_name like '%e%' ;

-- 9. Get all employees whose job title ends with ‘Specialist’.
select * from employees
where job_title like '%Specialist';

-- 10. Select all employees who have ‘Engineer’ at the end of their job title 
select * from employees
where job_title like '%Engineer';

-- 11. Order employees by their salary in descending order.
select * from employees
order by salary desc;

-- 12. Suppose you need to display employee records 5 at a time on a website. Write a SQL query to display the second set of 5 employees, ordered by hire_date.
select * from employees
order by hire_date asc
limit 5;

-- 13. Write a query to list the first 5 employees in the ‘Marketing’ department, ordered by their salary in descending order.
-- select first_name , last_name , salary from employees
GROUP BY department= 'marketing'
order by salary desc ;

-- 14. Retrieve all employees who were hired on the 15th of any month.
select * from employees
where day(hire_date)=15;

-- 15. Get all employees whose first name does not start with ‘A’ or ‘B’ (use AND).
select * from employees
where first_name not like 'A%' and 'B%';

-- 16. Select all employees who have ‘Director’ in their job title and are from the ‘Arizona’ office (use AND).
select * from employees
where job_title like '%director%' and state like 'arizona' ;

-- 17. Write an SQL query to find the salaries of employees whose first name starts with ‘J’ and who work in Texas.
select first_name , salary from employees
where first_name like 'j%' and state = 'texas' ; 

-- 18. List all employees whose last name does not contain ‘son’ and who do not work in the ‘Engineering’ department.
select * from employees
where last_name not like '%son' and department not like  'engineering';

SELECT * FROM Employees WHERE last_name NOT LIKE '%son%' AND department <> 'Engineering';


-- 19. Find all employees whose phone number ends with ‘7890’.
select * from employees
where phone_number like '%7890' ;

-- 20. Retrieve all employees who have either ‘Engineer’ or ‘Specialist’ in their job title.
select * from employees
where job_title like '%engineer' or job_title like '%Specialist' ;

-- 21. List all employees who do not live in ‘New York’, ‘Miami’, or ‘Austin’.
select * from employees
where city not in ('new york' ,'miami' ,'austin');
