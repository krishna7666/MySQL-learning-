show databases;
create database data_manipulations;
use data_manipulations;

CREATE TABLE Employees (
    id INT,
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

