/*
 ----------------------------------1. One-To-One (1:1) Relationship
 
 Example: customers -> customer_profile
 
 Entity
 customers
 customer_profile
 
 One customer has one profile, and one profile belongs to one customer.
 
 customer
 -----------------
 PK customer_id
	customer_name
    
customer_profile
-----------------------
PK profile_id
	address
    city
    customer_id FK + unique
*/
create database erd_db;
use erd_db;

/*
---------------------------------- 2.  One-To-Many (1:N) Relationship

Bank_Customer
--------------
customer_id
customer_name
phone
email

Bank_Account
---------------------
PK account_id
account_type
balance
FK customer_id
*/

/*
---------------------------------- 3. Many-To-Many (N:N) Relationship
Example: students <-> courses

One student can take many courses, and one course can have
many students.

We need a third table: enrollment.

EER structure
students                      enrollment                   courses
----------                    --------------              -----------------------
PK student_id      1 ------N   student_id FK
   student_name							  course_id FK    N--------1  PK course_id
															 course_name
*/