show databases;
create database import_export;
use import_export;
create table emp(
NAME varchar(30),
GENDER varchar(30),RACE varchar(30),DEPARTMENT varchar(30),YEARS_EXPERIENCE int ,
SALARY int
);

LOAD DATA LOCAL INFILE "C://Users//VAIBHAV R. BHAND//OneDrive//Documents//krishna//DS course//data//employee_sample.csv" INTO TABLE emp
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SHOW GLOBAL VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = true;
