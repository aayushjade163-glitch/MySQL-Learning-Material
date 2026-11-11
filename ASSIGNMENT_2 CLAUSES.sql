create database Employee_Clauses;
use Employee_Clauses;

create table Employee_Projects(
	Project_ID int,
	Employee_Name varchar(50),
	Department varchar(50),
	City varchar(50),
	Project_Name varchar(100),
	Hours_Worked int,
	Project_Cost decimal(10, 2)
);

INSERT INTO Employee_Projects (Project_ID, Employee_Name, Department, City, Project_Name, Hours_Worked, Project_Cost)
VALUES
(101, 'Amit', 'IT', 'Pune', 'Website Development', 40, 75000),
(102, 'Neha', 'HR', 'Mumbai', 'Recruitment System', 25, 45000),
(103, 'Rahul', 'Finance', 'Pune', 'Budget Analysis', 35, 60000),
(104, 'Priya', 'IT', 'Mumbai', 'Mobile Application', 50, 120000),
(105, 'Amit', 'IT', 'Pune', 'Database Migration', 30, 55000),
(106, 'Sneha', 'HR', 'Pune', 'Employee Training', 20, 35000),
(107, 'Rahul', 'Finance', 'Mumbai', 'Tax Management', 45, 85000),
(108, 'Priya', 'IT', 'Mumbai', 'Cloud Migration', 40, 95000),
(109, 'Kiran', 'Marketing', 'Pune', 'Marketing Campaign', 30, 50000),
(110, 'Amit', 'IT', 'Mumbai', 'Security Upgrade', 25, 65000),
(111, 'Neha', 'HR', 'Mumbai', 'Performance Review', 30, 40000),
(112, 'Rahul', 'Finance', 'Pune', 'Financial Report', 25, 55000),
(113, 'Sneha', 'HR', 'Pune', 'Policy Update', 35, 30000),
(114, 'Kiran', 'Marketing', 'Mumbai', 'Product Promotion', 40, 70000),
(115, 'Amit', 'IT', 'Pune', 'API Development', 45, 90000),
(116, 'Priya', 'IT', 'Mumbai', 'Data Analytics', 30, 80000),
(117, 'Neha', 'HR', 'Pune', 'Hiring Process', 20, 50000),
(118, 'Kiran', 'Marketing', 'Pune', 'Customer Survey', 25, 45000),
(119, 'Rahul', 'Finance', 'Mumbai', 'Audit Project', 50, 100000),
(120, 'Sneha', 'HR', 'Mumbai', 'Employee Engagement', 30, 55000);


-- 1. Display the total hours worked by each department, considering
--    only projects where hours_worked is greater than 20.
select Department, sum(Hours_Worked) as 'Total_Hours' 
from Employee_Projects
where Hours_Worked > 20
group by Department;

-- 2. Display the average project cost for each department, considering
--    only projects with a cost greater than 50000.
select Department, avg(Project_Cost) as 'Avg_Project_Cost'
from Employee_Projects
where Project_Cost > 50000
group by Department;

-- 3. Display departments whose total hours worked is greater than 100,
--    sorted from highest to lowest total hours.
select Department, sum(Hours_Worked)as 'Total_Hours'
from Employee_Projects
group by Department
having SUM(Hours_Worked) > 100
order by Total_Hours desc;

-- 4. Display cities where the average project cost is greater than
--    75000, sorted from highest to lowest average cost.
select City, avg(Project_Cost) as 'Avg_Project_Cost'
from Employee_Projects
group by City
having Avg_Project_Cost > 75000
order by Avg_Project_Cost desc;

-- 5. Display employees who have worked on at least 3 projects, sorted
--    by the number of projects from highest to lowest.
select Employee_Name, count(Project_ID) as 'Total_Project_Count' 
from Employee_Projects
group by Employee_Name
having Total_Project_Count >= 3
order by Total_Project_Count desc;

-- 6. Display the total hours worked by each employee for projects
--    whose cost is greater than 50000.
select Employee_Name, sum(Hours_Worked) as 'Total_Hours_Worked'
from Employee_Projects
where Project_Cost > 50000
group by Employee_Name;

-- 7. Display the top 3 departments based on total hours worked.
select Department, sum(Hours_Worked) as 'Total_Hours_Worked'
from Employee_Projects
group by Department
order by Total_Hours_Worked desc
limit 3;

-- 8. Display the top 2 cities based on total project cost.
select City, sum(Project_Cost) as 'Total_Project_Cost'
from Employee_Projects
group by City
order by Total_Project_Cost desc
limit 2;

-- 9. Display the total hours worked by each department in Pune,
--    and sort the departments by total hours in descending order.
select Department, sum(Hours_Worked) as 'Total_Hours_Worked'
from Employee_Projects
where City='Pune'
group by Department
order by Total_Hours_Worked desc;

-- 10. Display the average project cost for each department in Mumbai,
--     considering only projects where hours_worked is greater than 20.
select Department, avg(Project_Cost) as 'Avg_Project_Cost'
from Employee_Projects
where City='Mumbai' and Hours_Worked > 20
group by Department;

-- 11. Display employees whose total hours worked is greater than 50,
--     sorted from highest to lowest total hours worked.
select Employee_Name, sum(Hours_Worked) as 'Total_Hours_Worked'
from Employee_Projects
group by Employee_Name
having Total_Hours_Worked > 50
order by Total_Hours_Worked desc;

