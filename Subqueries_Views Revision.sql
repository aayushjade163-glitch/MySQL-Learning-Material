create database Subquery_Views_Revision;
use Subquery_Views_Revision;

create table Students (
	student_id int,
    student_name varchar(50),
    course varchar(50),
    marks int,
    city varchar(50)
);

insert into Students values
(1, 'Aarav', 'Python', 85, 'Pune'),
(2, 'Priya',  'Java',   70, 'Mumbai'),
(3, 'Rohan',  'Python', 92, 'Pune'),
(4, 'Sneha',  'SQL',    65, 'Mumbai'),
(5, 'Neha',   'Java',   80, 'Pune'),
(6, 'Karan',  'SQL',    75, 'Mumbai');

select * from Students;

-- Create view table for 
create view Student_Avg_Marks as
select student_name, marks 
from Students 
where marks >= 70;
select * from Student_Avg_Marks;

-- Scalar / Single-Row Subquery
-- Find students whose marks are greater than the average marks of all students
select avg(marks) from Students;
select student_name, marks 
from Students
where marks > (select avg(marks) from Students);

-- Multiple Row Subquery - IN
-- Find all the students who study a course in which at least one student scored more than 70 marks.
select course 
from Students 
where marks > 70;
select student_name, course
from Students 
where course in (select course from Students where marks > 70);

-- Table Subquery
-- Find courses whose average marks are greater than 75.
select course, avg(marks) as avg_marks 
from Students 
group by course;
select course, avg_marks 
from
(select course, avg(marks) as avg_marks from Students group by course)
as avg_course
where avg_marks > 75;

-- Correlated Subquery
-- Find students whose marks are greater than the average marks of their own course
select s.student_name, s.marks 
from Students s 
where s.marks > (select avg(s1.marks) from Students s1 where s1.course = s.course);


		