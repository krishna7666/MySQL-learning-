show databases;
create database subquery;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Alice Smith', 75000.00, 101),
(2, 'Bob Johnson', 54000.00, 102),
(3, 'Charlie Davis', 84000.00, 103),
(4, 'Diana Reynolds', 92000.00, 101),
(5, 'Ethan Taylor', 61000.00, 102),
(6, 'Fiona Green', 58000.00, 103),
(7, 'George White', 76000.00, 101),
(8, 'Hannah Brown', 67000.00, 102),
(9, 'Ian Clark', 43500.00, 103),
(10, 'Jenny Adams', 89000.00, 101);


select * from employees;

select * from employees where salary > (select avg(salary) from employees);  -- sub returns single

select name , salary 
from employees
WHERE (department_id, salary) in (SELECT department_id, MAX(salary) FROM employees GROUP BY department_id);  -- columns sub
                                 
select name , salary  from employees
WHERE salary in (SELECT MAX(salary)
				 FROM employees 
                 GROUP BY department_id);   -- row sub  returns multiple rows
               
(SELECT department_id,MAX(salary) FROM employees GROUP BY department_id); 

select * from employees e1 where salary > ( select avg(salary) 
                                            from employees e2 
											where e2.department_id = e1.department_id) ; -- correlated sub compare bet sub and outer sub

select * from  (select avg(salary) from employees e2 group by department_id)  as e ; -- sub as derived table 

select max(salary) from (select avg(salary) as salary from employees e2 group by department_id)  as e ;  --  sub for Aggregation 


select department_id, avg(salary) from employees e2 group by department_id;

SELECT name, salary
FROM employees e
WHERE (e.department_id, e.salary) in  (SELECT department_id, AVG(salary) FROM employees GROUP BY department_id);


SELECT name, salary
FROM employees
WHERE department_id IN (SELECT department_id FROM employees WHERE salary > 80000);

select name , salary 
from employees
where salary>80000;

SELECT name, salary
FROM employees
WHERE department_id IN (SELECT department_id FROM employees WHERE name = 'Alice Smith');