-- 12. Display departments where the average project cost is greater
--     than 60000, sorted by average cost in descending order.
select Department, avg(Project_Cost) as 'Avg_Project_Cost'
from Employee_Projects
group by Department
having Avg_Project_Cost > 60000
order by Avg_Project_Cost desc;

-- 13. Display the top 3 employees based on total hours worked,
--     considering only projects where hours_worked is greater than 15.
select Employee_Name, sum(Hours_Worked) as 'Total_Hours_Worked'
from Employee_Projects
where Hours_Worked > 15
group by Employee_Name
order by Total_Hours_Worked desc
limit 3;

-- 14. Display the total project cost in each city for IT department
--     projects, sorted from highest to lowest total project cost.
select City, sum(Project_Cost) as 'Total_Project_Cost'
from Employee_Projects
where Department='IT'
group by City
order by Total_Project_Cost desc;

-- 15. Display the average project cost for each city where the total
--     hours worked is greater than 50.
select City, avg(Project_Cost) as 'Avg_Project_Cost'
from Employee_Projects
group by City
having sum(Hours_Worked) > 50;

-- 16. Display departments having more than 2 project records, sorted
--     by the number of projects from highest to lowest.
select Department, count(Project_ID) as 'Project_Count'
from Employee_Projects
group by Department
having Project_Count > 2
order by Project_Count desc;

-- 17. Display the top 2 departments having the highest average project
--     cost, considering only projects where hours_worked is greater than 10.
select Department, avg(Project_Cost) as 'Avg_Project_Cost'
from Employee_Projects
where Hours_Worked > 10
group by Department
order by Avg_Project_Cost desc
limit 2;

-- 18. Display employees whose average project cost is greater than
--     50000, sorted from highest to lowest average project cost.
select Employee_Name, avg(Project_Cost) as 'Avg_Project_Cost'
from Employee_Projects
group by Employee_Name
having Avg_Project_Cost > 50000
order by Avg_Project_Cost desc;

-- 19. Display the total hours worked by each employee in Pune,
--     considering only projects whose cost is greater than 30000.
select Employee_Name, sum(Hours_Worked) as 'Total_Hours_Worked'
from Employee_Projects
where City='Pune' and Project_Cost > 30000
group by Employee_Name;

-- 20. Display the top 3 cities having the highest average project cost,
--     considering only projects from the Development department.
select City, avg(Project_Cost) as 'Avg_Project_Cost'
from Employee_Projects
where Department='IT'
group by City
order by Avg_Project_Cost desc
limit 3;

-- 21. Display departments where the total hours worked is between
--     100 and 300, sorted by total hours in descending order.
select Department, sum(Hours_Worked) as 'Total_Hours_Worked'
from Employee_Projects
group by Department
having sum(Hours_Worked) between 100 and 300
order by Total_Hours_Worked desc;

-- 22. Display employees who have worked on more than 2 projects and
--     whose total hours worked is greater than 60.
select Employee_Name, count(Project_ID) as 'Project_Count', sum(Hours_Worked) as 'Total_Hours_Worked'
from Employee_Projects
group by Employee_Name
having count(Project_ID) > 2 and sum(Hours_Worked) > 60;

-- 23. Display the top 3 employees based on total hours worked.
--     Consider only projects whose project_cost is greater than 40000.
select Employee_Name, sum(Hours_Worked) as 'Total_Hours_Worked'
from Employee_Projects
where Project_Cost > 40000
group by Employee_Name
order by Total_Hours_Worked desc
limit 3;

-- 24. Display each department's total hours worked and average project
--     cost, considering only projects from Pune, and show only departments
--     whose average project cost is greater than 40000.
select Department, sum(Hours_Worked) as 'Total_Hours_Worked', avg(Project_Cost) as 'Avg_Project_Cost'
from Employee_Projects
where City='Pune'
group by Department
having Avg_Project_Cost > 40000;

-- 25. Display the top 2 cities based on total project cost,
--     considering only projects from the HR department.
select City, sum(Project_Cost) as 'Total_Project_Cost'
from Employee_Projects
where Department='HR'
group by City
order by Total_Project_Cost desc
limit 2;

-- 26. Display employees who have worked on at least 2 projects in Mumbai,
--     sorted by their total hours worked in descending order.
select Employee_Name, count(Project_ID) as 'Project_Count', sum(Hours_Worked) as 'Total_Hours_Worked'
from Employee_Projects
where City='Mumbai'
group by Employee_Name
having Project_Count >= 2
order by Total_Hours_Worked desc;

-- 27. Display departments having more than 2 projects, sorted
--     alphabetically by department.
select Department, count(Project_ID) as 'Project_Count'
from Employee_Projects
group by Department
having Project_Count > 2
order by Department asc;

-- 28. Display the city-wise total hours worked for projects whose
--     project_cost is between 30000 and 100000, showing only cities
--     whose total hours worked is greater than 50.
select City, sum(Hours_Worked) as 'Total_Hours_Worked'
from Employee_Projects
where Project_Cost
between 30000 and 100000
group by City
having Total_Hours_Worked > 50;

-- 29. Display the top 3 departments based on total project cost,
--     where total project cost is calculated using SUM(project_cost).
select Department, sum(Project_Cost) as 'Total_Project_Cost'
from Employee_Projects
group by Department
order by Total_Project_Cost desc
limit 3;

-- 30. Display the top 2 employees based on total project cost,
--     considering only projects where hours_worked is greater than 20.
select Employee_Name, sum(Project_Cost) as 'Total_Project_Cost'
from Employee_Projects
where Hours_Worked > 20
group by Employee_Name
order by Total_Project_Cost desc
limit 2;