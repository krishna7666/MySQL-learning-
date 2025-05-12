SHOW DATABASES;
CREATE database exercise2;
use exercise2;

-- Q1. Create a table called products with the following columns:
-- (product_id (integer, primary key), name (varchar, cannot be null), price (decimal with two decimal places, must be greater than 0), quantity (integer, must be greater than or equal to 0))

create table products( 
product_id int primary key ,
name varchar(255) not null ,
price decimal(10,2) check (price >0 ) ,
quantity int check (quantity >=0) 
);

-- Q2. Create a table of employees with the following columns:(employee_id (integer, primary key), first_name (varchar, cannot be null), last_name (varchar, cannot be null), salary (decimal, cannot be null))
create table employees( 
employee_id int primary key , 
first_name  varchar(255)  ,  
last_name varchar(25) not null ,  
salary decimal(10, 2) not null);

-- Q3. Create an orders table where: order_id (integer, primary key), product_id (foreign key, references product_id in products table), quantity (integer, must be greater than 0)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Q4. Create a customers table where: customer_id (integer, primary key), email (varchar, must be unique), phone_number (varchar, must be unique)
create table customers(
customer_id int primary key ,
email varchar(255) unique not null,
phone_number varchar(255) unique not null
); 
desc customers;

-- Q5. Create a departments table with the following columns: department_id (integer, primary key), department_name (varchar, cannot be null and must be unique), manager_id (foreign key, references employee_id in the employees table)
create table departments(
department_id int primary key, 
department_name varchar(255) unique not null,
manager_id int , 
foreign key (manager_id) references employees(employee_id) );

-- Q6. Create a projects table where: project_id (integer, primary key), project_name (varchar, cannot be null), start_date (date, must be greater than today), budget (decimal, must be greater than 10000)
create table projects(
project_id int primary key ,
project_name varchar(255) not null,
start_date date check(start_date>current_date()),
budget decimal(15,2) check(budget>10000)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    start_date DATE,
    budget DECIMAL(15, 2),
    CONSTRAINT chk_start_date CHECK (start_date > CURDATE()),
    CONSTRAINT chk_budget CHECK (budget > 10000)
);

-- Q7. Add a foreign key constraint to an existing orders table: Add a foreign key customer_id in the orders table that references customer_id in the customers table.
alter table orders ADD COLUMN customer_id INT, add constraint fk_customer foreign key(customer_id) references customers(customer_id);

-- Q8. Add a CHECK constraint to an existing employee's table: Add a CHECK constraint to the salary column to ensure the salary exceeds 30,000.
alter table employees add constraint check_salary check(salary>30000);

-- Q9. Add a UNIQUE constraint to an existing customer's table: Add a UNIQUE constraint to the email column to ensure each employee has a unique email address.
alter table customers add constraint unique_email unique(email);




CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    make VARCHAR(100),
    model VARCHAR(100),
    price DECIMAL(10, 2),
    year INT,
    color VARCHAR(50),
    body_style VARCHAR(50),
    fuel_type VARCHAR(50),
    type VARCHAR(50)
);

INSERT INTO vehicles (make, model, price, year, color, body_style, fuel_type, type) VALUES
('BMW', 'X5', 60000, 2022, 'Black', 'SUV', 'Gasoline', 'Utility'),
('Chevrolet', 'Malibu', 25000, 2018, 'Silver', 'Sedan', 'Gasoline', 'Passenger'),
('Tesla', 'Model S', 75000, 2021, 'White', 'Sedan', 'Electric', 'Passenger'),
('Ford', 'F-m150', 45000, 2019, 'Red', 'Truck', 'Gasoline', 'Utility'),
('Audi', 'Q7', 55000, 2021, 'Black', 'SUV', 'Gasoline', 'Utility'),
('Honda', 'Civic', 22000, 2016, 'Blue', 'Sedan', 'Gasoline', 'Passenger'),
('Mustang', 'GT', 45000, 2020, 'Yellow', 'Coupe', 'Gasoline', 'Sport'),
('Nissan', 'Leaf', 35000, 2020, 'Green', 'Sedan', 'Electric', 'Passenger'),
('Toyota', 'Camry', 24000, 2017, 'Silver', 'Sedan', 'Gasoline', 'Passenger'),
('Chevrolet', 'Bolt EV', 45000, 2021, 'Silver', 'Sedan', 'Electric', 'Passenger');

select * from vehicles;

-- Q10. Write a query to display the make, model, and a new column price_category that classifies each vehicle as ‘Economy’, ‘Premium’, or ‘Luxury’.
select make , model , 
	case
	when price <=30000 then 'economy' 
	when price <30000 and price>60000 then 'premium'
	else 'luxery' 
	end as price_catagory
from vehicles;

