/*
==================================================================
MYSQL JOINS
A JOIN is used to combine data from two or more tables based on a 
related column between them.
==================================================================
*/
create database JoinsDB;
use JoinsDB;

/*
==================================================================
1. INNER JOIN

INNER JOIN combines rows from two tables and returns only those 
records where a matching value exists in both tables.

Syntax:
select column_name
from table1
inner join table2 on table1.column = table2.column
==================================================================
*/

/*
EXAMPLE 1: STUDENTS AND COURSES
--------------------------------
*/
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT
);

INSERT INTO students VALUES
(1, 'Rahul', 101),
(2, 'Priya', 102),
(3, 'Amit', 101),
(4, 'Neha', 104),
(5, 'Karan', 103);


CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO courses VALUES
(101, 'Python'),
(102, 'MySQL'),
(103, 'Power BI'),
(105, 'Tableau');

-- 1. Display the student name and their corresponding course name.
-- Display only those students whose course exists in courses table.
select s.student_id, s.student_name, s.course_id,c.course_id, c.course_name
from students s
inner join courses c on s.course_id = c.course_id;

/*
EXAMPLE 2: EMPLOYEES AND DEPARTMENTS
------------------------------------
*/
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees VALUES
(1, 'Rahul', 10),
(2, 'Priya', 20),
(3, 'Amit', 10),
(4, 'Neha', 30);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(10, 'IT'),
(20, 'HR'),
(40, 'Finance');

-- 2. Display the employee name and department name for employees whose
-- department exists in the departments table. 
select e.emp_id, e.emp_name, e.department_id, d.department_id, d.department_name
from employees e
inner join departments d on e.department_id = d.department_id;

/*
EXAMPLE 3: ORDERS AND CUSTOMERS
-------------------------------
*/
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(101, 1, 5000),
(102, 2, 3000),
(103, 5, 7000);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit');

-- 3. Display the order ID, customer name and order amount only for
-- order having a matching customer
select o.order_id, o.customer_id, o.amount, c.customer_id, c.customer_name
from orders o
inner join customers c on o.customer_id = c.customer_id;

/*
=======================================================================
2. LEFT JOIN

LEFT JOIN returns all records from the left table and the matching
records from the right table. If there is no match, NULL is returned
for the right table column.

========================================================================
*/

/*
EXAMPLE 1: STUDENTS AND COURSES
--------------------------------
*/
CREATE TABLE students_left (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT
);

INSERT INTO students_left VALUES
(1, 'Rahul', 101),
(2, 'Priya', 102),
(3, 'Amit', 104),
(4, 'Neha', 103);


