/*
--------------------------------------------------------------
SUBQUERIES
Subqueries is used for:-
i) Break complex logic into smaller steps
ii) Use aggregate results for filtering
iii) Peform row-by-row comparisons.
iv) Create temporary result sets
v) Add calculated cols dynamically.

Interview line: A subquery allows the result of
one query to be used inside another query.

Types of Subqueries:-
1) Scaler Subquery / Single Row Subquery

Definition:
A scaler subquery returns exactly one row and one col.
Rules:
Must return only one value.
If more than one row is returned -> error
If no rows are returned result in -> NULL
*/
-- 1. Find the employees whose salary is greater than the average salary.
select avg(salary) 
from Employees;
select emp_name, salary 
from Employees 
where salary > 
(select avg(salary) 
from Employees);

-- 2. Employee earning the highest salary
select max(salary) 
from Employees;
select emp_name, salary 
from Employees 
where salary = (select max(salary) 
				from Employees);

-- 3. Employees earning less than the average salary
select avg(salary) 
from Employees;
select emp_name, salary 
from Employees 
where salary < (select avg(salary) 
from Employees);

/*
===============================================================================
2) Multiple Row Subquery

Definition:
A multiple row subquery returns more than one row, usually a single column
Used with:
IN 
ANY 
ALL 
EXISTS
===============================================================================
*/
-- 1. Find the employees who belong to departments where at least 
-- one employee earns more than 55000
select department 
from Employees 
where salary > 55000;
select emp_name, salary, department 
from Employees
where department in (select department 
from Employees 
where salary > 55000);

-- 2. (USING IN) --> Find all employees who belong to a department where atleast
-- one employee works in mumbai
select department 
from Employees 
where city='Mumbai';
select emp_name, department, city 
from Employees 
where department in (select department 
from Employees 
where city='Mumbai');

-- 3. (USING ANY) --> Find all employees whose salary is greater than the salary of atleast
-- one employee from the HR department
select department, salary 
from Employees 
where department='HR';
select emp_name, department, salary 
from Employees 
where salary > any (select salary 
from Employees 
where department='HR');

/*
=========================================================================
3) Table Subquery (Derived Table / Inline View)

Definition:
A table subquery returns multiple rows and multiple cols.
It is used inside the FROM clause and behaves like a temporary table

Rules:
The subquery must have an alias 
=========================================================================
*/
-- Example for Table Subquery
select department, avg(salary) as Avg_Salary 
from Employees 
group by department;
select department, avg_salary
FROM (
select department, avg(salary) as Avg_Salary 
from Employees 
group by department
) as Dept_Avg
where avg_salary > 45000;

-- 1. Find the department with the highest average salary using a table subquery
select department, avg(salary) as Avg_Salary
from Employees
group by department;
select department, avg_salary
FROM (
	select department, avg(salary) as Avg_Salary
	from Employees
	group by department
) as Dept_Avg
order by avg_salary desc
limit 1;


/*
=============================================================
4) Correlated subquery

Definition:
A correlated subquery references one or more cols from the outer query.
The subquery depends on the current row of the outer query.
Giving alias is necessary
--> It cannot execute independently and runs once for
	each row of the outer query
=============================================================
*/
-- 1. Find the employees whose salary is greater than the average salary of their own department
select * from Employees;
select e.emp_name, e.salary, e.department 
from Employees e 
where e.salary > (
	select avg(e1.salary) 
    from Employees e1 
    where e1.department = e.department
);

 
 /*
 =============================================================
 CREATE DATABASE & INSERT TABLE & DATA RECORDS
 =============================================================
 */
 create database Subqueries_db;
 use Subqueries_db;
 
 create table Employees (
	emp_id int,
    emp_name varchar(50),
    department varchar(50),
    salary int,
    city varchar(50)
 );
 
 insert into Employees values
 (101, 'Amit', 'IT', 50000, 'Pune'),
 (102, 'Priya', 'HR', 40000, 'Mumbai'),
 (103, 'Rahul', 'IT', 60000, 'Pune'),
 (104, 'Neha', 'Finance', 45000, 'Mumbai'),
 (105, 'Sneha', 'HR', 35000, 'Pune'),
 (106, 'Karan', 'Finance', 55000, 'Mumbai');
 
 select * from Employees;
 