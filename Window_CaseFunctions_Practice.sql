create database Window_CaseFunctions_Practice;
use Window_CaseFunctions_Practice;

CREATE TABLE hospital_records (
    record_id INT,
    patient_name VARCHAR(100),
    department VARCHAR(50),
    doctor_name VARCHAR(50),
    city VARCHAR(50),
    treatment_cost DECIMAL(10,2),
    days_admitted INT
);

INSERT INTO hospital_records
(record_id, patient_name, department, doctor_name, city, treatment_cost, days_admitted)
VALUES
(201, 'Riya', 'Cardiology', 'Dr. Mehta', 'Pune', 85000, 5),
(202, 'Aman', 'Orthopedics', 'Dr. Shah', 'Mumbai', 45000, 3),
(203, 'Sneha', 'Neurology', 'Dr. Patil', 'Pune', 120000, 8),
(204, 'Rohit', 'Cardiology', 'Dr. Mehta', 'Mumbai', 95000, 6),
(205, 'Pooja', 'Dermatology', 'Dr. Joshi', 'Nashik', 25000, 2),
(206, 'Karan', 'Orthopedics', 'Dr. Shah', 'Pune', 60000, 4),
(207, 'Neha', 'Neurology', 'Dr. Patil', 'Mumbai', 150000, 10),
(208, 'Vikas', 'Cardiology', 'Dr. Mehta', 'Nashik', 70000, 5),
(209, 'Anjali', 'Dermatology', 'Dr. Joshi', 'Pune', 30000, 3),
(210, 'Sahil', 'Orthopedics', 'Dr. Shah', 'Mumbai', 55000, 4),
(211, 'Meena', 'Neurology', 'Dr. Patil', 'Nashik', 110000, 7),
(212, 'Raj', 'Cardiology', 'Dr. Mehta', 'Pune', 105000, 7);

/*
-----------------------------
A. OFFSET TASKS
-----------------------------
*/
-- 1. Display 3 records after skipping the first 2 records.
select * from hospital_records 
limit 3 offset 2;

-- 2. Display 4 records after skipping the first 5 records.
select * from hospital_records 
limit 4 offset 5;

-- 3. Display the 3 patients with the next highest treatment cost after skipping the top 2 most expensive patients.
select * from hospital_records
order by treatment_cost desc
limit 3 offset 2;

-- 4. Display 3 patients with the next highest number of days admitted after skipping the top 2 patients.
select * from hospital_records
order by days_admitted desc
limit 3 offset 2;

-- 5. Display 2 patients starting from the 5th highest treatment cost.
select * from hospital_records
order by treatment_cost desc
limit 2 offset 2;

-- 6. Display 3 patients starting from the 4th lowest treatment cost.
select * from hospital_records
order by treatment_cost asc
limit 3 offset 4;

-- 7. Display 5 records after skipping the first 4 records, with records arranged by patient name alphabetically.
select * from hospital_records
order by patient_name asc
limit 5 offset 4;

/*
-----------------------------
B. WINDOW FUNCTION - SUM()
-----------------------------
*/
-- 8. Display each patient's treatment cost along with the total treatment cost of all patients.
select *, sum(treatment_cost) over() as Total_Cost 
from hospital_records;

-- 9. Display each patient's treatment cost along with the running total of treatment cost, arranged from lowest to highest cost.
select *, sum(treatment_cost) over(order by treatment_cost asc) as Running_Total
from hospital_records;

-- 10. Display each patient's treatment cost along with the running total of treatment cost, arranged from highest to lowest cost.
select *, sum(treatment_cost) over(order by treatment_cost desc) as Running_Total
from hospital_records;

-- 11. Display each patient's treatment cost along with the total treatment cost of their department.
select *, sum(treatment_cost) over(partition by department) as Department_Total
from hospital_records;

-- 12. Display each patient's treatment cost along with the running total of treatment cost within their department.
select *, sum(treatment_cost) over(partition by department order by treatment_cost asc) as Department_Running_Total
from hospital_records;
/*
-----------------------------
C. WINDOW FUNCTION - AVG()
-----------------------------
*/
-- 13. Display each patient's treatment cost along with the average treatment cost of all patients.
select *, avg(treatment_cost) over() as Avg_Treatment_Cost 
from hospital_records;

-- 14. Display each patient's treatment cost along with the average treatment cost of their department.
select *, avg(treatment_cost) over(partition by Department) as Avg_Treatment_Cost_PerDept
from hospital_records;

-- 15. Display each patient's treatment cost along with the average treatment cost of patients from their city.
select *, avg(treatment_cost) over(partition by City) as Avg_Treatment_Cost_PerCity
from hospital_records;

