CREATE DATABASE StudentManagement_DB;
USE StudentManagement_DB;

create table Students (
Student_ID int primary key auto_increment,
Student_Name varchar(50),
Student_Gender enum('M','F'),
Student_Contact varchar(30),
Student_Email varchar(50)
);

create table Subjects (
Subject_ID int primary key auto_increment,
Subject_Name varchar(50)
);

create table Marks (
Mark_ID int primary key auto_increment,
Student_ID int,
Subject_ID int,
Marks int,
foreign key(Student_ID) references Students(Student_ID),
foreign key(Subject_ID) references Subjects(Subject_ID)
);

delimiter $$
create procedure addStudent(
Student_Name varchar(50),
Student_Gender enum('M','F'),
Student_Contact varchar(50),
Student_Email varchar(50)
)
begin
insert into Students(Student_Name, Student_Gender, Student_Contact, Student_Email)
values (Student_Name, Student_Gender, Student_Contact, Student_Email);
end $$
delimiter ;
call addStudent("Ravi", "M", "9153455353", "ravi@gmail.com");
call addStudent("Raj", "M", "9145645456", "raj@gmail.com");
call addStudent("Priya", "F", "9175675756", "priya@gmail.com");
call addStudent("Rani", "F", "9178678786", "rani@gmail.com");

insert into Subjects(Subject_Name) values ('Hindi'), ('Mathematics'), ('English'), ('Science'), ('Social Studies');

insert into Marks(Student_ID, Subject_ID, Marks) values
(1, 1, 59), (1, 2, 69), (1, 3, 55), (1, 4, 65), (1, 5, 55);
insert into Marks(Student_ID, Subject_ID, Marks) values
(2, 1, 75), (2, 2, 55), (2, 3, 68), (2, 4, 66), (2, 5, 57); 
insert into Marks(Student_ID, Subject_ID, Marks) values
(3, 1, 80), (3, 2, 85), (3, 3, 88), (3, 4, 90), (3, 5, 79); 
insert into Marks(Student_ID, Subject_ID, Marks) values
(4, 1, 77), (4, 2, 83), (4, 3, 86), (4, 4, 91), (4, 5, 78); 

select m.Mark_ID, m.Marks, s.Subject_Name, st.Student_Name from Marks m
join Subjects s on m.Subject_ID=s.Subject_ID 
join Students st on m.Student_ID=st.Student_ID
order by Mark_ID;

select 
s.Student_ID, 
s.Student_Name, 
SUM(m.Marks) as Total_Marks
from Students s 
join Marks m 
on s.Student_ID=m.Student_ID
group by s.Student_ID, 
s.Student_Name
order by Total_Marks;

select 
s.Student_ID, 
s.Student_Name, 
SUM(m.Marks) as Total_Marks
from Students s 
join Marks m 
on s.Student_ID=m.Student_ID
group by s.Student_ID, 
s.Student_Name
order by Total_Marks desc;

select 
s.Student_ID, 
s.Student_Name, 
SUM(m.Marks) as Total_Marks
from Students s 
join Marks m 
on s.Student_ID=m.Student_ID
group by s.Student_ID, 
s.Student_Name
order by Total_Marks desc limit 1;

select 
s.Student_ID, 
s.Student_Name, 
SUM(m.Marks) as Total_Marks, avg(m.Marks) as Average
from Students s 
join Marks m 
on s.Student_ID=m.Student_ID
group by s.Student_ID, 
s.Student_Name
order by Total_Marks desc;

