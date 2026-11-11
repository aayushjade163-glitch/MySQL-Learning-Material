create database Student_Records_DML;
use Student_Records_DML;

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

select * from Students;

-- Delete specific data from column
update Students
set Sem1_Marks=null
where Student_ID=103;

-- create new column
alter table Students
add Total_Marks int;

-- fill data in Total_Marks
update Students
set Total_Marks=Sem1_Marks + Sem2_Marks;