-- 16. Display each patient's treatment cost along with the running average treatment cost, arranged from lowest to highest treatment cost.
select *, avg(treatment_cost) over(order by treatment_cost) as Avg_Treatment_Cost_asc
from hospital_records;

/*
-----------------------------
D. ROW_NUMBER()
-----------------------------
*/
-- 17. Assign a unique row number to every patient based on treatment cost from highest to lowest.
select *, row_number() over(order by treatment_cost desc) as Row_Num
from hospital_records;

-- 18. Assign a row number to every patient based on days admitted from lowest to highest.
select *, row_number() over(order by days_admitted asc) as Stay_Row_Num
from hospital_records;

-- 19. Assign row numbers to patients separately within each department based on treatment cost from highest to lowest.
select *, row_number() over(partition by Department order by treatment_cost desc) as Dept_Row_Num
from hospital_records;

-- 20. Assign row numbers to patients separately within each city based on treatment cost from highest to lowest.
select *, row_number() over(partition by City order by treatment_cost desc) as City_Row_Num
from hospital_records;
/*
-----------------------------
E. RANK()
-----------------------------
*/
-- 21. Rank all patients based on treatment cost from highest to lowest.
select *, rank() over(order by treatment_cost desc) as Ranking_TreatmentCost
from hospital_records;

-- 22. Rank all patients based on days admitted from highest to lowest.
select *, rank() over(order by days_admitted desc) as Ranking_DaysAdmit
from hospital_records;

-- 23. Rank patients separately within each department based on treatment cost from highest to lowest.
select *, rank() over(partition by Department order by treatment_cost desc) as Ranking_Dept_TreatmentCost
from hospital_records;

-- 24. Rank patients separately within each city based on treatment cost from highest to lowest.
select *, rank() over(partition by City order by treatment_cost desc) as Ranking_City_TreatmentCost
from hospital_records;
/*
-----------------------------
F. DENSE_RANK()
-----------------------------
*/
-- 25. Assign dense rank to all patients based on treatment cost from highest to lowest.
select *, dense_rank() over(order by treatment_cost desc) as DenseRank_TreatmentCost 
from hospital_records;

-- 26. Assign dense rank to all patients based on days admitted from highest to lowest.
select *, dense_rank() over(order by days_admitted desc) as DenseRank_DaysAdmit
from hospital_records;

-- 27. Assign dense rank to patients separately within each department based on treatment cost from highest to lowest.
select *, dense_rank() over(partition by Department order by treatment_cost desc) as DenseRank_DeptTreatmentCost 
from hospital_records;

-- 28. Assign dense rank to patients separately within each city based on treatment cost from highest to lowest.
select *, dense_rank() over(partition by City order by treatment_cost desc) as DenseRank_CityTreatmentCost 
from hospital_records;
/*
-----------------------------
G. WINDOW FUNCTION + PARTITION BY
-----------------------------
*/
-- 29. Display each patient with the total treatment cost of their department.
select *, sum(treatment_cost) over(partition by Department) as Total_DeptTreatmentCost 
from hospital_records;

-- 30. Display each patient with the average treatment cost of their department.
select *, avg(treatment_cost) over(partition by Department) as Avg_DeptTreatmentCost 
from hospital_records;

-- 31. Display each patient with the highest treatment cost rank within their department.
select *, rank() over(partition by Department order by treatment_cost desc) as Rank_DeptTreatmentCost 
from hospital_records;

-- 32. Display each patient with a row number within their department based on treatment cost from highest to lowest.
select *, row_number() over(partition by Department order by treatment_cost desc) as Row_DeptTreatmentCost 
from hospital_records;

-- 33. Display each patient with their department's total number of patients.
select count(*) over(partition by Department) as Count_DeptPatients 
from hospital_records;

-- 34. Display each patient with the total number of patients treated by their doctor.
select count(*) over(partition by doctor_name) as Count_Patient_TreatedByDoctor 
from hospital_records;

/*
-----------------------------
H. WINDOW FUNCTION + ORDER BY
-----------------------------
*/
-- 35. Calculate a running total of treatment cost, ordered from lowest to highest treatment cost.
select *, sum(treatment_cost) over(order by treatment_cost asc) as Total_TreatmentCost_asc
from hospital_records;

-- 36. Calculate a running average of treatment cost, ordered from highest to lowest treatment cost.
select *, avg(treatment_cost) over(order by treatment_cost desc) as Avg_TreatmentCost_desc
from hospital_records;

-- 37. Assign row numbers according to treatment cost from highest to lowest.
select *, row_number() over(order by treatment_cost desc) as Row_TreatmentCost_desc
from hospital_records;

-- 38. Rank patients according to days admitted from highest to lowest.
select *, rank() over(order by days_admitted desc) as Rank_DaysAdmit_desc
from hospital_records;

