create database Window_Function_DB;
use Window_Function_DB;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(101, 'Amit', 'IT', 45000),
(102, 'Sneha', 'HR', 40000),
(103, 'Rahul', 'IT', 55000),
(104, 'Priya', 'Finance', 50000),
(105, 'Rohan', 'HR', 42000);

select * from employees;

/*
--------------------------------------------------------------------------
OFFSET
--------------------------------------------------------------------------
Definition:
OFFSET is used to skip a specified number of rows before returning the result.
It is commonly used with LIMIT.
--------------------------------------------------------------------------
*/
-- 1. Display 2 employees after skipping first 2 employees
select * from employees 
limit 2 offset 2;

-- 2. Display 2 employees with the highest salaries after skipping the highest-paid employee
select * from employees 
order by salary desc
limit 2 offset 1;

/*
--------------------------------------------------------------------------
WINDOW FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Definition:
A Window Function performs calculations on a group of related rows while
keeping all the original rows in a result.

Window Functions are used when you want to perform calculations such as ranking, 
averages, totals, etc., while still keeping every individual row.

GROUP BY combines row, whereas Window Functions give calculated information
without reducing the row count.

Window Functions are commonly used with the OVER() clause.

SYNTAX:
SELECT column 1 <-- column to be display,
	FUNCTION(column 2) <-- calculation(sum, avg, rank, row_number, etc.)
    OVER([PARTITION BY column 3] [ORDER BY column 4]) <-- OVER()makes it a window function | Partition by column 3 divide data into groups | order by column 4 define order (optional) |
    AS new_column <-- name of result column
FROM table_name;
--------------------------------------------------------------------------
OVER() CLAUSE
It what turns a function into a window function.
Without OVER it becomes a normal aggregate
With OVER it becomes a winodw function
--------------------------------------------------------------------------
*/

/*
--------------------------------------------------------------------------
COMMON WINDOW FUNCTION(CLAUSE):
--------------------------------------------------------------------------

1. Row_Number()

Points:
* It is a ranking window function 
* No duplicate in ranking
* It always give unique numbers

Syntax:
row_number()
over (order by column_name)

Description:
Assigns a unique seqential number to each employee based on salary.
--------------------------------------------------------------------------
*/
-- 1. Display each employee's name, department, salary, and assign a unique row number based on salary from highest and lowest
select emp_name, department, salary, 
	row_number() over(order by salary desc) as 'Row_Number'
from employees;

/*
--------------------------------------------------------------------------
Rank()

Description
Assigns a rank based on salary. If salaries are equal, they get the 
same rank and the next rank is skipped

Example:
Salary 55K 50K 50K 42K 40K
Salary_Rank 1 2 2 4 5
--------------------------------------------------------------------------
*/
-- 2. Display each employee name, department, salary, and rank the employees based on salary from highest to lowest
select emp_name, department, salary,
	rank() over(order by salary desc) as 'Salary_Rank'
from employees;

/*
Dense Rank()

Description:
Similar to RANK(), but does not skip the next rank when there is a tie.

Example:
Salary 55K 50K 50K 42K 40K
Salary_Dense Rank 1 2 2 3 4
--------------------------------------------------------------------------
*/
-- 3. Display each employee's name, department, salary and assign a dense rank based on salary from highest to lowest
select emp_name, department, salary,
	dense_rank() over(order by salary desc) as 'Salary_Rank'
from employees;

/*
Sum With Over()

Description:
Calculates a running total of salary while keeping every employee row
--------------------------------------------------------------------------
*/
-- 4. Display each employee's name, salary, and the running total of salaries based on employee ID order
select *, 
	sum(salary) over(order by emp_id asc) as 'Running_Salary'
from employees;

/*
--------------------------------------------------------------------------
Partition By

Points:
* It acts like group by
* But it does not merge rows
* It keeps every row visible

Syntax:
function(column_name)
over(partition by column_name)
*/

/*
SUM() With OVER() + PARTITION BY

Description:
Calculates the total salary within each department, while keeping every employee row
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/
-- 5. Display each employee's name, department, salary, and the total salary of their respective department
select *,
	sum(salary) over(partition by department) as 'Dept_Wise_Salary'
from employees; 

-- 6. Display each employee along with the average salary of their department
select *,
	avg(salary) over(partition by department) as 'Dept_Wise_AvgSalary'
from employees;

/*
-----------------------------------------------------------------------------
Case Statement
-----------------------------------------------------------------------------
*/

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT,
    attendance INT
);

INSERT INTO students VALUES
(1, 'Anita', 85, 92),
(2, 'Rahul', 65, 78),
(3, 'Sneha', 45, 88),
(4, 'Amit', 32, 65),
(5, 'Priya', 92, 95);

/*
Question: Display student name, marks, and result:

Marks >= 75 → Distinction
Marks >= 50 → Pass
Marks >= 35 → Needs Improvement
Otherwise → Fail
*/

select student_name, marks,
	case 
		when Marks >= 75 then 'Distinction'
        when Marks >= 50 then 'Pass'
        when Marks >= 35 then 'Needs Improvement'
        else 'Fail'
	end as result
from students;

CREATE TABLE employee_details (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2)
);

INSERT INTO employee_details VALUES
(101, 'Amit', 'IT', 45000, 5000),
(102, 'Sneha', 'HR', 40000, NULL),
(103, 'Rahul', 'IT', 75000, 8000),
(104, 'Priya', 'Finance', 55000, NULL),
(105, 'Rohan', 'Sales', 30000, 3000);

/*
Question
Display employee name, salary, bonus, and a new column called bonus_status:

If bonus is NULL → No Bonus
If bonus is greater than 5000 → High Bonus
Otherwise → Normal Bonus
*/
select emp_name, salary, bonus,
	case
		when bonus is null then 'No Bonus'
        when bonus > 5000 then 'High Bonus'
        else 'Normal Bonus'
	end as Bonus_status
from employee_details;

/*
LAG() FUNCTION

Description:
The LAG() function retrieves the value from the previous row in the result set.
It is commonly used to compare the current record with the immediately preceding record.
*/

/*
LEAD() FUNCTION

Description:
The LEAD() function retrieves the value from the next row in the result set.
It allows users to compare the current row with the following row without writing complex self-joins.
*/
