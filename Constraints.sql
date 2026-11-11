/* 
------------------------------------------------------------------------------------
CONSTRAINTS IN MYSQL

Constraints are rules applied to table columns in a table.

Constraints are used to prevent insertion of invalid data in a table ,and 
accuracy and reliability of the data in the table

MYSQL Constraints
1) NOT NULL 

Definition:
The NOT NULL constraint ensures that a column must contain a value and cannot be NULL

Table: employees

Columns:
emp_id
emp_name
department
*/
create table Employees (
	Emp_ID int,
    Emp_Name varchar(20) not null,
	Department varchar(20)
);

insert into Employees(Emp_ID, Emp_Name, Department)
values
(101, 'Diksha', 'HR'),
(102, 'Nisha', 'Sales');

select * from Employees;

describe Employees;

insert into Employees(Emp_ID, Emp_Name, Department)
values
(103, null, 'Sales');

insert into Employees(Emp_ID, Emp_Name, Department)
values
(104, 'IT');

/*
2) UNIQUE 

Definition:
The unique constraint ensures that duplicate values are not allowed in a column

Table: users

Columns:
user_id
username
email
*/

create table Users (
	User_ID int,
    Username varchar(15) unique,
    email varchar(30)
);

insert into Users(User_ID, Username, Email)
values
(1, 'kriti123', 'kirti@gmail.com'),
(2, 'pratik1234', 'pratik@gmail.com');

select * from Users;

insert into Users(User_ID, Username, Email)
values
(3, 'kriti123', 'kriti12@gmail.com');

-- NOT NULL &  UNIQUE Constraint together
create table New_Users ( 
	User_ID int,
    Username varchar(15) not null unique,
    Email varchar(30)
);

insert into New_Users(User_ID, Username, Email)
values
(11, 'Nisha123', 'nisha@gmail.com'),
(12, 'om1234', 'om@gmail.com');

select * from New_Users;

insert into New_Users(User_ID, Username, Email)
values
(13, 'om1234', 'example@gmail.com');

/*
3) CHECK 

Definition:
The CHECK constraint ensures that the entered value follows 
a specified condition.

Table: products

Columns:
product_id
product_name
price
*/

create table Products (
	Product_ID int,
    Product_Name varchar(30),
    Price int check(Price > 0)
);

insert into Products(Product_ID, Product_Name, Price)
values
(201, 'Shirt', 560),
(202, 'Shoes', 700);

select * from Products;

insert into Products(Product_ID, Product_Name, Price)
values
(203, 'Jacket', 0);

-- Apply check constraint on multiple columns using logical operators

CREATE TABLE Loan (
    Loan_ID INT,
    Customer_Name VARCHAR(50),
    Loan_Amount INT,
    Interest_Rate DECIMAL(5,2),

    CHECK (
        Loan_Amount >= 50000 
        AND Interest_Rate BETWEEN 5 AND 15
    )
);

INSERT INTO Loan (Loan_ID, Customer_Name, Loan_Amount, Interest_Rate)
VALUES (101, 'Aayush', 100000, 8.50);

INSERT INTO Loan (Loan_ID, Customer_Name, Loan_Amount, Interest_Rate)
VALUES (102, 'Rahul', 30000, 8.50);

INSERT INTO Loan (Loan_ID, Customer_Name, Loan_Amount, Interest_Rate)
VALUES (103, 'Rohan', 100000, 18.00);

select * from Loan;

-- Create table Student - S_id, S_Name, S_Course, S_Marks
-- Enter marks in range 0 to 100 only
 
 create table Student (
    S_id INT,
    S_Name VARCHAR(50),
    S_Course VARCHAR(50),
    S_Marks INT CHECK (S_Marks BETWEEN 0 AND 100)
 );
 
 -- Insert valid data 
INSERT INTO Student (S_id, S_Name, S_Course, S_Marks)
VALUES 
(101, 'Aayush', 'B.Tech', 85);

-- Check the inserted data
SELECT * FROM Student;


-- Insert invalid data (will give error because marks are greater than 100)
INSERT INTO Student (S_id, S_Name, S_Course, S_Marks)
VALUES (102, 'Rahul', 'B.Tech', 110);


-- Another invalid example (marks less than 0)
INSERT INTO Student (S_id, S_Name, S_Course, S_Marks)
VALUES (103, 'Priya', 'BCA', -10);

/*
4) DEFAULT

Definition:
The DEFAULT constraint automatically assigns a predefined value
when no value is provided for a column

Table: orders

Columns:
order_id
customer_name
status
*/

create table Orders (
	Order_ID int,
    Customer_Name varchar(20),
    Status varchar(10) default 'Other'
);

insert into Orders(Order_ID, Customer_Name, Status)
values
(111, 'Jay', 'Deliver'),
(112, 'Kartik', 'OFD');

select * from Orders;

insert into Orders(Order_ID, Customer_Name)
values
(113, 'Parth');

/*
5) PRIMARY KEY 

Definition:
A primary key uniquely identifies each record in a table.
It cannot contain duplicate or NULL values.

Table: students

Columns:
student_id
name
course
*/
create table Student_Details (
	Student_ID int primary key,
    Name varchar(50),
    Course varchar(30)
);

insert into Student_Details(Student_ID, Name, Course)
values
(1, 'Nita', 'Python'),
(2, 'Harsh', 'Java');

