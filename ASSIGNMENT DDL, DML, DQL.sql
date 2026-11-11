/*
============================================================
 EMPLOYEES TABLE – DDL, DML AND DQL PRACTICE
============================================================ 
*/
CREATE DATABASE Employee_Management_DDL_DML_DQL;
USE Employee_Management_DDL_DML_DQL;
/*
============================================================
DDL TASKS – EMPLOYEES TABLE
============================================================
*/
-- 1. Create the employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

-- 2. Add a new column email to the employees table
ALTER TABLE employees
ADD email VARCHAR(100);

-- 3. Add a new column phone to the employees table
ALTER TABLE employees
ADD phone VARCHAR(15);

-- 4. Modify the salary column so that it can store decimal values
ALTER TABLE employees
MODIFY salary DECIMAL(10,2);

-- 5. Rename the column city to location
ALTER TABLE employees
RENAME COLUMN city TO location;

-- 6. Drop the phone column
ALTER TABLE employees
DROP COLUMN phone;

-- 7. Add a column joining_year
ALTER TABLE employees
ADD joining_year INT;

/*
============================================================
DML TASKS – INSERT OPERATIONS
============================================================
*/

-- 16. Insert the 5 employees given in the assignment
INSERT INTO employees
(emp_id, emp_name, department, salary, location)
VALUES
(101, 'Amit', 'IT', 45000, 'Pune'),
(102, 'Neha', 'HR', 38000, 'Mumbai'),
(103, 'Rahul', 'Finance', 52000, 'Pune'),
(104, 'Priya', 'IT', 48000, 'Nashik'),
(105, 'Sneha', 'Sales', 40000, 'Mumbai');

-- 18. Insert a new employee
INSERT INTO employees
(emp_id, emp_name, department, salary, location)
VALUES
(106, 'Kiran', 'Marketing', 42000, 'Aurangabad');

-- 20. Insert two employees using a single INSERT statement
INSERT INTO employees
(emp_id, emp_name, department, salary, location)
VALUES
(107, 'Rohan', 'IT', 46000, 'Pune'),
(108, 'Anjali', 'HR', 41000, 'Mumbai');

/*
============================================================
DML TASKS – UPDATE OPERATIONS
============================================================
*/

-- 21. Increase the salary of all employees by 10%
UPDATE employees
SET salary = salary * 1.10;

-- 22. Change Amit's salary to 50000
UPDATE employees
SET salary = 50000
WHERE emp_name = 'Amit';

-- 23. Change Neha's location to Pune
UPDATE employees
SET location = 'Pune'
WHERE emp_name = 'Neha';

/*
============================================================
DML TASKS – DELETE OPERATIONS
============================================================
*/

-- 27. Delete the employee whose emp_id is 106
DELETE FROM employees
WHERE emp_id = 106;

/*
============================================================
DQL TASKS – SELECT OPERATIONS
============================================================
*/

-- 31. Display all records from employees
SELECT *
FROM employees;

-- 33. Display only emp_name and salary from employees
SELECT emp_name, salary
FROM employees;

-- 35. Display emp_id, emp_name, and department
SELECT emp_id, emp_name, department
FROM employees;

-- 37. Display employee names with their locations
SELECT emp_name, location
FROM employees;

/*__________________________________________________________________________________________________________________________________________________________________________*/

/*
============================================================
PRODUCTS TABLE – DDL, DML AND DQL PRACTICE
============================================================
*/

/*
============================================================
CREATE AND USE DATABASE
============================================================
*/
CREATE DATABASE Product_Management_DDL_DML_DQL;
USE Product_Management_DDL_DML_DQL;

/*
============================================================
DDL TASKS – PRODUCTS TABLE
============================================================
*/

-- 8. Create the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

-- 9. Add a new column supplier to the products table
ALTER TABLE products
ADD supplier VARCHAR(100);

-- 10. Modify the product_name column to allow up to 100 characters
ALTER TABLE products
MODIFY product_name VARCHAR(100);