-- 39. Assign dense rank according to treatment cost from lowest to highest.
select *, dense_rank() over(order by treatment_cost asc) as DenseRank_TreatmentCost_asc
from hospital_records;

/*
==================================================
I. CASE STATEMENT - SIMPLE
==================================================
*/
-- 40. Display patient name and treatment cost. 
--     If treatment cost is greater than 100000, display 'High Cost',
--     otherwise display 'Normal Cost'.
select patient_name, treatment_cost,
	case
		when treatment_cost > 100000 then 'High Cost'
        else 'Normal Cost'
	end as cost_category
from hospital_records;

-- 41. Display patient name and days admitted.
--     If days admitted are more than 5, display 'Long Stay',
--     otherwise display 'Short Stay'.
select patient_name, days_admitted,
	case
		when days_admitted > 5 then 'Long Stay'
        else 'Short Stay'
	end as stay_category
from hospital_records;

-- 42. Display patient name and treatment cost.
--     Classify patients as:
--     - 'High' if cost > 100000
--     - 'Medium' if cost between 50000 and 100000
--     - 'Low' if cost < 50000
select patient_name, treatment_cost,
	case
		when treatment_cost > 100000 then 'High'
        when treatment_cost >= 50000 then 'Medium'
        else 'Low'
	end as treatment_cost_category
from hospital_records;

-- 43. Display patient name and department.
--     If department is 'Cardiology', display 'Heart Department',
--     otherwise display 'Other Department'.
select patient_name, department,
	case
		when department='Cardiology' then 'Heart Department'
        else 'Other Department'
	end as deparment_type
from hospital_records;

-- 44. Display patient name and city.
--     If city is 'Pune', display 'Local Patient',
--     otherwise display 'Outstation Patient'.
select patient_name, city,
	case
		when City='Pune' then 'Local Patient'
        else 'Outstation Patient'
	end as citystay_category
from hospital_records;

-- 45. Display patient name and days admitted.
--     If days admitted >= 7, display 'Critical Stay',
--     otherwise display 'Regular Stay'.
select patient_name, days_admitted,
	case
		when days_admitted >= 7 then 'Critical Stay'
        else 'Regular Stay'
	end as stay_category
from hospital_records;

/*
==================================================
J. CASE STATEMENT - MEDIUM
==================================================
*/
-- 46. Display patient name, treatment cost and a cost category:
--     - Above 100000 → 'Very High'
--     - 50000 to 100000 → 'High'
--     - 30000 to 49999 → 'Medium'
--     - Below 30000 → 'Low'
select patient_name, treatment_cost,
	case
		when treatment_cost > 100000 then 'Very High'
        when treatment_cost >= 50000 then 'High'
        when treatment_cost >= 30000 then 'Medium'
        else 'Low'
	end as cost_category
from hospital_records;

-- 47. Display patient name, days admitted and a stay category:
--     - 8 or more days → 'Very Long Stay'
--     - 5 to 7 days → 'Long Stay'
--     - 3 to 4 days → 'Medium Stay'
--     - Less than 3 days → 'Short Stay'
select patient_name, days_admitted,
	case
		when days_admitted >= 8 then 'Very Long Stay'
        when days_admitted >= 5 then 'Long Stay'
        when days_admitted >= 3 then 'Medium Stay'
        else 'Short Stay'
	end as stay_category
from hospital_records;

-- 48. Display patient name, department and department type:
--     - Cardiology → 'Specialized'
--     - Neurology → 'Specialized'
--     - Orthopedics → 'Specialized'
--     - Dermatology → 'General'
select patient_name, department,
	case
		when department in ('Cardiology', 'Neurology', 'Orthopedics') then 'Specialized'
        else 'General'
	end as department_type
from hospital_records;

-- 49. Display patient name, treatment cost and create a payment category:
--     - Cost >= 100000 → 'Premium'
--     - Cost >= 60000 → 'High'
--     - Cost >= 30000 → 'Medium'
--     - Otherwise → 'Basic'
select patient_name, treatment_cost,
	case
		when treatment_cost >= 100000 then 'Premium'
        when treatment_cost >= 60000 then 'High'
        when treatment_cost >= 30000 then 'Medium'
        else 'Basic'
	end as payment_category
from hospital_records;

-- 50. Display patient name, treatment cost and days admitted.
--     Create a risk category:
--     - Cost > 100000 AND days admitted >= 7 → 'High Risk'
--     - Cost > 60000 OR days admitted >= 5 → 'Medium Risk'
--     - Otherwise → 'Low Risk'
select patient_name, treatment_cost, days_admitted,
	case
		when treatment_cost > 100000 and days_admitted >= 7 then 'High Risk'
        when treatment_cost > 60000 or days_admitted >= 5 then 'Medium Risk'
        else 'Low Risk'
	end as risk_category