CREATE TABLE courses_left (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO courses_left VALUES
(101, 'Python'),
(102, 'MySQL'),
(103, 'Power BI');

-- 1. Display all students along with their course names.
-- Students should be displayed even if they do not have a matching course. 
select * from students_left s
left join courses_left c on s.course_id = c.course_id;

/*
EXAMPLE 2: CUSTOMERS AND ORDERS
-------------------------------
*/
CREATE TABLE customers_left (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers_left VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Neha');


CREATE TABLE orders_left (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO orders_left VALUES
(101, 1, 5000),
(102, 2, 3000),
(103, 1, 2000);

-- 2. Display all customers along with their order IDs.
-- Customers who have not placed any order should be displayed
select * from customers_left c
left join orders_left o on c.customer_id = o.customer_id;

/*
EXAMPLE 3: EMPLOYEES AND DEPARTMENTS
------------------------------------
*/
CREATE TABLE employees_left (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees_left VALUES
(1, 'Rahul', 10),
(2, 'Priya', 20),
(3, 'Amit', 30),
(4, 'Neha', 40);


CREATE TABLE departments_left (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments_left VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance');

-- 3. Display all employees along with their department names
-- Employees whose department does not exist in the departments table
-- should be displayed
select * from employees_left e
left join departments_left d on e.department_id = d.department_id;

/*
==================================================================
3. RIGHT JOIN

RIGHT JOIN returns all records from the right table and the matching
records from the left table. If there is no match, NULL is returned
for the left table column.
==================================================================
*/

/*
EXAMPLE 1: STUDENTS AND COURSES
--------------------------------
*/
CREATE TABLE students_right (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT
);

INSERT INTO students_right VALUES
(1, 'Rahul', 101),
(2, 'Priya', 102),
(3, 'Amit', 101);


CREATE TABLE courses_right (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO courses_right VALUES
(101, 'Python'),
(102, 'MySQL'),
(103, 'Power BI');

-- 1. 
select * from students_right s
right join courses_right c on s.course_id = c.course_id;

/*
EXAMPLE 2: EMPLOYEES AND DEPARTMENTS
------------------------------------
*/
CREATE TABLE employees_right (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees_right VALUES
(1, 'Rahul', 10),
(2, 'Priya', 20),
(3, 'Amit', 10);


CREATE TABLE departments_right (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments_right VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance');

-- 2. 
select * from employees_right e
right join departments_right d on e.department_id = d.department_id;

/*
EXAMPLE 3: ORDERS AND PRODUCTS
------------------------------
*/
CREATE TABLE orders_right (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT
);

INSERT INTO orders_right VALUES
(101, 1, 2),
(102, 2, 5),
(103, 1, 3);


CREATE TABLE products_right (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO products_right VALUES
(1, 'Laptop'),
(2, 'Mouse'),
(3, 'Keyboard');

-- 3.
select * from orders_right o
right join products_right p on o.product_id = p.product_id;
/*
=======================================================================
4. CROSS JOIN

CROSS JOIN returns every possible combination of rows from two tables
It does not require a related column between the tables.
=======================================================================
*/

/*
EXAMPLE 1: SIZES AND COLORS
---------------------------
*/
CREATE TABLE sizes (
    size_id INT PRIMARY KEY,
    size_name VARCHAR(20)
);

INSERT INTO sizes VALUES
(1, 'Small'),
(2, 'Medium'),
(3, 'Large');


CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(20)
);

INSERT INTO colors VALUES
(1, 'Red'),
(2, 'Blue');

-- 1. Generate every possible combination of sizes and colors for a product.
select * from sizes
cross join colors;

/*
EXAMPLE 2: STUDENTS AND COURSES
--------------------------------
*/
CREATE TABLE students_cross (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

INSERT INTO students_cross VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit');


CREATE TABLE courses_cross (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO courses_cross VALUES
(101, 'Python'),
(102, 'MySQL');

-- 2. 
select * from students_cross
cross join courses_cross;

/*
EXAMPLE 3: EMPLOYEES AND SHIFTS
-------------------------------
*/
CREATE TABLE employees_cross (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50)
);

INSERT INTO employees_cross VALUES
(1, 'Rahul'),
(2, 'Priya');


CREATE TABLE shifts (
    shift_id INT PRIMARY KEY,
    shift_name VARCHAR(30)
);

INSERT INTO shifts VALUES
(1, 'Morning'),
(2, 'Afternoon'),
(3, 'Night');

-- 3. 
select * from employees_cross
cross join shifts;

/*
==================================================================
5. SELF JOIN

SELF JOIN is used to join a table with itself. It is commonly used
when rows in the same table are related to each other.
==================================================================
*/

/*
EXAMPLE 1: EMPLOYEES AND MANAGERS
---------------------------------
*/
CREATE TABLE employees_self (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees_self VALUES
(1, 'Rahul', NULL),
(2, 'Priya', 1),
(3, 'Amit', 1),
(4, 'Neha', 2),
(5, 'Karan', 2);

-- 1. Display each employee along with the same of their manager
select e.emp_name as employee, m.emp_name as manager
from employees_self e
join employees_self m
on e.manager_id = m.emp_id;


/*
EXAMPLE 2: EMPLOYEES AND MANAGERS
---------------------------------
*/
CREATE TABLE employees_self2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees_self2 VALUES
(1, 'Anita', NULL),
(2, 'Rohit', 1),
(3, 'Sneha', 1),
(4, 'Vikas', 2),
(5, 'Pooja', 2);

-- 2. Find the names of all employees who report directly to Anita
select e.emp_name as employee, m.emp_name as manager
from employees_self2 e
join employees_self2 m
on e.manager_id = m.emp_id 
where m.emp_name = 'Anita';

/*
EXAMPLE 3: EMPLOYEES AND MANAGERS
---------------------------------
*/
CREATE TABLE employees_self3 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees_self3 VALUES
(101, 'Amit', NULL),
(102, 'Priya', 101),
(103, 'Rahul', 101),
(104, 'Sneha', 102),
(105, 'Rohan', 102);

-- 3. Display the employee ID, employee name, manager ID and manager name
-- for all employees who have a manager
select e.emp_id, e.emp_name, e.manager_id, m.emp_name as manager
from employees_self3 e
join employees_self3 m
on e.manager_id = m.emp_id;

/*
==================================================================
6. FULL OUTER JOIN

FULL OUTER JOIN returns all records from both tables. It includes
matching records as well as unmatched records from both tables.

Note:
MySQL doesn't directly support FULL OUTER JOIN
In MySQL, it can be achieved using LEFT JOIN + RIGHT JOIN + UNION
==================================================================
*/

/*
EXAMPLE 1: STUDENTS AND COURSES
--------------------------------
*/
CREATE TABLE students_full (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT
);

INSERT INTO students_full VALUES
(1, 'Rahul', 101),
(2, 'Priya', 102),
(3, 'Amit', 104);


CREATE TABLE courses_full (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO courses_full VALUES
(101, 'Python'),
(102, 'MySQL'),
(103, 'Power BI');

-- 1. Display all students and all courses.
select * from students_full s
left join courses_full c on s.course_id = c.course_id
union
select  * from students_full s
right join courses_full c
on s.course_id = c.course_id;

/*
EXAMPLE 2: EMPLOYEES AND DEPARTMENTS
------------------------------------
*/
CREATE TABLE employees_full (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees_full VALUES
(1, 'Rahul', 10),
(2, 'Priya', 20),
(3, 'Amit', 30);


CREATE TABLE departments_full (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments_full VALUES
(10, 'IT'),
(20, 'HR'),
(40, 'Finance');

select * from employees_full e 
left join departments_full d
on e.department_id = d.department_id
union
select * from employees_full e 
right join departments_full d
on e.department_id = d.department_id;

/*
EXAMPLE 3: CUSTOMERS AND ORDERS
-------------------------------
*/
CREATE TABLE customers_full (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers_full VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit');


CREATE TABLE orders_full (
    order_id INT PRIMARY KEY,
    customer_id INT
);

INSERT INTO orders_full VALUES
(101, 1),
(102, 2),
(103, 5);

select * from orders_full o
left join customers_full c on o.customer_id = c.customer_id
union
select * from orders_full o
right join customers_full c on o.customer_id = c.customer_id;
