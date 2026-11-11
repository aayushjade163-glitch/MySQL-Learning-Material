-- Create a new database
-- Purpose: To store all company related data
CREATE DATABASE Company_DB;

-- Use the created database
USE Company_DB;

-- Create Dept table
-- Purpose: Store department details
CREATE TABLE Dept (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50),
    Budget INT
);
-- Insert records into Dept table
-- Output: 8 department rows inserted
INSERT INTO Dept VALUES
(1,'HR','New York',200000),
(2,'IT','Chicago',500000),
(3,'Sales','Dallas',300000),
(4,'Marketing','Chicago',250000),
(5,'Finance','New York',400000),
(6,'Operations','Dallas',350000),
(7,'Logistics','Chicago',180000),
(8,'R&D','New York',600000);

-- Create Employees table
-- Purpose: Store employee details
CREATE TABLE EMPLOYEES (
    EMP_ID INT PRIMARY KEY AUTO_INCREMENT,
    EMP_Name VARCHAR(50),
    SALARY INT,
    DEPT_ID INT,
    FOREIGN KEY (DEPT_ID) REFERENCES Dept(Dept_ID)
);

-- Insert employee data
-- Output: Employees added with department references
INSERT INTO EMPLOYEES (EMP_ID, EMP_Name, SALARY, DEPT_ID) VALUES
(1,'Amit',50000,1),
(2,'Priya',60000,2),
(3,'Rahul',55000,2),
(4,'Sneha',70000,3),
(5,'Rohit',48000,NULL),
(6,'Anjali',52000,1),
(7,'Vikram',58000,1),
(8,'Kavya',49000,3),
(9,'Suresh',61000,2),
(13,'Meena',51000,5),
(14,'Karan',75000,2),
(15,'Ritu',46000,NULL),
(16,'Manish',59000,6),
(17,'Asha',54000,7),
(18,'Nikhil',66000,8),
(19,'Divya',58000,3),
(20,'Sanjay',72000,4);

-- Show all employees
-- Output: Full employee table
SELECT * FROM EMPLOYEES;

-- Rename Dept_ID column as ID
-- Output: Dept ID, Name, Budget
SELECT Dept_ID AS ID, Dept_Name, Budget FROM Dept;

-- Departments located in Dallas
SELECT * FROM Dept WHERE Location="Dallas";
-- Departments NOT in Dallas
SELECT * FROM Dept WHERE Location!="Dallas";

-- Budget comparisons
SELECT * FROM Dept WHERE Budget < 300000;
SELECT * FROM Dept WHERE Budget > 300000;
SELECT * FROM Dept WHERE Budget <= 300000;
SELECT * FROM Dept WHERE Budget >= 300000;

-- Budget between range
-- Output: Budget between 2L and 3L
SELECT * FROM Dept WHERE Budget BETWEEN 200000 AND 300000;

-- Select specific departments
SELECT * FROM Dept WHERE Dept_ID IN (1,5,3);

-- Exclude departments
SELECT * FROM Dept WHERE Dept_ID NOT IN (1,5,3);

-- Departments starting with 'S'
SELECT * FROM Dept WHERE Dept_Name LIKE 'S%';

-- Departments NOT containing letter 'a'
SELECT * FROM Dept WHERE Dept_Name NOT LIKE '%a%';

-- Dallas departments with high budget
SELECT * FROM Dept WHERE Location="Dallas" AND Budget > 300000;

-- Dallas OR New York departments
SELECT * FROM Dept WHERE Location="Dallas" OR Location="New York";

-- Exclude Dallas
SELECT * FROM Dept WHERE NOT Location="Dallas";

-- Set budget NULL
UPDATE Dept SET Budget=NULL WHERE Dept_ID IN (4,5);

-- Show non-null budgets
SELECT * FROM Dept WHERE Budget IS NOT NULL;

-- Sort by budget ascending
SELECT * FROM Dept ORDER BY Budget ASC;

-- Top 3 highest budget departments
SELECT * FROM Dept ORDER BY Budget DESC LIMIT 3;

-- Pagination example
SELECT * FROM Dept LIMIT 10,3;

-- Convert location to uppercase
SELECT *, UPPER(Location) AS LocationUPPER FROM Dept;

-- Combine name & location
SELECT CONCAT(Dept_Name,'|',Location) AS Name_Location FROM Dept;

-- Length of department name
SELECT Dept_Name, LENGTH(Dept_Name) AS LEN FROM Dept;

-- Count departments
SELECT COUNT(*) AS COUNT FROM Dept;

-- Total budget
SELECT SUM(Budget) AS TOTAL FROM Dept;

-- Average budget
SELECT AVG(Budget) AS AVG_BUDGET FROM Dept;

-- Min & Max budget
SELECT MIN(Budget) AS MINVALUE, MAX(Budget) AS MAX_VALUE FROM Dept;

-- Budget grouped by location
SELECT Location, SUM(Budget) AS Total FROM Dept GROUP BY Location;

