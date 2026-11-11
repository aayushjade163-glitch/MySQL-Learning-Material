CREATE DATABASE SchoolDB;

USE SchoolDB;

CREATE TABLE Students (
Student_ID INT PRIMARY KEY AUTO_INCREMENT,
Student_Name VARCHAR(50) NOT NULL,
EMAIL_ID VARCHAR(100) UNIQUE,
Age INT CHECK(Age>=18),
Course VARCHAR(50)
);

INSERT INTO Students (Student_Name, EMAIL_ID, Age, Course)
VALUES ("Ram", "ram@gmail.com", 21, "BCA");
INSERT INTO Students (Student_Name, EMAIL_ID, Age, Course)
VALUES ("Ravi", "ravi@gmail.com", 20, "MCA"), ("Raj", "raj@gmail.com", 22, "BTECH"), ("Pradeep", "pradeep@gmail.com", 29, "LLB");

UPDATE Students SET Course="MCA"  WHERE Student_ID=1;

DELETE FROM Students WHERE Student_ID = 3;