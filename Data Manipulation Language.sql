/* DML - Data Manipulation Language
1. Insert
2. Delete
3. Update
4. Select
*/

create database ProductInventory_DML;
use ProductInventory_DML;

create table Products (
	Product_Id int,
    Name varchar(30),
    Category varchar(30),
    Price int,
    stock int
);

insert into Products (Product_Id, Name, Category, Price, Stock)
values
(121, "Chair", "Furniture", 1000, 10),
(122, "Shirt", "Clothing", 2300, 28),
(123, "Table", "Furniture", 1490, 17);

select * from Products;

-- 1. Update Command
update Products
set Price=2350
where Product_Id=122;

-- Apply 15% Discount on Price col
update Products
set Price= Price * 0.15;

-- Delete a row
delete from Products
where Product_Id=122;

create table Students (
	Student_ID int,
    Name varchar(50),
    Gender varchar(10),
    City varchar(50),
    Course varchar(50),
    Sem1_Marks int,
    Sem2_Marks int
);

insert into Students (Student_ID, Name, Gender, City, Course, Sem1_Marks, Sem2_Marks)
values
(101, 'Amit Sharma', 'Male', 'Pune', 'Computer Engineering', 78, 82),
(102, 'Priya Patil', 'Female', 'Mumbai', 'Data Science', 85, 88),
(103, 'Rahul Joshi', 'Male', 'Nashik', 'Computer Engineering', 72, 75),
(104, 'Sneha Kulkarni', 'Female', 'Pune', 'Information Technology', 91, 89),
(105, 'Rohan Deshmukh', 'Male', 'Nagpur', 'Data Science', 68, 74);
	