-- Q11. Create a query to list the make, model, and a new column age_group categorizing vehicles as ‘New’ (year >= 2020), ‘Recent’ (year between 2017 and 2019), or ‘Older’ (year < 2017).
select make , model ,
case 
when year >=2020 then 'new' 
when year <=2019 and year >=2017 then 'recent'
else 'older'
end as age_group
from 
vehicles;

-- Q12. Write a query to show the make, model, and a column body_style that converts ‘Sedan’ and ‘Coupe’ to ‘Passenger’, ‘SUV’ and ‘Truck’ to ‘Utility’, and ‘Electric’ remains the same.
select make , model ,body_style,
case 
	when body_style in('sedan', 'coupe') then 'Passenger'
	when body_style in ('suv','truck') then 'utility'
	when 'electric' then 'electric'
	else body_style
end as body_style
from vehicles;

-- Q13. Write a query to display the make, model, and a new column fuel_type where ‘Electric’ vehicles are listed as ‘Electric’ and others as ‘Gasoline’.
select make , model ,
case 
	when fuel_type ='electric' then 'electric'
    else 'gasoline'
end as fuel_type
from vehicles;

select * from vehicles;
-- Q14. List make, model, and a column price_range indicating if the price is ‘Below 25k’, ‘25k to 50k’, or ‘Above 50k’.
select make , model ,
case 
	when price <= 25000 ='electric' then 'Below 25k'
    when price > 25000  and  price <=50000  then 'above 50k'
    else 'above 50k'
end as price_range
from vehicles;

-- Q15. Write a query to show make, model, and a new column warranty_status as ‘In Warranty’ or ‘Out of Warranty’ based on the year (assuming 5-year warranty from the year of manufacture).

select make , model ,
case 
		when (year(current_date)-year <= 5 then 'in warrenty'
		else 'out of warrenty'
end as warranty_status
from vehicles;


-- Q16. Create a query to show make, model, and a column size_category classifying ‘Sedan’, ‘Coupe’, and ‘Electric’ as ‘Small’, ‘SUV’ as ‘Medium’, and ‘Truck’ as ‘Large’.
select make , model , 
case 
	when body_style and fuel_type  in ('seden' , 'coupe', 'electric') then 'small'
    when body_style = 'suv' then 'medium'
    when body_style = 'truck' then 'large'
    else 'unknown'
end as size_category
from vehicles;

-- Q17. Display make model, and a new column year_class that classifies vehicles as ‘Vintage’ for years before 2000, ‘Modern’ for years between 2000 and 2015, and ‘Current’ for years after 2015.
select make , model , 
case 
when year<2000  then 'vintage'
when year between 2000 and 2015 then 'modern'
else 'current'
end as year_class
from vehicles;

--  Q18. Create a query to show make, model, and column popularity where ‘Black’ and ‘White’ vehicles are ‘Popular’, and others are ‘Standard’.
select make , model , color,
case 
when color in ('black' , 'white') then 'popular'
else 'standard'
end as year_class
from vehicles;

select * from vehicles;
-- Q19. Write a query to show the make, model, and a column highlight that marks ‘Electric’ vehicles as ‘Eco-Friendly’ and others as ‘Conventional’.
select make , model , color,
case 
when color in ('black' , 'white') then 'popular'
else 'standard'
end as year_class
from vehicles;

-- Q20. Write a query to display the make, model, and a new column luxury_brand where ‘BMW’, ‘Mercedes’, and ‘Audi’ are flagged as ‘Yes’, and other makes as ‘No’.
select make , model ,
case 
when make in ('bmw' , 'mercedes' , 'audi') then 'yes'
else 'no'
end as luxery_brand
from vehicles;

-- Q21. Create a query to display make, model and a new column origin classifying ‘Ford’ and ‘Chevrolet’ as ‘Domestic’ and others as ‘Imported’.
select make , model ,
case 
when make in ('ford' , 'chevrolet') then 'domestic'
else 'imported'
end as origin
from vehicles;

-- Q22. Write a query to determine the suitability of the vehicle colour for hot climates (‘Suitable’ for light colours, ‘Unsuitable’ for dark colours).
select make , model , color,
case 
when color in ('black' , 'red',  'blue' ,'green') then 'unsuitable'
else 'suitable'
end as suitable_vehicle_color
from vehicles;

select * from vehicles;
-- Q23. Classify vehicles as ‘Urban’ if they are smaller cars or ‘Rural’ if they are larger vehicles or trucks.
select make , model , body_style,
case 
when body_style in  ('truck', 'suv') then 'rural'
else 'urban'
end as classified_vehicles
from vehicles;

-- Q24. Classify vehicles based on their model year as ‘Experienced’ for older models and ‘Novice’ for newer models (year < 2015, ‘Experienced’).
select make , model , 
case 
when year>=2015 then 'novice'
else 'expeerienced'
end as model_classification
from vehicles;