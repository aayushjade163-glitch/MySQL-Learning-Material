create database CompanyDB_SurpriseTest;
use CompanyDB_SurpriseTest;

/*
----------------------------
Section A - DDL, DML & DQL
----------------------------
*/
-- Q1. [2 Marks] Create a table employees with the following columns: emp_id, emp_name, department, salary
-- and city. Set emp_id as the Primary Key.
create table Employees (
	emp_id int primary key,
    emp_name varchar(50),
    department varchar(50),
    salary int,
    city varchar(50)
);
-- Q2. [2 Marks] Insert 5 records into the employees table.
insert into Employees(emp_id, emp_name, department, salary, city) values
(101, 'Amit Sharma', 'IT', 55000, 'Pune'),
(102, 'Priya Patil', 'HR', 45000, 'Mumbai'),
(103, 'Rahul Verma', 'Finance', 60000, 'Pune'),
(104, 'Sneha Joshi', 'IT', 65000, 'Nashik'),
(105, 'Karan Mehta', 'Sales', 50000, 'Mumbai');
select * from Employees;
-- Q3. [1 Mark] Update the salary of one employee.
update Employees
set salary = 80000
where emp_id = 104;
select * from Employees;
-- Q4. [1 Mark] Delete one employee based on emp_id.
delete from Employees where emp_id = 101;
select * from Employees;
-- Q5. [1 Mark] Display all employees whose salary is greater than 40000.
select * from Employees where salary > 40000;
-- Q6. [1 Mark] Display only emp_name, department and salary.
select emp_name, department, salary from Employees where emp_id = 103;
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------- */

/*
-----------------------------------
Section B - Operators & Clauses
-----------------------------------
*/
-- Q7. [1 Mark] Display employees who belong to either IT or HR department using an appropriate operator.
select * from Employees where department = 'IT' or 'HR';
-- Q8. [1 Mark] Display employees whose salary is between 30000 and 60000.
select * from Employees where salary between 30000 and 60000;
-- Q9. [1 Mark] Display employees whose name starts with the letter 'A'.
select * from Employees where emp_name like 'S%'; -- No 'A' Employee name
-- Q10. [1 Mark] Display employees whose city is not Pune.
select * from Employees where city != 'Pune';
-- Q11. [1 Mark] Display employees in descending order of salary.
select * from Employees order by Salary desc;
-- Q12. [1 Mark] Display the top 3 highest-paid employees.
select * from Employees order by salary desc limit 3;
-- Q13. [1 Mark] Display the number of employees in each department.
select department, count(*) as employee_count from employees group by department;
-- Q14. [1 Mark] Display only those departments having more than 2 employees.
select department, count(*) as employee_count from employees group by department having count(*) > 2;
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------- */

/*
----------------------------------------------
Section C - Constraints & Inbuilt Functions
----------------------------------------------
*/
-- Q15. [3 Marks] Create a students table with the following columns: student_id, student_name, email, age and
-- course. Apply: student_id -> PRIMARY KEY; student_name -> NOT NULL; email -> UNIQUE; age -> CHECK
-- age >= 18; course -> DEFAULT 'Python'.
create table Students (
	student_id int primary key,
    student_name varchar(50) not null,
    email varchar(30) unique,
    age int check(age >= 18),
    course varchar(50) default 'Python'
);
-- Q16. [2 Marks] Using the employees table, write queries to find: (a) Maximum salary (b) Minimum salary (c)
-- Average salary.
select max(salary) as maximum_salary, min(salary) as minimum_salary, avg(salary) as average_salary from employees;
-- Q17. [1 Mark] Find the total number of employees.
select count(emp_id) as Total_Employees from Employees;
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------- */

/*
--------------------------
Section D - Joins
--------------------------
*/
-- Create the following tables and insert suitable records:
-- departments employees
-- department_id emp_id
-- department_name emp_name
-- department_id
-- salary
create table departments_joins (
    department_id int primary key,
    department_name varchar(50)
);

insert into departments_joins
(department_id, department_name)
values
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');


create table employees_joins (
    emp_id int primary key,
    emp_name varchar(50),
    department_id int,
    salary int
);

insert into employees_joins
(emp_id, emp_name, department_id, salary)
values
(101, 'Amit', 1, 55000),
(102, 'Priya', 2, 45000),
(103, 'Rahul', 3, 60000),
(104, 'Sneha', 1, 65000),
(105, 'Karan', null, 50000);

-- Q18. [2 Marks] Write an INNER JOIN query to display emp_name and department_name.
select e.emp_name, d.department_name from employees_joins e
inner join departments_joins d on e.department_id = d.department_id;
-- Q19. [2 Marks] Write a LEFT JOIN query to display all employees, including employees who are not assigned to
-- any department.
select e.emp_name, d.department_name from employees_joins e
left join departments_joins d on e.department_id = d.department_id;
-- Q20. [2 Marks] Write a query to display employees along with their department and salary.
select e.emp_name, d.department_name, e.salary from employees_joins e
left join departments_joins d on e.department_id = d.department_id;

-- Section E - Window Functions
-- Q21. [2 Marks] Assign a sequential number to every employee based on salary from highest to lowest using
-- ROW_NUMBER().
select *, row_number() over(order by salary desc) as Row_Salary from Employees;
-- Q22. [2 Marks] Rank employees based on salary from highest to lowest using RANK().
select *, rank() over(order by salary desc) as Rank_Salary from Employees;
-- Q23. [1 Mark] Write one difference between RANK() and ROW_NUMBER().
		-- Row Number assigns a seqence numbers to data records but rank assigns them rank on their measurable or 
        -- numerical data like salary or years of experience.
/* --------------------------------------------------------------------------------------------------------------------------------------------------------------- */

/*
--------------------------
Section F - ER Diagram
--------------------------
*/
-- Q24. [7 Marks] An institute manages Students, Courses and Trainers.
-- - A student can enroll in many courses.
-- - A course can have many students.
-- - A trainer can teach many courses.
-- - Each course is taught by one trainer.
-- Design an ER diagram for this system. Your diagram must show:
-- 1. Entities
-- 2. Attributes
-- 3. Primary Keys
-- 4. Foreign Keys
-- 5. Relationships
-- 6. Cardinality
-- 7. Resolution of the many-to-many relationship between Student and Course
