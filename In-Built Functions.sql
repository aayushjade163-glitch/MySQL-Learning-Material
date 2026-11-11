create database InBuilt_DB;
use InBuilt_DB;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    joining_date DATE
);


INSERT INTO employees VALUES
(101, 'Amit Sharma', 'AMIT@GMAIL.COM', 'IT', 45678.75, 2500, '2022-01-15'),
(102, 'Sneha Patil', 'SNEHA@GMAIL.COM', 'HR', 38950.40, 1800, '2023-06-20'),
(103, 'Rahul Verma', 'RAHUL@GMAIL.COM', 'Finance', 52340.90, 3000, '2021-11-10'),
(104, 'Priya Singh', 'PRIYA@GMAIL.COM', 'IT', 47500.25, 2200, '2024-02-05'),
(105, 'Rohan Mehta', 'ROHAN@GMAIL.COM', 'Sales', 41200.60, 1500, '2023-08-18');

select * from employees;

/*
--------------------------------------
IN-BUILT SQL FUNCTIONS
--------------------------------------
*/
/*
---------------------------------------------------------------
1. STRING FUNCTIONS

Types:
UPPER() - Converts all letters in a string to uppercase

LOWER() - Converts all letters in a string to lowercase

LENGTH() - Return the number of characters in a string

CONCAT() - Combines two or more strings into a single string

SUBSTRING() - Extracts a speciific portion of a string

TRIM() - Removes leading and trailing spaces from a string

REPLACE() - Replaces a specified part of a string with another value
------------------------------------------------------------------------------- 
*/
-- 1. Display all employee names in uppercase 
select emp_name, upper(emp_name) from employees;

-- 2. Display all employee emails in lowercase
select email, lower(email) from employees;

-- 3. Find the length of each employee name
select emp_name, length(emp_name) from employees;

-- 4. Combine employee name and department
select emp_name, department, concat(emp_name, '-', department) from employees;

-- 5. Display the first 5 characters of every employee name
select emp_name, substring(emp_name,1,5) from employees;

-- 6. Remove extra spaces from employee names
select emp_name, trim(emp_name) from employees;

-- 7. Replace gmail.com with company.com in employee emails
select email, replace(email, "GMAIL.COM", "company.com") as new_email from employees;

-- 8. Display employee names in uppercase after removing white spaces
select emp_name, upper(trim(emp_name)) from employees;

/*
------------------------------------------------------------------------
2. MATH FUNCTIONS

Types:
ROUND() - Rounds a number to the specified number of decimal places

CEIL() - Rounds a number upwards to the nearest integer

FLOOR() - Rounds a number downwards to the nearest integer

ABS() - Returns the absolute (positive) value of a number

MOD() - Returns the remainder after dividing one number by another

POWER() - Returns a number raised to a specified power

SQRT() - Returns the square root of a number
---------------------------------------------------------------------------
*/
-- 1. Round the salary to the nearest integer.
select salary, round(salary) as new_salary from employees;

-- 2. Round the salary to the one decimal place
select salary, round(salary,1) from employees;

-- 3. Display the salary rounded up 
select salary, ceil(salary) from employees;

-- 4.  Display the salary rounded down
select salary, floor(salary) from employees;

-- 5. Find the absolute value of bonus - salary 
select bonus, salary, abs(bonus - salary) from employees;

-- 6. Find the remainder when salary is divided by 1000
select salary, mod(salary, 1000) from employees;

-- 7. Calculate the square of the bonus
select bonus, power(bonus, 2) from employees;

-- 8. Find the square root of the bonus
select bonus, sqrt(bonus) from employees;

/*
-------------------------------------------------------------------------------
3. DATE FUNCTIONS

Types:
NOW() - Returns the current date and current time
CURDATE() - Returns the current date
CURTIME() - Returns the current time
YEAR() - Extracts year from a date
MONTH() - Extracts the month number from a date

DAY() - Extracts the day of the month from a date

DATEDIFF() - Returns the number of days between two dates

DATE_ADD() - Adds a specified time interval to a date

DATE_SUB() - Subtracts a specified time interval from a date 
------------------------------------------------------------------------------- 
*/

-- 1. Display the current date and time
select now();

-- 2. Display only the current date
select curdate();

-- 3. Display only the current time
select curtime();

-- 4. Display the joining year of every employee
select joining_date, year(joining_date) from employees;

-- 5. Display the joining month of every employee
select joining_date, month(joining_date) from employees;

-- 6. Display the day on which each employee joined
select joining_date, day(joining_date) from employees;

-- 7. Find the number of days each employee has worked till today
select joining_date, datediff(curdate(), joining_date) from employees;

-- 8. Add 30 days to each employee joining date
select joining_date, date_add(joining_date, interval 30 day) from employees;

-- 9. Add 2 years to each employee joining date
select joining_date, date_add(joining_date, interval 2 year) from employees;

-- 10. Subtract 1 month from each employee joining date
select joining_date, date_sub(joining_date, interval 1 month) from employees;

-- 11. Find the employees who joined more than 2 years ago
select * from employees 
where joining_date < date_sub(curdate(), interval 2 year);