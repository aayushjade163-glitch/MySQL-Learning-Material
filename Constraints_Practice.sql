/*
--------------------------------
Alter Command Using Constraints
--------------------------------
*/
create database Alter_Constraints_Practice;
use Alter_Constraints_Practice;


create table Employees (
	EMP_ID INT,
    EMP_Name VARCHAR(50),
    Email VARCHAR(100),
    Age INT,
    Salary DECIMAL(10,2),
    Dept_ID INT
);

-- 1. Add NOT NULL
-- ALTER TABLE employees
-- MODIFY emp_name VARCHAR(50) NOT NULL;
ALTER TABLE employees
MODIFY emp_name VARCHAR(50) NOT NULL;
DESC employees;

-- 2. Drop NOT NULL
-- ALTER TABLE employees
-- MODIFY emp_name VARCHAR(50) NULL;
ALTER TABLE employees
MODIFY emp_name VARCHAR(50) NULL;
DESC employees;

-- 3. Add UNIQUE
-- ALTER TABLE employees
-- ADD CONSTRAINT uq_email UNIQUE (email);
ALTER TABLE employees
ADD CONSTRAINT uq_email UNIQUE (email);
SHOW INDEX FROM employees;

-- 4. Drop UNIQUE
-- ALTER TABLE employees
-- DROP INDEX uq_email;
ALTER TABLE employees
DROP INDEX uq_email;
SHOW INDEX FROM employees;

-- 5. Add CHECK
-- ALTER TABLE employees
-- ADD CONSTRAINT chk_age CHECK (age >= 18);
ALTER TABLE employees
ADD CONSTRAINT chk_age CHECK (age >= 18);
SHOW CREATE TABLE employees;

-- 6. Drop CHECK
-- ALTER TABLE employees
-- DROP CHECK chk_age;
ALTER TABLE employees
DROP CHECK chk_age;
SHOW CREATE TABLE employees;

-- 7. Add DEFAULT
-- ALTER TABLE employees
-- ALTER salary SET DEFAULT 15000;
ALTER TABLE employees
ALTER salary SET DEFAULT 15000;
DESC employees;

-- 8. Modify DEFAULT
-- ALTER TABLE employees
-- ALTER salary SET DEFAULT 20000;
ALTER TABLE employees
ALTER salary SET DEFAULT 20000;
DESC employees;

-- 9. Drop DEFAULT
-- ALTER TABLE employees
-- ALTER salary DROP DEFAULT;
ALTER TABLE employees
ALTER salary DROP DEFAULT;
DESC employees;

-- 10. Add PRIMARY KEY
-- ALTER TABLE employees
-- ADD CONSTRAINT pk_employee PRIMARY KEY (emp_id);
ALTER TABLE employees
ADD CONSTRAINT pk_employee PRIMARY KEY (emp_id);
DESC employees;

-- 11. Drop PRIMARY KEY
-- ALTER TABLE employees
-- DROP PRIMARY KEY;
ALTER TABLE employees
DROP PRIMARY KEY;
DESC employees;

-- 12. Add FOREIGN KEY
-- ALTER TABLE employees
-- ADD CONSTRAINT fk_department
-- FOREIGN KEY (dept_id)
-- REFERENCES departments(dept_id);
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id);
SHOW CREATE TABLE employees;

-- 13. Drop FOREIGN KEY
-- ALTER TABLE employees
-- DROP FOREIGN KEY fk_department;
ALTER TABLE employees
DROP FOREIGN KEY fk_department;
SHOW CREATE TABLE employees;

/* -------------------------------------------------------------------------------------------------------------------------------------------------------------- */

create database constraint_practice;
use constraint_practice;

/*
=====================================================
TABLE 1: STUDENTS
Create a table named students with:

student_id
student_name
email
age
course
city
=====================================================
*/
create table students (
    student_id int,
    student_name varchar(50),
    email varchar(100),
    age int,
    course varchar(50),
    city varchar(50)
);

-- 1. Make student_id the PRIMARY KEY.
alter table students
add primary key (student_id);

-- 2. Make student_name NOT NULL.
alter table students
modify student_name varchar(50) not null;

-- 3. Make email UNIQUE.
alter table students
add constraint uq_students_email unique (email);

-- 4. Add a CHECK constraint to ensure age is 18 or above.
alter table students
add constraint chk_students_age check (age >= 18);

-- 5. Insert 5 valid records.
insert into students (student_id, student_name, email, age, course, city)
values
(1, 'aayush', 'aayush@gmail.com', 21, 'b.tech', 'pune'),
(2, 'rahul', 'rahul@gmail.com', 22, 'bca', 'mumbai'),
(3, 'priya', 'priya@gmail.com', 20, 'b.tech', 'nashik'),
(4, 'nisha', 'nisha@gmail.com', 23, 'bba', 'pune'),
(5, 'rohan', 'rohan@gmail.com', 21, 'b.sc', 'nagpur');
select * from students;

