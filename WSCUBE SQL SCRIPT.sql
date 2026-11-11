-- Create a new database named userDB
-- Purpose: To store all user-related tables and data
CREATE DATABASE userDB;

-- Select the database to work on
-- Purpose: All further operations will apply to userDB
USE userDB;

-- Create Users table
-- Purpose: Store user details with constraints
CREATE TABLE Users (
User_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique user ID, auto-generated
User_Name VARCHAR(50) NOT NULL, -- User name cannot be NULL
User_EMAIL_ID VARCHAR(50) UNIQUE, -- Email must be unique
Age INT CHECK(Age>=18),  -- Only users age 18 or above allowed
UserPhone int   -- User phone number
);

-- Add address column to Users table
-- Purpose: Store user address
ALTER TABLE USERS ADD User_Address VARCHAR(100);

-- Add status column
-- Purpose: Store user status (1 = active, 0 = inactive)
ALTER TABLE USERS ADD User_Status TINYINT;

-- Modify email column size and make it NOT NULL
-- Purpose: Increase email length and enforce mandatory value
ALTER TABLE Users MODIFY User_EMAIL_ID VARCHAR(100) NOT NULL;

-- Rename User_Address column to Address and change its size
-- Purpose: Change column name and definition
ALTER TABLE Users CHANGE COLUMN User_Address Address VARCHAR(50);

-- Remove Address column
-- Purpose: Column no longer needed
ALTER TABLE Users DROP COLUMN Address;

-- Remove User_Status column
ALTER TABLE Users DROP COLUMN User_Status;

-- Rename Users table to UserList
-- Purpose: Change table name
ALTER TABLE Users RENAME TO UserList;

-- Rename table back to Users
ALTER TABLE UserList RENAME TO Users;

-- Display all user records
SELECT * FROM USERS;

-- Insert first user record
INSERT INTO Users(User_Name, User_EMAIL_ID, Age, UserPhone) 
VALUES("Ram", "ram@gmail.com", 20, 25641454);

INSERT INTO Users(User_Name, User_EMAIL_ID, Age, UserPhone) 
VALUES("Ravi", "ravi@gmail.com", 25, 6545454);
INSERT INTO Users(User_Name, User_EMAIL_ID, Age, UserPhone) 
VALUES("Raj", "raj@gmail.com", 22, 65441451);
INSERT INTO Users(User_Name, User_EMAIL_ID, Age, UserPhone) 
VALUES("Pradeep", "pradeep@gmail.com", 29, 654545124);

-- Delete user with ID = 1
DELETE FROM Users WHERE User_ID = 1;

-- Attempt to delete user with ID = 5 (may not exist)
DELETE FROM Users WHERE User_ID = 5;

-- Delete user with ID = 3
DELETE FROM Users WHERE User_ID = 3;

-- Remove all records from Users table
-- Purpose: Fast delete, reset auto_increment
TRUNCATE TABLE Users;

-- Delete Dept table completely
-- Purpose: Remove table structure + data
DROP TABLE Dept;

-- Update user with ID = 4
-- Purpose: Change name and email
UPDATE Users SET 
User_Name='Pradeep Rai', 
User_EMAIL_ID='pradeep@wscubetech.com' 
WHERE User_ID=4;

-- Update user with ID = 2
UPDATE Users SET 
User_Name='Ravi WS', 
User_EMAIL_ID='ravi@wscubetech.com' 
WHERE User_ID=2;

-- Create Department table
-- Purpose: Store department names
CREATE TABLE Dept (
Dept_ID INT PRIMARY KEY AUTO_INCREMENT,
Dept_Name VARCHAR(50) NOT NULL
);

-- Display Dept table
SELECT * FROM DEPT;