from hospital_records;

/*
==================================================
K. CASE + WINDOW FUNCTIONS
==================================================
*/
-- 51. Display patient name, treatment cost and treatment cost category using CASE.
--     Also assign a rank based on treatment cost from highest to lowest.
select patient_name, treatment_cost,
    case
        when treatment_cost > 100000 then 'High'
        when treatment_cost >= 50000 then 'Medium'
        else 'Low'
    end as treatment_cost_category,
    rank() over(order by treatment_cost desc) as treatment_cost_rank
from hospital_records;

-- 52. Display patient name, department and treatment cost.
--     Also display the average treatment cost of that department using
--     AVG() with PARTITION BY.
select patient_name, department, treatment_cost, avg(treatment_cost) over(partition by department) as avg_department_cost
from hospital_records;

-- 53. Display patient name, department and treatment cost.
--     Assign a row number to each patient within their department based on
--     treatment cost from highest to lowest.
select patient_name, department, treatment_cost, row_number() over(partition by department order by treatment_cost desc) as department_row_num
from hospital_records;

-- 54. Display patient name, treatment cost and a cost category.
--     Also display the RANK() of the patient based on treatment cost.
select patient_name, treatment_cost,
    case
        when treatment_cost > 100000 then 'High'
        when treatment_cost >= 50000 then 'Medium'
        else 'Low'
    end as treatment_cost_category,
    rank() over(order by treatment_cost desc) as treatment_cost_rank
from hospital_records;

-- 55. Display patient name, department, treatment cost and the total
--     treatment cost of their department.
--     Also classify the patient's treatment cost as:
--     'High' if above 100000, otherwise 'Normal'.
select patient_name, department, treatment_cost, sum(treatment_cost) over(partition by department) as department_total_cost,
    case
        when treatment_cost > 100000 then 'High'
        else 'Normal'
    end as cost_category
from hospital_records;

/* =============================================================================================================================================================== */

/*
IN , IS NOT NULL , NULL operator task
*/
create database company_db_practice;
use company_db_practice;

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary INT,
    bonus INT,
    manager_name VARCHAR(50)
);

INSERT INTO employees
(emp_id, emp_name, department, city, salary, bonus, manager_name)
VALUES
(101, 'Amit', 'IT', 'Pune', 55000, 5000, 'Rajesh'),
(102, 'Neha', 'HR', 'Mumbai', 45000, NULL, 'Priya'),
(103, 'Rahul', 'Finance', 'Pune', 60000, 7000, 'Suresh'),
(104, 'Sneha', 'IT', 'Nashik', 50000, NULL, 'Rajesh'),
(105, 'Karan', 'Marketing', 'Mumbai', 42000, 4000, NULL),
(106, 'Pooja', 'Finance', 'Pune', 75000, 8000, 'Suresh'),
(107, 'Rohit', 'IT', 'Mumbai', 65000, 6000, NULL),
(108, 'Anjali', 'HR', 'Nashik', 48000, NULL, 'Priya'),
(109, 'Vikas', 'Marketing', 'Pune', 52000, 3000, 'Meena'),
(110, 'Meena', 'Finance', 'Mumbai', 70000, 7500, 'Suresh');

/*
==================================================
TASKS
==================================================
*/
-- 1. Display employees who work in either the IT, HR, or Finance
--    department using the IN operator.
select * from employees
where department in ('IT', 'HR', 'Finance');

-- 2. Display employees who are from Pune or Mumbai using IN.
select * from employees
where city in ('Pune', 'Mumbai');

-- 3. Display employees whose salary is greater than 50000.
select * from employees
where salary > 50000;

-- 4. Display employees whose salary is between 45000 and 65000.
select * from employees
where salary between 45000 and 65000;

-- 5. Display employees whose bonus is NULL.
select * from employees
where bonus is null;

-- 6. Display employees who have received a bonus
--    (bonus is NOT NULL).
select * from employees
where bonus is not null;

-- 7. Display employees who do not have a manager assigned
--    (manager_name is NULL).
select * from employees
where manager_name is null;

-- 8. Display employees whose department is IT or Finance
--    AND whose salary is greater than 50000.
select * from employees
where department in ('IT', 'Finance') and salary > 50000;

-- 9. Display employees whose city is Pune or Mumbai
--    AND whose bonus is NOT NULL.
select * from employees
where city in ('Pune', 'Mumbai') and bonus is not null;

-- 10. Display employees whose department is NOT HR
--     and whose salary is greater than or equal to 50000.
select * from employees
where department <> 'HR' and salary >= 50000;