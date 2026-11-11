create database OperatorAssignment;
use OperatorAssignment;

create table Employees (
	Emp_ID INT,
    Emp_Name VARCHAR(50),
    Department VARCHAR(30),
    City VARCHAR(30),
    Experience INT,
    Salary DECIMAL(10,2)
);

INSERT INTO Employees
(Emp_ID, Emp_Name, Department, City, Experience, Salary)
VALUES
(101, 'Amit', 'IT', 'Pune', 3, 45000),
(102, 'Neha', 'HR', 'Mumbai', 5, 55000),
(103, 'Rahul', 'Finance', 'Pune', 2, 38000),
(104, 'Priya', 'IT', 'Nashik', 7, 75000),
(105, 'Sneha', 'Sales', 'Mumbai', 4, 50000),
(106, 'Kiran', 'Marketing', 'Pune', 6, 65000),
(107, 'Rohit', 'Finance', 'Delhi', 8, 85000),
(108, 'Pooja', 'HR', 'Pune', 1, 32000),
(109, 'Akash', 'Sales', 'Nashik', 5, 58000),
(110, 'Meena', 'IT', 'Mumbai', 10, 95000);

select * from Employees;

/*
==================================================
1. ARITHMETIC OPERATORS
==================================================
*/
-- 1. Display employee names and their salary after adding
--    5000 to their current salary.
select Emp_Name, Salary, Salary + 5000
as 'Promoted Salary'
from Employees;

-- 2. Display employee names and their salary after deducting
--    2000 from their current salary.
select Emp_Name, Salary, Salary - 2000
as 'Deducted Salary'
from Employees;

-- 3. Display employee names and their salary after a
--    10% salary increase.
select Emp_Name, Salary, Salary * 1.10
as '10% Salary Spike'
from Employees;

-- 4. Display employee names and calculate their monthly salary
--    by dividing their annual salary by 12.
select Emp_Name, Salary, Salary / 12
as 'Monthly Salary'
from Employees;

-- 5. Display employee names and calculate the remainder when
--    their experience is divided by 2.
select Emp_Name, Experience, Experience % 2
as 'Experience Remainder'
from Employees;

-- 6. Display employee names and calculate their salary after
--    multiplying it by 2.
select Emp_Name, Salary, Salary * 2
as 'Salary Double'
from Employees;

/*
==================================================
2. COMPARISON OPERATORS
==================================================

Operators:

=       Equal to
!=      Not equal to
<>      Not equal to
>       Greater than
<       Less than
>=      Greater than or equal to
<=      Less than or equal to
*/

-- 7. Display employees whose salary is exactly 50000.
select * from Employees 
where Salary = 50000;

-- 8. Display employees whose experience is not equal to 5
--    using !=.
select * from Employees
where Experience != 5;

-- 9. Display employees whose experience is not equal to 5
--    using <>.
select * from Employees
where Experience <> 5;

-- 10. Display employees whose salary is greater than 60000.
select * from Employees
where Salary > 60000;

-- 11. Display employees whose experience is less than 3.
select * from Employees
where Experience < 3;

-- 12. Display employees whose salary is greater than or
--     equal to 75000.
select * from Employees
where Salary >= 75000;

-- 13. Display employees whose experience is less than
--     or equal to 5.
select * from Employees
where Experience <= 5;

/*    
==================================================
3. BETWEEN OPERATOR
==================================================
*/

-- 14. Display employees whose salary is between 40000 and 70000.
select * from Employees
where Salary
between 40000 and 70000;

-- 15. Display employees whose experience is between 3 and 7.
select * from Employees
where Experience
between 3 and 7;

-- 16. Display employees whose salary is between 50000 and 90000.
select * from Employees
where Salary
between 50000 and 90000;

/*
==================================================
4. LIKE OPERATOR
==================================================
*/

-- 17. Display employees whose name starts with 'A'.
select * from Employees
where Emp_Name like 'A%';

-- 18. Display employees whose name starts with 'P'.
select * from Employees
where Emp_Name like 'P%';

-- 19. Display employees whose name ends with 'a'.
select * from Employees
where Emp_Name like '%a';

-- 20. Display employees whose name contains 'ee'.
select * from Employees
where Emp_Name like '%ee%';

-- 21. Display employees whose name has exactly 4 characters.
select * from Employees
where Emp_Name like '____';

-- 22. Display employees whose name has 'o' as the second character.
select * from Employees
where Emp_Name like '_o%';

-- 23. Display employees whose department starts with 'F'.
select * from Employees
where Department like 'F%';

/*
==================================================
5. LOGICAL OPERATORS
==================================================

Operators:

AND
OR
NOT
*/

-- 24. Display employees whose salary is greater than 50000
--     AND experience is greater than 5.
select * from Employees
where Salary > 50000 AND
Experience > 5;

-- 25. Display employees whose department is IT
--     OR department is Finance.
select * from Employees
where Department = 'IT' or
Department = 'Finance';

-- 26. Display employees whose salary is less than 40000
--     OR experience is greater than 8.
select * from Employees
where Salary < 40000 or
Experience > 8;

-- 27. Display employees who are NOT from Pune.
select * from Employees
where not City='Pune';

-- 28. Display employees whose experience is greater than 3
--     AND salary is less than 70000.
select * from Employees
where Experience > 3 AND
Salary < 70000;

-- 29. Display employees whose department is HR
--     OR city is Mumbai.
select * from Employees
where Department = 'HR' or
City='Mumbai';

/*
==================================================
6. ASSIGNMENT OPERATOR (=)
==================================================
*/
-- 30. Change Amit's salary to 50000.
update Employees
set Salary=50000
where Emp_Name='Amit';
select * from Employees;

-- 31. Change Neha's city to Pune.
update Employees
set City='Pune'
where Emp_Name='Neha';
select * from Employees;

-- 32. Increase Rahul's salary by 5000.
update Employees
set Salary=Salary + 5000
where Emp_Name='Rahul';
select * from Employees;

-- 33. Increase Priya's salary by 10%.
update Employees
set Salary=Salary * 1.10
where Emp_Name='Priya';
select * from Employees;

-- 34. Decrease Sneha's salary by 2000.
update Employees
set Salary=Salary - 2000
where Emp_Name='Sneha';
select * from Employees;

-- 35. Change Kiran's experience to 7.
update Employees
set Experience=7
where Emp_Name='Kiran';
select * from Employees;

/*
==================================================
7. MIXED OPERATOR TASKS
==================================================
*/
-- 36. Display employees whose salary is between 40000 and 80000
--     AND department is IT.
select * from Employees
where Salary 
between 40000 and 80000 and
Department='IT';

-- 37. Display employees whose name starts with 'P'
--     OR salary is greater than 80000.
select * from Employees
where Emp_Name like 'P%' or
Salary > 80000;

-- 38. Display employees whose experience is NOT between 3 and 7.
select * from Employees
where Experience not
between 3 and 7;

-- 39. Display employees whose department is Finance
--     AND salary is greater than 40000.
select * from Employees
where Department='Finance' and
Salary > 40000;

-- 40. Display employees whose city is Pune
--     OR experience is greater than 8.
select * from Employees
where City='Pune' or
Experience > 8;