-- 6. Try inserting two students with the same email.
insert into students (student_id, student_name, email, age, course, city)
values (6, 'amit', 'aayush@gmail.com', 22, 'bca', 'pune');
insert into students (student_id, student_name, email, age, course, city)
values (7, 'karan', 'aayush@gmail.com', 23, 'bca', 'mumbai');

-- 7. Try inserting a student with age less than 18.
insert into students (student_id, student_name, email, age, course, city)
values (8, 'neha', 'neha@gmail.com', 17, 'bba', 'pune');

-- 8. Try inserting a student without student_name.
insert into students (student_id, email, age, course, city)
values (9, 'raj@gmail.com', 21, 'bca', 'pune');
select * from students;

/*
=====================================================
TABLE 2: PRODUCTS
Create a table named products with:

product_id
product_name
category
price
stock
status
=====================================================
*/
create table products (
    product_id int,
    product_name varchar(50),
    category varchar(50),
    price decimal(10,2),
    stock int,
    status varchar(20)
);

-- 9. Make product_id the PRIMARY KEY and AUTO_INCREMENT.
alter table products
modify product_id int primary key auto_increment;

-- 10. Make product_name NOT NULL.
alter table products
modify product_name varchar(50) not null;

-- 11. Add a CHECK constraint so price must be greater than 0.
alter table products
add constraint chk_products_price check (price > 0);

-- 12. Add a CHECK constraint so stock cannot be negative.
alter table products
add constraint chk_products_stock check (stock >= 0);

-- 13. Set the DEFAULT value of status as 'Available'.
alter table products
alter status set default 'Available';

-- 14. Insert 5 products without entering product_id.
insert into products (product_name, category, price, stock, status)
values ('Laptop', 'Electronics', 55000, 10, 'Available');
insert into products (product_name, category, price, stock, status)
values ('Mouse', 'Electronics', 800, 25, 'Available');
insert into products (product_name, category, price, stock, status)
values ('Chair', 'Furniture', 4500, 15, 'Available');
insert into products (product_name, category, price, stock, status)
values ('Shirt', 'Clothing', 1200, 30, 'Available');
insert into products (product_name, category, price, stock, status)
values ('Book', 'Stationery', 500, 50, 'Available');

-- 15. Insert a product without entering status.
insert into products (product_name, category, price, stock)
values ('Keyboard', 'Electronics', 1500, 20);

-- 16. Try inserting a negative price.
insert into products (product_name, category, price, stock)
values ('Phone', 'Electronics', -1000, 5);

-- 17. Try inserting a negative stock.
insert into products (product_name, category, price, stock)
values ('Tablet', 'Electronics', 20000, -5);

/*
=====================================================
TABLE 3: EMPLOYEES
Create a table named employees with:

emp_id
emp_name
email
department
salary
city
=====================================================
*/
create table employees (
    emp_id int,
    emp_name varchar(50),
    email varchar(100),
    department varchar(30),
    salary decimal(10,2),
    city varchar(50)
);

-- 18. Make emp_id the PRIMARY KEY.
alter table employees
add primary key (emp_id);

-- 19. Make email UNIQUE.
alter table employees
add constraint uq_employees_email unique (email);

-- 20. Make emp_name NOT NULL.
alter table employees
modify emp_name varchar(50) not null;

-- 21. Add an ENUM for department:
-- 'HR', 'IT', 'Finance', 'Sales'
alter table employees
modify department enum('HR', 'IT', 'Finance', 'Sales');

-- 22. Add a CHECK constraint so salary must be
-- greater than or equal to 15000.
alter table employees
add constraint chk_employees_salary check (salary >= 15000);

-- 23. Insert 5 valid employees.
insert into employees (emp_id, emp_name, email, department, salary, city)
values (101, 'Amit', 'amit@gmail.com', 'IT', 45000, 'Pune');
insert into employees (emp_id, emp_name, email, department, salary, city)
values (102, 'Nisha', 'nisha@gmail.com', 'HR', 35000, 'Mumbai');
insert into employees (emp_id, emp_name, email, department, salary, city)
values (103, 'Rohan', 'rohan@gmail.com', 'Finance', 50000, 'Pune');
insert into employees (emp_id, emp_name, email, department, salary, city)
values (104, 'Priya', 'priya@gmail.com', 'Sales', 30000, 'Nashik');
insert into employees (emp_id, emp_name, email, department, salary, city)
values (105, 'Rahul', 'rahul@gmail.com', 'IT', 40000, 'Nagpur');

-- 24. Try inserting an employee with an invalid
-- department using ENUM.
insert into employees (emp_id, emp_name, email, department, salary, city)
values (106, 'karan', 'karan@gmail.com', 'Marketing', 30000, 'pune');

/*
=====================================================
TABLE 4: CUSTOMERS
Create a table named customers with:

customer_id
customer_name
email
city
membership
=====================================================
*/

-- 25. Make customer_id the PRIMARY KEY and
-- AUTO_INCREMENT.

-- 26. Make customer_name NOT NULL.

-- 27. Make email UNIQUE.

-- 28. Create an ENUM for membership:

-- 'Basic', 'Premium', 'VIP'

-- 29. Set DEFAULT membership as 'Basic'.

