/* MySQL Clauses
A clause is a predefined part of an SQL statement that specifies 
a particular condition, operation, or instruction for how the 
database should process the query

Uses: Clauses are used to retrieve, filter, sort, group, and restrict data according to the requirement of the query

6 MAIN CLAUSES --> 
1) FROM 
2) WHERE 
3) ORDER BY 
4) GROUP BY 
5) HAVING 
6) LIMIT
*/

create database Inventory_Clauses;
use Inventory_Clauses;

create table Sales (
	Sales_ID int,
    Product_Name varchar(50),
    Category varchar(30),
    SalesPerson varchar(50),
	City VARCHAR(30),
    Quantity INT,
    Price DECIMAL(10,2)
);

INSERT INTO sales
(Sales_ID, Product_Name, Category, SalesPerson, City, Quantity, Price)
VALUES
(1, 'Laptop', 'Electronics', 'Amit', 'Pune', 5, 55000),
(2, 'Mouse', 'Electronics', 'Priya', 'Mumbai', 20, 800),
(3, 'Keyboard', 'Electronics', 'Amit', 'Pune', 10, 1500),
(4, 'Chair', 'Furniture', 'Sneha', 'Mumbai', 8, 4500),
(5, 'Table', 'Furniture', 'Rahul', 'Pune', 5, 7000),
(6, 'Pen', 'Stationery', 'Priya', 'Nashik', 50, 20),
(7, 'Notebook', 'Stationery', 'Sneha', 'Pune', 30, 80),
(8, 'Monitor', 'Electronics', 'Rahul', 'Mumbai', 7, 12000),
(9, 'Desk', 'Furniture', 'Amit', 'Pune', 4, 9000),
(10, 'Printer', 'Electronics', 'Priya', 'Nashik', 3, 15000);

/*
--------------------------------------------------------
1) FROM CLAUSE
Specifies the table from which data is retrieved
--------------------------------------------------------
*/

-- 1. Retrive all cols and rows from the sales table
select * from Sales;

-- 2. Retrieve only product_name and quantity from the sales table
select Product_Name, Quantity from Sales;

-- 3. Retrieve product_name and price of product from the furniture category
select Product_Name, Price
from Sales
where Category='Furniture';

/*
--------------------------------------------------------
2) WHERE CLAUSE
Filters individual rows based on a specified condition
--------------------------------------------------------
*/
-- 1. Display all sales made in Pune
select * from Sales
where City='Pune';

-- 2. Display products where quantity sold in greater than 10
select * from Sales
where Quantity > 10;

-- 3. Display electronics product where quantity is 5 or more
select * from Sales
where Category='Electronics' and Quantity >= 5;

/*
--------------------------------------------------------
3) ORDER BY CLAUSE
Sorts the result in ascending(asc) and descending(desc) order
--------------------------------------------------------
*/
-- 1. Display all products sorted by price from lowest to highest
select * from Sales
order by Price asc;

-- 2. Display all products sorted by quantity from highest to lowest
select * from Sales
order by Quantity desc;

-- 3. Display all products sorted by category alphabetically and within each category, sort the price from highest to lowest
select * from Sales
order by Category asc, Price desc;

/*
--------------------------------------------------------
4) GROUP BY CLAUSE
Groups rows with the same values in specified cols

GROUP BY is commonly used with:
SUM()
COUNT()
AVG()
MAX()
MIN()
--------------------------------------------------------
*/
-- 1. Count the number of sales records in each category
select Category, count(*) as 'Sales_Count' from Sales
group by Category;

-- 2. Calculate the total quantity sold for each category
select Category, sum(Quantity) as 'Total_Quantity' from Sales
group by Category;

-- 3. Calculate the average product price for each category
select Category, avg(Price) as 'Average_Price' from Sales
group by Category;

/*
--------------------------------------------------------
5) HAVING CLAUSE
Filters the groups created by group by function

Important:
WHERE filters individual rows, while HAVING filters group
--------------------------------------------------------
*/
-- 1. Display only categories whose total quantity sold is greater than 30
select Category, sum(Quantity) as 'Total_Quantity' from Sales
group by Category
having Total_Quantity > 30;

-- 2. Display salesperson who have made atleast 2 sales
select Salesperson, count(*) as 'Total_Sales_Count' from Sales
group by Salesperson
having Total_Sales_Count >= 2;

-- 3. Display cities where the avg product price is greater than 5000
select City, avg(Price) as 'City_Average_Price' from Sales
group by City
having City_Average_Price > 5000;

/*
--------------------------------------------------------
6) LIMIT CLAUSE
Restricts the number of rows returned by a query
--------------------------------------------------------
*/
-- 1. Display only the first 5 rows from the sales table
select * from Sales
limit 5;

-- 2. Display the 3 most expensive products
select * from Sales
order by Price desc
limit 3;

-- 3. Display the 5 products with the highest quantity sold
select * from Sales
order by Quantity desc
limit 5;

/* ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/*
--------------------------------------------------------
AGGREGATE FUNCTIONS
--------------------------------------------------------
*/
-- Display total quantity
select sum(Quantity) as 'Total_Quantity' from Sales;

-- Similarly perform with avg quantity, count of sales, max price and min price
select avg(Quantity) as 'Average_Quantity' from Sales;

select count(Sales_ID) as 'Sales_Count' from Sales;

select max(Price) as 'Maximum_Price' from Sales;

select min(Price) as 'Minimum_Price' from Sales;
