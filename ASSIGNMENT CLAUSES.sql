create database ProductSales_Clause;
use ProductSales_Clause;

CREATE TABLE Sales (
    Sale_ID INT,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    City VARCHAR(50),
    Salesperson VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2)
);

INSERT INTO Sales
(Sale_ID, Product_Name, Category, City, Salesperson, Quantity, Price)
VALUES
(101, 'Laptop', 'Electronics', 'Pune', 'Amit', 5, 55000),
(102, 'Mouse', 'Electronics', 'Mumbai', 'Neha', 20, 800),
(103, 'Chair', 'Furniture', 'Pune', 'Rahul', 10, 4500),
(104, 'Desk', 'Furniture', 'Mumbai', 'Priya', 8, 9000),
(105, 'Keyboard', 'Electronics', 'Nashik', 'Amit', 15, 1500),
(106, 'Sofa', 'Furniture', 'Pune', 'Neha', 3, 25000),
(107, 'Monitor', 'Electronics', 'Mumbai', 'Rahul', 12, 12000),
(108, 'Table', 'Furniture', 'Nashik', 'Priya', 6, 15000),
(109, 'Headphones', 'Electronics', 'Pune', 'Amit', 25, 3000),
(110, 'Bookshelf', 'Furniture', 'Mumbai', 'Neha', 4, 10000),
(111, 'Mobile', 'Electronics', 'Nashik', 'Rahul', 18, 30000),
(112, 'Bed', 'Furniture', 'Pune', 'Priya', 2, 40000);

/*
==================================================
1. FROM CLAUSE – TASKS
==================================================
*/

-- 1. Display all columns and records from the sales table.
select * from Sales;

-- 2. Display only product_name and price from the sales table.
select Product_Name, Price from Sales;

-- 3. Display product_name, category, and quantity from the sales table.
select Product_Name, Category, Quantity from Sales;

/*
==================================================
2. WHERE CLAUSE – TASKS
==================================================
*/

-- 4. Display all sales made in Pune.
select * from Sales
where City='Pune';

-- 5. Display products whose quantity is greater than 10.
select * from Sales
where Quantity > 10;

-- 6. Display products whose price is less than 10000.
select * from Sales
where Price < 10000;

-- 7. Display Electronics products sold in Mumbai.
select * from Sales
where Category='Electronics' and City='Mumbai';

-- 8. Display sales made by Amit where the quantity is greater than 10.
select * from Sales
where Salesperson='Amit' and Quantity > 10;

/*
==================================================
3. ORDER BY CLAUSE – TASKS
==================================================
*/

-- 9. Display all products sorted by price from lowest to highest.
select * from Sales
order by Price asc;

-- 10. Display all products sorted by quantity from highest to lowest.
select * from Sales
order by Quantity desc;

-- 11. Display products sorted alphabetically by product_name.
select * from Sales
order by Product_Name asc;

-- 12. Sort products by category in ascending order and price
--     in descending order.
select * from Sales
order by Category asc, Price desc;
/*
==================================================
4. GROUP BY CLAUSE – TASKS
==================================================
*/

-- 13. Count the number of sales records in each category.
select Category, count(*) as 'Sales_Count' from Sales
group by Category;

-- 14. Calculate the total quantity sold in each category.
select Category, sum(Quantity) as 'Total_Quantity' from Sales
group by Category;

-- 15. Calculate the average price of products in each category.
select Category, avg(Price) as 'Average_Price' from Sales
group by Category;

-- 16. Find the highest price in each city.
select City, max(Price) as 'Highest_Price' from Sales
group by City;

-- 17. Find the total quantity sold by each salesperson.
select Salesperson, sum(Quantity) as 'Salesperson_Total_Quantity' from Sales
group by Salesperson;
/*
==================================================
5. HAVING CLAUSE – TASKS
==================================================
*/

-- 18. Display categories where the total quantity sold is greater than 40.
select Category, sum(Quantity) as 'Total_Quantity' from Sales
group by Category
having Total_Quantity > 40;

-- 19. Display cities where the average product price is greater than 15000.
select City, avg(Price) as 'City_Average_Price' from Sales
group by City
having City_Average_Price > 15000;

-- 20. Display salespersons who have made more than 2 sales.
select Salesperson, count(*) as 'Total_Sales_Count' from Sales
group by Salesperson
having Total_Sales_Count >= 2;

-- 21. Display categories where the highest product price is greater
--     than 30000.
select Category, max(Price) as 'Highest_Price_Category' from Sales
group by Category
having Highest_Price_Category > 30000;
/*
==================================================
6. LIMIT CLAUSE – TASKS
==================================================
*/

-- 22. Display only the first 5 records from the sales table.
select * from Sales
limit 5;

-- 23. Display the 3 least expensive products.
select * from Sales
order by Price asc
limit 3;

-- 24. Display the 5 products with the highest quantity sold.
select * from Sales
order by Quantity desc
limit 5;

-- 25. Display the 2 cheapest products.
select * from Sales
order by Price asc
limit 2;