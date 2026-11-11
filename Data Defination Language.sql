create database EMPDetails_DDL;
use EMPDetails_DDL;

create table Employee (
	Emp_ID int,
	Emp_Name varchar(20),
	Dept varchar(20),
	Salary int,
	City varchar(30)
);

insert into Employee(Emp_ID, Emp_Name, Dept, Salary, City)
values
(101, 'Amit', 'IT', 55000, 'Pune'),
(102, 'Priya', 'HR', 48000, 'Mumbai'),
(103, 'Rahul', 'Finance', 62000, 'Nashik'),
(104, 'Sneha', 'IT', 58000, 'Pune'),
(105, 'Vikas', 'Sales', 45000, 'Nagpur'),
(106, 'Neha', 'HR', 52000, 'Mumbai'),
(107, 'Rohan', 'Finance', 67000, 'Pune'),
(108, 'Pooja', 'Sales', 49000, 'Nashik'),
(109, 'Karan', 'IT', 60000, 'Nagpur'),
(110, 'Anjali', 'Marketing', 53000, 'Pune');

select * from Employee;

-- Alter with add
alter table Employee
add Email_ID varchar(30);

-- Alter for modify Salary in decimal
alter table Employee
modify Salary decimal(10, 2);

-- Rename
alter table Employee
rename column Salary to Emp_Salary;

-- Query to drop column
alter table Employee
drop City;

-- Truncate
truncate table Employee;

-- Drop command
drop table Employee;

-- Drop Database
drop database EMPDetails_DDL;
