/*
-------------------------------------------------------------------------------------------------------------------------------------
Normalization in MySQL is a database design technique used to organise tables
and columns to minimize data redundancy and maintain data integrity.

The main reason for normalization is removing anomalies

--> What are anomalies?
Database anomailes are data inconsistencies or data issues that occur in
unorganised, unnormalized tables during insert, update, or delete operations

Types of anomalies:-
i) Insert:
Insertion anomaly occurs when we cannot insert data due to missing required values

ii) Update:
Update anomaly occurs when updating one value requires multiple update.

iii) Delete:
Delete anomaly occurs when deleting one record unintentionally deletes important data.

--> Types of Dependencies

Relationship between attributes where one attribute determines another.

The concept of dependencies is used in database normalization to mathematically
identify relationship between columns so you can split poorly designed tables
and stop data duplication and errors.

1. Total Functional Dependency :-
A non-key attribute depends on the entire composite key, not just a part of it.

2. Partial Functional Dependency :-
Occurs when non-key attributes depend on part of a composite key.

3. Transitive Functional Dependency :-
Occurs when a non-key attribute depends on another non-key attribute.

Table
student_id | course_id | student_name | course_name | marks | teacher_id | teacher_name |
				101						   python
                
                
(composite key - student_id, course_id)
1) Full Dependency --> (student_id, course_id) --> marks
2) Partial Dependency --> (student_id --> student_name)
3) Transitive Dependency --> (course_id --> teacher_id --> teacher_name)

====================================================================================================================================
First Normal Form (1NF):
-- It has primary key
-- No duplicates data
-- All values are atomic(one cell one value; not separated by comma)

Example of a table that is NOT in 1NF:

student_id | student_name | courses
-----------|--------------|----------------------
1          | rahul        | python, sql
2          | amit         | python, excel

Problem:
The "courses" column contains multiple values in one cell.
Therefore, the values are not atomic.

After converting to 1NF:

student_id | student_name | course
-----------|--------------|---------
1          | rahul        | python
1          | rahul        | sql
2          | amit         | python
2          | amit         | excel

Now each cell contains only one value.

================================================================================================================================
Second Normal Form (2NF):
-- It is already in 1NF
-- It has no partial dependency

Example:

student_id | course_id | student_name | course_name | marks
-----------|-----------|--------------|-------------|------
1          | 101       | rahul        | python      | 85
1          | 102       | rahul        | sql         | 90
2          | 101       | amit         | python      | 78

Composite key = (student_id, course_id)

Here:

(student_id, course_id) --> marks
This is a FULL DEPENDENCY because marks depends on the complete
composite key.

But:

student_id --> student_name

student_name depends only on student_id, not on the complete
composite key.

This is a PARTIAL DEPENDENCY.

Also:

course_id --> course_name

course_name depends only on course_id.

This is also a PARTIAL DEPENDENCY.

Therefore, the table is NOT in 2NF.

To convert it into 2NF, we separate the tables:

STUDENTS

student_id | student_name
-----------|-------------
1          | rahul
2          | amit


COURSES

course_id | course_name
----------|------------
101       | python
102       | sql


ENROLLMENTS

student_id | course_id | marks
-----------|-----------|------
1          | 101       | 85
1          | 102       | 90
2          | 101       | 78

Now:
student_id --> student_name
course_id --> course_name
(student_id, course_id) --> marks

There is no partial dependency in the ENROLLMENTS table.

================================================================================================================================
Third Normal Form (3NF):
-- It is already in 2NF
-- It has no transitive dependency

Example:

student_id | student_name | course_id | teacher_id | teacher_name
-----------|--------------|-----------|------------|-------------
1          | rahul        | 101       | 501        | amit
2          | rohan        | 102       | 502        | priya
3          | amit         | 101       | 501        | amit

Here:

student_id --> course_id
course_id --> teacher_id
teacher_id --> teacher_name

Therefore:

student_id --> teacher_id --> teacher_name

teacher_name depends on teacher_id,
and teacher_id depends on course_id/student information.

So teacher_name indirectly depends on the key through another
non-key attribute.

This is called TRANSITIVE DEPENDENCY.

Therefore, the table is NOT in 3NF.

To convert it into 3NF, we separate the tables:

STUDENTS

student_id | student_name
-----------|-------------
1          | rahul
2          | rohan
3          | amit


COURSES

course_id | course_name | teacher_id
----------|-------------|-----------
101       | python      | 501
102       | sql         | 502


TEACHERS

teacher_id | teacher_name
-----------|-------------
501        | amit
502        | priya

Now:

student_id --> student_name

course_id --> course_name, teacher_id

teacher_id --> teacher_name

There is no transitive dependency in the individual tables.

================================================================================================================================
Boyce-Codd Normal Form (BCNF)
-- Stronger version of 3NF.
-- Every determinant must be a candidate key.
-- When needed if multiple candidate key exist and complex business rules.
================================================================================================================================
Denormalization
-- Intentionally breaking normalization
-- To improve performance
-- E.g., Store username inside PostTable & Avoid joins for fast reads
-- Used when system is read-heavy, performance is more important than redundancy


-------------------------------------------------------------------------------------------------------------------------------------
*/