-- Locations having more than 2 departments
SELECT Location, COUNT(*) AS CNT 
FROM Dept 
GROUP BY Location 
HAVING CNT > 2;

-- INNER JOIN
-- Output: Only matching records
SELECT e.emp_name, d.dept_name
FROM EMPLOYEES e
INNER JOIN Dept d ON e.dept_id=d.dept_id;
-- LEFT JOIN
-- Output: All employees (even without dept)
SELECT e.emp_name, d.dept_name
FROM EMPLOYEES e
LEFT JOIN Dept d ON e.dept_id=d.dept_id;
-- RIGHT JOIN
-- Purpose: Display all departments even if no employee is assigned
-- RIGHT JOIN keeps all records from the right table (Dept)
SELECT e.emp_id, e.emp_name, e.salary, d.dept_id, d.dept_name, d.location
FROM EMPLOYEES e 
RIGHT JOIN Dept d
ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

-- UNION example
-- Purpose: Combine employees from two departments
SELECT EMP_Name, Dept_ID 
FROM EMPLOYEES 
WHERE Dept_ID = 1
UNION
SELECT EMP_Name, Dept_ID 
FROM EMPLOYEES 
WHERE Dept_ID = 2;

-- Categorize employee salary
-- Purpose: Create salary classification
SELECT EMP_Name, SALARY, 
CASE
    WHEN SALARY > 100000 THEN 'High'
    WHEN SALARY BETWEEN 50000 AND 100000 THEN 'Medium'
    ELSE 'Low'
END AS SALARY_Category
FROM EMPLOYEES;

-- Create index on employee name
-- Purpose: Speed up search queries on EMP_Name
CREATE INDEX IDX_Employee_Name
ON EMPLOYEES(EMP_Name);

-- Example: Fast search using indexed column
SELECT * FROM EMPLOYEES 
WHERE EMP_NAME = "Priya";

-- Create view for all employees having a department
-- Purpose: Simplify queries by creating a virtual table
CREATE VIEW Employee_List_View AS
SELECT EMP_Name 
FROM EMPLOYEES
WHERE Dept_ID IS NOT NULL;

-- Use the view
SELECT * FROM Employee_List_View;

-- Add manager column to employee table
ALTER TABLE EMPLOYEES 
ADD MANAGER_ID INT,
ADD CONSTRAINT FOREIGN KEY(MANAGER_ID) REFERENCES EMPLOYEES(EMP_ID);

-- Assign managers
UPDATE EMPLOYEES 
SET MANAGER_ID = 1 
WHERE EMP_ID IN (2, 3);

UPDATE EMPLOYEES 
SET MANAGER_ID = 2 
WHERE EMP_ID IN (4, 5);

-- Display employees with their managers
SELECT e1.EMP_Name AS EMPLOYEES, e2.EMP_Name AS MANAGER 
FROM EMPLOYEES e1
LEFT JOIN EMPLOYEES e2 
ON e1.MANAGER_ID = e2.EMP_ID;

-- Count departments per location, filter using HAVING
SELECT Location, COUNT(*) AS Dept_Count
FROM Dept
GROUP BY Location
HAVING COUNT(*) > 2;

-- Second highest salary
SELECT MAX(SALARY) AS SECOND_MAX
FROM EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES);

-- Create view for high salary employees
CREATE VIEW Employees_Salary_View AS
SELECT EMP_Name, SALARY FROM EMPLOYEES
WHERE SALARY > 50000;
-- Use the view
SELECT * FROM Employees_Salary_View;

-- Procedure to fetch employees by department
DELIMITER $$
CREATE PROCEDURE getEmployeeByDept(IN DeptID INT)
BEGIN
SELECT EMP_ID, EMP_Name, SALARY
FROM EMPLOYEES
WHERE Dept_ID=DeptID;
END $$
DELIMITER ;
CALL getEmployeeByDept(1);

-- Prevent negative salary insertion
DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_EMPLOYEES
BEFORE INSERT ON EMPLOYEES
FOR EACH ROW
BEGIN
IF NEW.SALARY < 0 OR NEW.SALARY IS NULL THEN
SET NEW.SALARY=0;
END IF;
END $$
DELIMITER ;

INSERT INTO EMPLOYEES (EMP_ID, EMP_Name, SALARY, DEPT_ID) VALUES
(21, 'Pradeep WS', -50000, 1);
INSERT INTO EMPLOYEES (EMP_ID, EMP_Name, SALARY, DEPT_ID) VALUES
(22, 'Ravi WS', 50000, 1);

-- Display the Employee List
SELECT * FROM EMPLOYEES;

-- Create audit table
-- Purpose: Store logs when an employee is deleted
CREATE TABLE EMPLOYEES_Audit (
    Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
    EMP_ID INT NOT NULL,
    Action_Type ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    Action_Time DATETIME DEFAULT CURRENT_TIMESTAMP,
    Remarks VARCHAR(255)
);

