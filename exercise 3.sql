show databases;
create database exercise3;
use exercise3;
CREATE TABLE SalesData (
    SaleID INT,
    ProductID INT,
    Region VARCHAR(255),
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO SalesData (SaleID, ProductID, Region, SalesAmount, SaleDate) VALUES
(1, 101, 'North', 500.00, '2023-01-15'),(2, 102, 'South', 300.00, '2023-01-16'),
(3, 101, 'East', 450.00, '2023-01-17'),(4, 103, 'West', 600.00, '2023-01-18'),
(5, 102, 'North', 700.00, '2023-02-15'),(6, 104, 'South', 200.00, '2023-02-16'),
(7, 105, 'East', 900.00, '2023-02-17'),(8, 101, 'West', 400.00, '2023-02-18'),
(9, 103, 'North', 800.00, '2023-03-15'),(10, 104, 'South', 100.00, '2023-03-16'),
(11, 101, 'East', 300.00, '2023-03-17'),(12, 102, 'West', 500.00, '2023-03-18'),
(13, 105, 'North', 600.00, '2023-04-15'),(14, 101, 'South', 400.00, '2023-04-16'),
(15, 102, 'East', 700.00, '2023-04-17'),(16, 103, 'West', 500.00, '2023-04-18'),
(17, 104, 'North', 200.00, '2023-05-15'),(18, 105, 'South', 300.00, '2023-05-16'),
(19, 101, 'East', 400.00, '2023-05-17'),(20, 102, 'West', 600.00, '2023-05-18');

-- Q. Calculate the total sales amount for each region.
select region ,  sum(salesamount) as total_sales
from  SalesData
group by region;

-- Q. Write a query to count the number of sales transactions for each product.
select productid ,count(*) as transaction_count 
FROM SALESDATA
group by productid;

-- Q. Write a query to find the average sales amount for each region.
select region ,avg(salesamount) as average_sales from salesdata group by region;

-- Q. Write a query to find the highest sales amount for each product.
 select productid , max(salesamount) as highest_sales from salesdata group by productid; 
 
-- Q. Write a query to find the total sales amount for each month.
select date_format(saledate , '%y-%m') as month , sum(SalesAmount) as total_sales 
from salesdata 
group by date_format(saledate , '%y-%m');

-- Q. Write a query to find the total sales amount for each product in each region.
select productid, region , sum(salesamount) as total_sales 
from salesdata 
group by productid,region;

-- Q. Write a query to find the number of sales transactions for each product and each region.
select productid ,region , count(*) as sales_transactions from salesdata group by ProductID, region;

-- Q. Write a query to find each product's average sales amount per region.
select productid,region, avg(salesamount) as average_sales from salesdata group by ProductID , region;

-- Q. Write a query to find the total sales amount for each product for each quarter (using the QUARTER function).
select quarter(saledate) as quarter , sum(salesamount) as total_amount from salesdata group by quarter(saledate);

-- Q. Write a query to find the total sales amount for each product sold in the first quarter (January, February, and March).

-- Q. Write a query to find the total sales amount for each region and each year.

-- Q. Write a query to find the product with the highest sales in each region.
select region, productid , sum(SalesAmount) as highest_sales
from salesdata
group by region , productid ; 

SELECT Region,ProductID,SUM(SalesAmount) AS TotalSales
FROM SalesData
GROUP BY Region, ProductID
ORDER BY Region, TotalSales DESC;

-- Q. Write a query to find the average sales amount per product for each region.
select region , productid, avg(salesamount) as average_sales from salesdata
group by region , productid ; 

-- Q. Write a query to find the sales count for each region, for the last 2 months (based on SaleDate)
select region,  count(saleid) as sales_count
from salesdata 
WHERE SaleDate >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
group by region;

-- Q. Write a query to find the total sales amount for each product and each quarter of the year
select quarter(saledate) as quarter , sum(salesamount) as total_sales
from salesdata group by quarter(saledate) ;

-- Q. Identify the maximum sales amount recorded in each year.
select year(saledate) as saleyear, max(salesamount) as max_sales from salesdata group by year(saledate);

-- Q. Count the total number of sales transactions for each day of the week.
select dayofweek(saledate) as dayofweek , count(saleid) as salecount from salesdata group by dayofweek(saledate);

-- Q. Identify all sales transactions where the sales amount was over $500.
select saleid , productid , salesamount from salesdata where salesamount > 500;

-- Q. Determine which region had the least number of sales transactions.
select region , count(saleid) as sales_count from salesdata group by region limit 1;

-- Q. Identify which year had the highest average sales amount.