select * from Student_Details;

insert into Student_Details(Student_ID, Name, Course)
values
(2, 'Parth', 'Java');

/*
Composite Key

Definition:
A composite key is a primary key made up of two or more columns together.
The combination of columns must be unique.

Table: enrollment
 
Columns:
student_id
course_id
enrollment_date
*/

create table Enrollment (
	Student_ID int,
    Course_ID int,
    Enrollment_Date date,
    primary key (Student_ID, Course_ID)
);

insert into Enrollment(Student_ID, Course_ID, Enrollment_Date)
values
(1, 1, '2026-05-25'),
(2, 3, '2026-03-21');

select * from Enrollment;

insert into Enrollment(Student_ID, Course_ID, Enrollment_Date)
values
(1, 4, '2025-09-12');

/*
6) FOREIGN KEY

Definition:
A FOREIGN KEY connects two tables. It says that the value we enter
in the child table must already exist in the parent table.

Table: departments, employees

An employee can be assigned only to an existing department

- Parent Table
Department Columns:
dept_id
dept_name

- Child Table
Employees Columns:
emp_id
emp_name
dept_id
*/

create table Department_Details (
	Dept_ID int primary key,
    Dept_Name varchar(30)
);

insert into Department_Details(Dept_ID, Dept_Name)
values
(201, 'HR'),
(202, 'Finance'),
(203, 'Sales'),
(204, 'Marketing'),
(205, 'CEO');

select * from Department_Details;

create table Employee_Details (
	EMP_ID int primary key,
    EMP_Name varchar(50),
    Dept_ID int,
    foreign key(Dept_ID) references Department_Details(dept_id)
);

insert into Employee_Details(EMP_ID, EMP_Name, Dept_ID)
values
(300, 'Kriti', 202),
(301, 'Nisha', 205);

select * from Employee_Details;

insert into Employee_Details(EMP_ID, EMP_Name, Dept_ID)
values
(302, 'Parth', 207);

/*
Example 2
Tables: Customers, Orders

Customer Columns:
cust_id
cust_name

Orders Columns:
order_id
order_name
cust_id
*/

create table Customer_Table (
	Cust_ID int primary key,
	Cust_Name varchar(20)
);

insert into Customer_Table(Cust_ID, Cust_Name)
values
(11, 'Jayesh'),
(12, 'Nidhi'),
(13, 'Sakshi');

create table Order_Table (
	Order_ID int primary key,
    Order_Name varchar(30),
    Cust_ID int,
    foreign key(Cust_ID) references Customer_Table(cust_id)
);

insert into Order_Table(Order_ID, Order_Name, Cust_ID)
values
(1, 'Shoes',  12),
(2, 'Shirt', 13);

select * from Order_Table;

/*
Related Features/ data types:
1) AUTO-INCREMENT

Definition:
AUTO_INCREMENT is a column attribute that automatically generates the next 
numeric value when a new record is inerted

Table: Students

Columns:
student_id
student_name
course
*/

create table Student_Info (
Student_ID int primary key auto_increment,
Student_Name varchar(50),
Course varchar(30)
);

insert into Student_Info(Student_Name, Course)
values
('Jay', 'Devops'),
('Riya', 'AWS'),
('Nisha', 'AI'),
('Kartik', 'ML');

select * from Student_Info;

-- If a column has different start number for auto-increment

create table Parents (
	Parent_ID int primary key auto_increment,
    Parent_Name varchar(50),
    Parent_Contact bigint
)	auto_increment = 100;

insert into Parents(Parent_Name, Parent_Contact)
values
('Neeta', 9876541230),
('Tanvi', 1234567890);

select * from Parents;

/*
2) INDEX

Definition:
An INDEX is a database structure used to speed up searching 
and retrieving from a table

Table: Product_Table

Columns:
product_id
product_name
category
price
*/

create table Product_Table (
	Product_ID int,
    Product_Name varchar(30),
    Category varchar(30),
    Price int
);

create index idx_category on Product_Table(Category);

insert into Product_Table(Product_ID, Product_Name, Category, Price)
values
(1, 'Bulb', 'Electronic', 45),
(2, 'Mobile', 'Electronic', 23000),
(3, 'Chair', 'Furniture', 2900),
(4, 'Shoes', 'Footwear', 3400);

select * from Product_Table where category='Electronic';

/*
3) ENUM

Definition:
It is a datatype in MySQL that restricts a column to a predefined list of values.
Table: books
Columns:
book_id
book_name
category
availability_status
*/

CREATE TABLE Books (
    Book_ID INT,
    Book_Name VARCHAR(30),
    Category ENUM('History', 'Fiction', 'Literature', 'Science'),
    Availability_Status ENUM('Issued', 'Available') DEFAULT 'Available'
);

insert into Books(Book_ID, Book_Name, Category, Availability_Status)
values
(121, 'Hamlet', 'Literature', 'Issued'),
(122, 'Othello', 'Literature', 'Available');

select * from Books;

insert into Books(Book_ID, Book_Name, Category, Availability_Status)
values
(123, 'Wings of Fire', 'Other', 'Available');

/*
------------------------------------
CREATE DATABASE AND USE DATABASE
------------------------------------
*/
create database constraintdb;
use constraintdb;