create database Studentsdb;

show databases;

use Studentsdb;

-- Create a table
create table Student_Info (
	Stud_Id int,
    Stud_Name varchar(20),
    Stud_Age int,
    Stud_Course varchar(25)
);

-- Insert values
insert into Student_Info (Stud_Id, Stud_Name, Stud_Age, Stud_Course) 
values
(101,"Nisha",24,"Physics");

-- Fetch data from table and display
select * from Student_Info;

-- Insert multiple data
insert into Student_Info values
(102,"Kartik",25,"Maths"),
(103,"Nidhi",23,"Chemistry"),
(104,"Parth",26,"Statistics");

-- Fetching specific column from table
select Stud_Name, Stud_Course from Student_Info;
 
	