-- 11. Rename the column stock to quantity
ALTER TABLE products
RENAME COLUMN stock TO quantity;

-- 12. Drop the supplier column
ALTER TABLE products
DROP COLUMN supplier;

/*
============================================================
DML TASKS – INSERT OPERATIONS
============================================================
*/

-- 17. Insert the 5 products given in the assignment
INSERT INTO products
(product_id, product_name, category, price, quantity)
VALUES
(201, 'Laptop', 'Electronics', 55000, 10),
(202, 'Mouse', 'Electronics', 800, 50),
(203, 'Chair', 'Furniture', 4500, 20),
(204, 'Desk', 'Furniture', 9000, 15),
(205, 'Keyboard', 'Electronics', 1500, 30);

-- 19. Insert a new product
INSERT INTO products
(product_id, product_name, category, price, quantity)
VALUES
(206, 'Monitor', 'Electronics', 12000, 12);

/*
============================================================
DML TASKS – UPDATE OPERATIONS
============================================================
*/

-- 24. Increase the price of all products by 5%
UPDATE products
SET price = price * 1.05;

-- 25. Change the price of Laptop to 60000
UPDATE products
SET price = 60000
WHERE product_name = 'Laptop';

-- 26. Change the quantity of Mouse to 100
UPDATE products
SET quantity = 100
WHERE product_name = 'Mouse';

/*
============================================================
DML TASKS – DELETE OPERATIONS
============================================================
*/

-- 28. Delete the product whose product_id is 206
DELETE FROM products
WHERE product_id = 206;

/*
============================================================
DQL TASKS – SELECT OPERATIONS
============================================================
*/

-- 32. Display all records from products
SELECT *
FROM products;

-- 34. Display only product_name and price from products
SELECT product_name, price
FROM products;

-- 36. Display product_id, product_name, and category
SELECT product_id, product_name, category
FROM products;

-- 38. Display product names with their prices
SELECT product_name, price
FROM products;

/*___________________________________________________________________________________________________________________________________________________________________________*/

/*
============================================================
CUSTOMERS TABLE – DDL PRACTICE
============================================================
*/

/*
============================================================
CREATE AND USE DATABASE
============================================================
*/
CREATE DATABASE Customer_Management_DDL_DML;
USE Customer_Management_DDL_DML;

-- 13. Create a new table called customers with: customer_id, customer_name, city, phone
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    phone VARCHAR(15)
);

/*
============================================================
INSERT SAMPLE RECORDS
============================================================
*/

INSERT INTO customers
(customer_id, customer_name, city, phone)
VALUES
(301, 'Raj', 'Pune', '9876543210'),
(302, 'Pooja', 'Mumbai', '9876543211'),
(303, 'Vikas', 'Nagpur', '9876543212');

-- 14. Remove all records from customers using TRUNCATE
TRUNCATE TABLE customers;

-- 15. Delete the customers table using DROP
DROP TABLE customers;

/*___________________________________________________________________________________________________________________________________________________________________________*/

/*
============================================================
TEMPORARY TABLE
============================================================
*/

CREATE DATABASE Temporary_Table_Practice;
USE Temporary_Table_Practice;

-- 29. Create a temporary table, insert some records,
-- and delete all records using DELETE.
CREATE TEMPORARY TABLE temporary_data (
    id INT,
    name VARCHAR(50)
);

INSERT INTO temporary_data
VALUES
(1, 'Amit'),
(2, 'Neha'),
(3, 'Rahul');

DELETE FROM temporary_data;

/*___________________________________________________________________________________________________________________________________________________________________________*/

/*
============================================================
STUDENTS TABLE
============================================================
*/

CREATE DATABASE Student_Management;
USE Student_Management;

-- 30. Create a students table, insert 3 records,
-- and delete all records using DELETE.
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO students
VALUES
(101, 'Aarav', 'Pune'),
(102, 'Riya', 'Mumbai'),
(103, 'Om', 'Nagpur');

DELETE FROM students;