-- Trigger after deleting employee
-- Purpose: Automatically store delete history in audit table
DELIMITER $$
CREATE TRIGGER TRG_EMPLOYEE_DELETE
AFTER DELETE ON EMPLOYEES
FOR EACH ROW
BEGIN
    INSERT INTO EMPLOYEES_Audit
    (EMP_ID, Action_Type, Remarks)
    VALUES
    (OLD.EMP_ID, 'DELETE', 'Employee record deleted');
END $$
DELIMITER ;
-- Delete employee with ID 22
DELETE FROM EMPLOYEES WHERE EMP_ID = 22;
-- View audit logs
SELECT * FROM EMPLOYEES_Audit;

-- Create COLORS table
-- Purpose: Store different color options
CREATE TABLE COLORS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    COLOR_Name VARCHAR(50)
);
-- Insert colors
-- Output: 2 color records inserted
INSERT INTO COLORS (ID, COLOR_Name) VALUES
(1, 'Red'),
(2, 'Blue');

-- Create SIZES table
-- Purpose: Store different size options
CREATE TABLE SIZES (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    SizeName VARCHAR(50)
);
-- Insert sizes
-- Output: 2 size records inserted
INSERT INTO SIZES (ID, SizeName) VALUES
(1, 'XXL'),
(2, 'XL');

-- CROSS JOIN between COLORS and SIZES
-- Purpose: Generate all possible color-size combinations
SELECT c.COLOR_Name, s.SizeName
FROM COLORS c
CROSS JOIN SIZES s;

-- Practice 2 (Basic WHERE, LIKE, ORDER BY)
-- Find departments whose name contains letter 'N'
SELECT * FROM Dept 
WHERE Dept_Name LIKE '%N%';
-- Departments in New York with budget greater than 200000
SELECT * FROM Dept 
WHERE Location = "New York" AND Budget > 200000;
-- Departments located either in New York or Dallas
SELECT * FROM Dept 
WHERE Location IN ("New York", "Dallas");
-- Top 3 departments with highest budget
SELECT * FROM Dept 
ORDER BY Budget DESC 
LIMIT 3;

-- PRACTICE 3 (TRIM, SUBSTRING, MOD, GROUP BY)
-- Remove extra spaces from department names
UPDATE Dept 
SET Dept_Name = TRIM(Dept_Name) 
WHERE Dept_ID IN (1,2,3,4);
-- Display trimmed department names
SELECT TRIM(Dept_Name) AS Dept_Name 
FROM Dept;
-- Display first 4 characters of department name
SELECT TRIM(SUBSTRING(Dept_Name, 1, 4)) AS Dept_Short 
FROM Dept;
-- Find remainder of budget when divided by 100000
SELECT Dept_Name, Budget, MOD(Budget, 100000) AS REMVALUE 
FROM Dept;
-- Maximum budget location-wise
SELECT Location, MAX(Budget) AS MAXDATA 
FROM Dept 
GROUP BY Location;
-- Minimum budget location-wise
SELECT Location, MIN(Budget) AS MINDATA 
FROM Dept 
GROUP BY Location;
-- Locations where max budget is less than 500000
SELECT Location, MAX(Budget) AS MAXDATA 
FROM Dept 
GROUP BY Location 
HAVING MAXDATA < 500000;

-- PRACTICE 4 (JOINS + AGGREGATES)
-- Show employee name and salary (including employees without department)
SELECT e.emp_name, e.salary 
FROM EMPLOYEES e 
LEFT JOIN Dept d
ON e.dept_id = d.dept_id 
ORDER BY emp_id IS NULL;
-- Count employees department-wise
SELECT d.Dept_Name, COUNT(e.EMP_ID) AS Total_Employees
FROM Dept AS d
LEFT JOIN EMPLOYEES AS e
ON d.Dept_ID = e.DEPT_ID
GROUP BY d.Dept_Name;
-- Total salary paid per department
SELECT d.Dept_Name, SUM(e.salary) AS SalarySum
FROM Dept AS d
LEFT JOIN EMPLOYEES AS e
ON d.Dept_ID = e.DEPT_ID
GROUP BY d.Dept_Name;
-- Maximum salary per department
SELECT d.Dept_Name, MAX(e.salary) AS MaxSalary
FROM Dept AS d
LEFT JOIN EMPLOYEES AS e
ON d.Dept_ID = e.DEPT_ID
GROUP BY d.Dept_Name;
-- Departments having 3 or more employees
SELECT d.Dept_Name, COUNT(e.EMP_ID) AS Total_Employees
FROM Dept AS d
LEFT JOIN EMPLOYEES AS e
ON d.Dept_ID = e.DEPT_ID
GROUP BY d.Dept_Name 
HAVING Total_Employees >= 3;

-- PRACTICE 5 (SUBQUERY + SECOND MAX)
-- Find second highest salary
SELECT MAX(SALARY) AS SECOND_MAX 
FROM EMPLOYEES
WHERE SALARY < (
    SELECT MAX(SALARY) FROM EMPLOYEES
);
-- Alternative method using ORDER BY
SELECT SALARY 
FROM EMPLOYEES 
ORDER BY SALARY DESC 
LIMIT 1,1;








