/*
=====================================================================================================================================

QUICK WAY TO REMEMBER

1NF --> ATOMIC VALUES
      One cell = One value

2NF --> REMOVE PARTIAL DEPENDENCY
      Non-key column must depend on the COMPLETE composite key

3NF --> REMOVE TRANSITIVE DEPENDENCY
      Non-key column should not depend on another non-key column


-------------------------------------------------------------------------------------------------------------------------------------
*/

create database Normalization_DB;
use Normalization_DB;

-- unnormalized form table

create table Student_Course_Unf (
	student_id int,
    student_name varchar(50),
    courses varchar(100),
    teachers varchar(100),
    teacher_id varchar(20),
    teacher_phone varchar(50)
);

insert into Student_Course_Unf values
(101, 'Akanksha', 'Python, MySQL', 'Neha, Amit', 'T01, T02', '9876543210, 8765432109'),
(102, 'Rahul', 'Python', 'Neha', 'T01', '9876543210'),
(103, 'Priya', 'MySQL, Power BI', 'Amit, Sneha', 'T02, T03', '8765432109, 7654321098');

select * from Student_Course_Unf;

/*
-----------------------------------------------------------------------------------------------------------------
FIRST NORMAL FORM (1NF)

Rules:
1. Each cell must contain a single, atomic value.
2. No comma-separated multiple values in a cell.
3. Each row should be uniquely indentifiable.

composite key - (student_id, courses)
-----------------------------------------------------------------------------------------------------------------
*/
create table Student_Course_1nf (
	student_id int,
    student_name varchar(50),
    courses varchar(100),
    teachers varchar(100),
    teacher_id varchar(5),
    teacher_phone varchar(50),
    primary key(student_id, courses)
);

insert into Student_Course_1nf values
(101, 'Akanksha', 'Python', 'Neha', 'T01', '9876543210'),
(101, 'Akanksha', 'MySQL', 'Amit', 'T02', '8765432109'),
(102, 'Rahul', 'Python', 'Neha', 'T02', '9876543210'),
(103, 'Priya', 'MySQL', 'Amit', 'T02', '8765432109'),
(103, 'Priya', 'Power BI', 'Sneha', 'T03', '7654321098');

select * from Student_Course_1nf;

/*
-----------------------------------------------------------------------------------------------------------------
SECOND NORMAL FORM (2NF)

Rules:
1. Table must be in 1NF.
2. No partial dependency

-- Your table is already in 1NF
-- Partial dependency is there
-- student_id -> student_name
-- courses -> teachers, teacher_id, teacher_phone

-- create separate table for student and course
-----------------------------------------------------------------------------------------------------------------
*/
create table Student (
	student_id int primary key,
    student_name varchar(100)
);

insert into Student values
(101, 'Akansha'),
(102, 'Rahul'),
(103, 'Priya');

create table Course (
	course_id int primary key,
	courses varchar(50),
	teachers varchar(100),
    teacher_id varchar(5),
    teacher_phone varchar(50)
);

insert into Course values
(201, 'Python', 'Neha', 'T01', '9876543210'),
(202, 'MySQL', 'Amit', 'T02', '8765432109'),
(203, 'Power BI', 'Sneha', 'T03', '7654321098');

select * from Course;

-- Connect Student & Course table by creating enrollment table
create table Enrollment (
	student_id int,
    course_id int,
	primary key (student_id, course_id),
	foreign key(student_id) references Student(student_id),
    foreign key(course_id) references Course(course_id)
);

select * from Student_Course_1nf;

insert into Enrollment values
(101, 201),
(101, 202),
(102, 201),
(103, 202),
(103, 203);

/*
-----------------------------------------------------------------------------------------------------------------
THIRD NORMAL FORM (3NF)

Rules:
1. Table must be in 2NF.
2. No transitive dependency of non-key attributes on the primary key

-- Your table is already in 2NF
-- Transitive dependency on course table
-- course_id -> course_name
-- course_id -> teacher_id -> teacher_name, teacher_phone
-----------------------------------------------------------------------------------------------------------------
*/

-- Teacher table
create table Teacher (
	teacher_id varchar(5) primary key,
    teacher varchar(100),
    teacher_phone varchar(50)
);

insert into Teacher value
('T01', 'Neha', '9876543210'),
('T02', 'Amit', '876542109'),
('T03', 'Sneha', '7654321098');

select * from Teacher;

select * from Course;

-- modify the Course table
-- drop teachers, teacher_id, teacher_phone from Course
alter table Course
drop teachers, 
drop teacher_id, 
drop teacher_phone, 
add teacher_id varchar(5);

-- add foreign key to Course table
alter table Course
add constraint fk_course_teacher
foreign key (teacher_id) references teacher(teacher_id);

select * from Course;

show create table Course;

-- insert data in teacher_id col in Course table
update Course
set teacher_id = 'T01'
where course_id = 201;

update Course
set teacher_id = 'T02'
where course_id = 202;

update Course
set teacher_id = 'T03'
where course_id = 203;

select * from Student;
select * from Course;
select * from Teacher;
select * from Enrollment;

/*
-----------------------------------------------------------------------------------------------------------------
BOYCE-CODD NORMAL FORM (BCNF)

-- student_id, course, teacher
-- student_id -> course
-----------------------------------------------------------------------------------------------------------------
*/
