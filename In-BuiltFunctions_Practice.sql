create database Product_Store_InBuiltFunc;
use Product_Store_InBuiltFunc;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    discount DECIMAL(5,2),
    quantity INT,
    manufacture_date DATE
);


INSERT INTO products VALUES
(101, '  Laptop Pro  ', 'Electronics', 65499.75, 10, 25, '2025-01-15'),
(102, 'Wireless Mouse', 'Electronics', 899.50, 5, 100, '2024-08-20'),
(103, 'Office Chair', 'Furniture', 7500.25, 15, 30, '2023-12-10'),
(104, 'Study Table', 'Furniture', 12000.80, 10, 20, '2024-06-05'),
(105, 'Python Book', 'Books', 650.60, 20, 75, '2025-03-18'),
(106, 'SQL Guide', 'Books', 499.99, 5, 50, '2024-11-12');

/*
==================================================
STRING FUNCTIONS - TASKS
==================================================
*/
-- 1. Display all product names in uppercase.
select product_name, upper(product_name) from products;
-- 2. Display all product categories in lowercase.
select category, lower(category) from products;
-- 3. Find the length of each product name.
select product_name, length(product_name) from products;
-- 4. Combine product name and category into a single column.
select product_name, category, concat(product_name, category) from products;
-- 5. Display the first 4 characters of each product name.
select product_name, substring(product_name, 1, 4) from products;
-- 6. Remove extra spaces from product names.
select product_name, trim(product_name) from products;
-- 7. Replace the word 'Book' with 'Guide' in product names.
select product_name, replace(product_name, 'Book', 'Guide') from products;
-- 8. Display product names in uppercase after removing extra spaces.
select product_name, upper(trim(product_name)) from products;
-- 9. Extract the last 3 characters of each product name.
select product_name, right(product_name, 3) from products;
-- 10. Display product name and category separated by a hyphen.
select product_name, category, concat(product_name, '-', category) from products;
/*
==================================================
MATH FUNCTIONS - TASKS
==================================================
*/
-- 11. Round the price of each product to the nearest integer.
select price, round(price) as Roundup_Price from products;
-- 12. Round the price to 1 decimal place.
select price, round(price, 1) as Roundup_Price_1DecimalPlace from products;
-- 13. Display the price rounded upward.
select price, ceil(price) as Ceiling_price from products;
-- 14. Display the price rounded downward.
select price, floor(price) as Flooring_Price from products;
-- 15. Find the absolute difference between price and discount.
select price, discount, abs(Price - Discount) from products;
-- 16. Find the remainder when quantity is divided by 10.
select quantity, mod(quantity,10) from products;
-- 17. Calculate the square of the quantity.
select quantity, power(quantity, 2) from products;
-- 18. Find the square root of the quantity.
select quantity, sqrt(quantity) from products;
-- 19. Calculate the price raised to the power of 2.
select price, pow(price, 2) from products;
-- 20. Find the rounded average price of all products.
select round(avg(price)) from products;
/*
==================================================
DATE FUNCTIONS - TASKS
==================================================
*/

-- 21. Display the current date and time.
select now();
-- 22. Display only the current date.
select curdate();
-- 23. Display only the current time.
select curtime();
-- 24. Extract the year from the manufacture date.
select manufacture_date, year(manufacture_date) from products;
-- 25. Extract the month from the manufacture date.
select manufacture_date, month(manufacture_date) from products;
-- 26. Extract the day from the manufacture date.
select manufacture_date, day(manufacture_date) from products;
-- 27. Find the number of days between the manufacture date and today.
select manufacture_date, datediff(curdate(), manufacture_date) from products;
-- 28. Add 30 days to the manufacture date.
select manufacture_date, date_add(manufacture_date, interval 30 day) from products;
-- 29. Add 1 year to the manufacture date.
select manufacture_date, date_add(manufacture_date, interval 1 year) from products;
-- 30. Subtract 2 months from the manufacture date.
select manufacture_date, date_sub(manufacture_date, interval 2 month) from products;
-- 31. Display products manufactured more than 1 year ago.
select * from products
where manufacture_date < date_sub(curdate(), interval 1 year);

/*
==================================================
AGGREGATE FUNCTIONS - TASKS
==================================================
*/

-- 32. Find the total price of all products.
select sum(price) as Total_Prices from products;
-- 33. Find the average price of all products.
select avg(price) as Avg_Prices from products;
-- 34. Find the highest product price.
select max(price) as Highest_Product_Price from products;
-- 35. Find the lowest product price.
select min(price) as Lowest_Product_Price from products;
-- 36. Count the total number of products.
select count(product_id) as Product_TotalCount from products;
-- 37. Find the total quantity of all products.
select sum(quantity) from products;
-- 38. Find the total number of products in each category.
SELECT category, count(*) AS Product_Count
FROM products
GROUP BY category;
-- 39. Find the average price category-wise.
select category, avg(price) as Avg_Price
from products
group by category;
-- 40. Find the highest price in each category.
select category, max(price) as Highest_Product_Price
from products
group by category;

/*
==================================================
MIXED PRACTICE TASKS
==================================================
*/
-- 41. Display product names in uppercase along with their manufacture year.
select product_name, upper(product_name), manufacture_date, year(manufacture_date) from products;
-- 42. Display the first 5 characters of each product name along with its rounded price.
select product_name, substring(product_name, 1, 5), price, round(price) as Roundup_Price from products; 
-- 43. Display the product name and the number of days since its manufacture date.
select product_name, datediff(curdate(), manufacture_date) as Days_Since_Manufacture from products;
-- 44. Display product name along with price rounded upward.
select product_name, ceil(price) as Ceiling_Price from products;
-- 45. Combine product name and category and display the result in uppercase.
select product_name, category, upper(concat(product_name, '-', category)) from products;
-- 46. Find the average price of products manufactured in 2024.
select avg(price) 
from products
where year(manufacture_date) = 2024;
-- 47. Display products whose name length is greater than 10 characters.
select product_name, length(product_name)
from products 
where length(product_name) > 10;
-- 48. Find the total number of products manufactured in each year.
select year(manufacture_date) as Manufacture_Year, count(*) as Total_Products
from products
group by year(manufacture_date);
-- 49. Find the highest-priced product in each category.
select category, max(price) as Highest_Product_Price
from products 
group by category;
-- 50. Display the current date along with the total number of products.
select curdate() as Todays_Date, count(*) as Total_Products 
from products;