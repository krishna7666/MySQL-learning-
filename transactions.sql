show databases;
create database transactions;
use transactions;

-- Start a transaction
START TRANSACTION;

-- Insert a new employee
create table employees ( id int, name varchar(250) , salary int, department_id int) ;
INSERT INTO employees (id, name, salary, department_id) VALUES (11, 'Olivia Lee', 75000.00, 102);
INSERT INTO employees (id, name, salary, department_id) VALUES (12, 'Lee cooper', 5000.00, 103);

select * from employees;

-- Commit the transaction, making the changes permanent
COMMIT;

-- Start another transaction
START TRANSACTION;

-- Insert another employee
INSERT INTO employees (id, name, salary, department_id) VALUES (12, 'Oscar Wright', 62000.00, 103);

-- Rollback the transaction, undoing the second insert
ROLLBACK;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- Start a transaction
START TRANSACTION;

-- Insert a new employee
INSERT INTO employees (id, name, salary, department_id) VALUES (20, 'haarry', 8000.00, 505);

-- Create a savepoint
SAVEPOINT after_insert;

-- Insert another employee
INSERT INTO employees (id, name, salary, department_id) VALUES (14, 'Rachel Green', 70000.00, 102);

-- Rollback to the savepoint, undoing the second insert
ROLLBACK to savepoint after_insert ;

-- Commit the transaction
COMMIT;
select * from employees;


-- Create a temporary table
CREATE TEMPORARY TABLE temp_employees AS
SELECT * FROM employees WHERE department_id = 101;

-- Query the temporary table
SELECT * FROM temp_employees;

-- Drop the temporary table manually (it will be dropped automatically at the end of the session)
DROP TEMPORARY TABLE temp_employees;
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Enable the event scheduler
SET GLOBAL event_scheduler = on;

-- Create an event that runs every day at midnight and updates employee salaries
CREATE EVENT update_salaries
ON SCHEDULE EVERY 1 DAY
STARTS '2024-01-01 00:00:00'
DO
  UPDATE employees SET salary = salary * 1.05;
  
-- Enable the event scheduler
SET GLOBAL event_scheduler = ON;

-- Create the archive table
CREATE TABLE archived_employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    archived_date DATE
);

-- Create an event to archive old employee records
DELIMITER $$

CREATE EVENT archive_retired_employees
ON SCHEDULE EVERY 1 MONTH
STARTS '2024-01-01 00:00:00'
DO
BEGIN
    -- Insert employees with salary less than 50000 into the archive table
    INSERT INTO archived_employees (id, name, salary, department_id, archived_date)
    SELECT id, name, salary, department_id, CURDATE()
    FROM employees
    WHERE salary < 50000;

    -- Remove the archived employees from the original table
    DELETE FROM employees WHERE salary < 50000;
    
END $$

DELIMITER ;

SELECT * FROM archived_employees;

select * from employees;