-- 30. Insert 5 customers without entering
-- customer_id and membership.

-- 31. Display all records and check the generated
-- IDs and default membership values.

/*
=====================================================
TABLE 5: ORDERS
Create a table named orders with:

order_id
order_date
customer_id
amount
payment_status
=====================================================
*/

-- 32. Make order_id the PRIMARY KEY and
-- AUTO_INCREMENT.

-- 33. Make order_date NOT NULL.

-- 34. Add a CHECK constraint so amount must be
-- greater than 0.

-- 35. Set payment_status DEFAULT as 'Pending'.

-- 36. Create a FOREIGN KEY on customer_id referencing
-- customers(customer_id).

-- 37. Insert orders using customer IDs that exist
-- in the customers table.

-- 38. Try inserting an order with a customer_id
-- that does not exist.

-- 39. Insert an order without entering payment_status.


/*
=====================================================
TABLE 6: DEPARTMENTS
Create a table named departments with:

dept_id
dept_name
location
manager_name
=====================================================
*/


-- 40. Make dept_id the PRIMARY KEY.

-- 41. Make dept_name NOT NULL and UNIQUE.

-- 42. Insert 4 departments.

-- 43. Create an INDEX on location.

-- 44. Create another INDEX on manager_name.

-- 45. Use SHOW INDEX to view the indexes.

/*
=====================================================
TABLE 7: EMPLOYEE_PROJECT
Create a table named employee_project with:

emp_id
project_id
hours_worked
=====================================================
*/

-- 46. Create a COMPOSITE PRIMARY KEY using
-- emp_id and project_id.

-- 47. Insert records where the same employee works
-- on different projects.

-- 48. Insert records where different employees work
-- on the same project.

-- 49. Try inserting the same emp_id and project_id
-- combination twice.

-- 50. Observe why the duplicate combination is
-- not allowed.

/*
=====================================================
ALTER TABLE PRACTICE

** Use the employees table **
=====================================================
*/

-- 51. Add a NOT NULL constraint to emp_name.

-- 52. Remove the NOT NULL constraint from emp_name.

-- 53. Add a UNIQUE constraint to email.

-- 54. Remove the UNIQUE constraint from email.

-- 55. Add a CHECK constraint so salary must be
-- greater than or equal to 20000.

-- 56. Remove the CHECK constraint.

-- 57. Add a DEFAULT value of 25000 for salary.

-- 58. Change the DEFAULT salary to 30000.

-- 59. Remove the DEFAULT value from salary.

-- 60. Add a PRIMARY KEY to emp_id.

-- 61. Remove the PRIMARY KEY.

-- 62. Add an INDEX on city.

-- 63. Remove the INDEX on city.

/*
=====================================================
FOREIGN KEY PRACTICE

** Use the customers and orders tables **
=====================================================
*/

-- 64. Create a FOREIGN KEY between:
-- orders.customer_id
-- customers.customer_id

-- 65. Insert an order using an existing customer_id.

-- 66. Try inserting an order using a customer_id
-- that does not exist.

-- 67. Create the FOREIGN KEY using ON DELETE CASCADE.

-- 68. Delete a customer who has orders.

-- 69. Check what happens to that customer's orders.

/*
=====================================================
FINAL COMBINATION TASK
Create a table named library_books with:

book_id
book_name
author
category
price
availability

Apply:

- book_id → PRIMARY KEY + AUTO_INCREMENT
- book_name → NOT NULL
- author → NOT NULL
- category → ENUM('Fiction','Science','History','Technology')
- price → CHECK (price > 0)
- availability → DEFAULT 'Available'

Insert 5 valid records.

Then test:

a. Duplicate book_id
b. NULL book_name
c. Negative price
d. Invalid category
e. Missing availability
f. Missing book_id
=====================================================
*/

/*
=====================================================
FINAL CHALLENGE
Create two tables:

COURSES
-------
course_id
course_name
course_fee

STUDENT_COURSES
---------------
student_id
course_id
enrollment_status

Apply:

- course_id → PRIMARY KEY
- course_name → NOT NULL + UNIQUE
- course_fee → CHECK (course_fee > 0)
- student_id + course_id → COMPOSITE PRIMARY KEY
- course_id → FOREIGN KEY
- enrollment_status → DEFAULT 'Active'

Insert valid data and test:

a. Duplicate course name
b. Negative course fee
c. Duplicate student_id + course_id combination
d. Invalid course_id in student_courses
e. Missing enrollment_status
=====================================================
*/

/*
--------------------------------------------------------------------------------------------------------------
Additional Advance use of Foreign Key(FK)
------------------------------------------
1. ON DELETE CASCADE
When a parent record is deleted, all related child records are automatically deleted.

2. ON DELETE SET NULL
When a parent record is deleted, the FOREIGN KEY value in related child records becomes NULL.

3. ON DELETE RESTRICT
Prevents deletion of a parent record if related child records exist.

4. ON UPDATE CASCADE
When the referenced value in the parent table is updated, the matching FOREIGN KEY values 
in the child table are automatically updated.
--------------------------------------------------------------------------------------------------------------
*/





