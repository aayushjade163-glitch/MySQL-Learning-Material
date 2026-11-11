create database OperatorDB;
use OperatorDB;

create table Inventory (
	ID int,
    Product_Name varchar(50),
    Quantity int,
    Price_Per_Unit decimal(10,2),
    Items_Per_Box int
);

insert into Inventory(ID, Product_Name, Quantity, Price_Per_Unit, Items_Per_Box)
values
(1, 'Pen', 100, 10.00, 20),
(2, 'Notebook', 50, 45.00, 10),
(3, 'Pencil', 200, 5.00, 50),
(4, 'Marker', 80, 25.00, 20),
(5, 'Eraser', 150, 8.00, 25),
(6, 'Stapler', 30, 120.00, 5),
(7, 'File', 60, 35.00, 10),
(8, 'Glue', 90, 20.00, 15);

select * from Inventory;

/* 
---------------------------------------------
Arithemtic Operators 
(+, -, *, /, %) 
---------------------------------------------
*/

-- 1. Display quantity increased by 5
select Quantity, Quantity + 5
as "New_Quantity" 
from Inventory 
where ID=1;

-- 2. Display quantity decreased by 5
select *, quantity - 5
as "New_Quantity"
from Inventory;

-- 3. Display double of price
select Price_Per_Unit, Price_Per_Unit * 2
as "Double_Price"
from Inventory;

-- 4. Display half quantity
select quantity, quantity / 2
as "Half_Quantity"
from Inventory;

-- 5. Display items % 3
select Items_Per_Box, Items_Per_Box % 3
as "Remainder"
from Inventory;

-- 6. Increase quantity of ID = 1 to 40
update Inventory
set Quantity = Quantity + 40
where ID=1;
select * from Inventory;

/*
----------------------------------------------------------
Comparison Operator
(used to compare two values)
{=, !=, <>, <, >, >=, <=}
---------------------------------------------------------- 
*/
-- 1. Display all products whose price_Per_Unit exactly 20
select * from Inventory
where Price_Per_Unit=20;

-- 2. Display all products whose quantity is not equal to 140 using !=
select * from Inventory
where Quantity != 140;

-- 3. Display all products whose quantity is not equal to 140 using !=
select * from Inventory;

-- 4. Display all products whose quantity is greater than 100 using <>
select * from Inventory
where Quantity > 100;

-- 5. Display all products whose quantity less than 100
select * from Inventory
where Quantity < 100;

-- 6. Display all products whose price_per_unit is greater than or equal to 35 using >=
select * from Inventory
where Price_Per_Unit >= 35;

-- 7. Display all products whose items_per_box is less than or equal to 10 using <=
select * from Inventory
where Price_Per_Unit <= 10;

/* 
---------------------------------------------------------------------------------------------
Between with AND Operator 
(Used to check whether a value falls within a specified range including both boundary values)
--------------------------------------------------------------------------------------------- 
*/
-- 1. Display all products whose quantity is between 50 and 100
select * from Inventory
where Quantity 
between 50 and 100;

-- 2. Display all products whose price_per_unit is between 10 and 40
select * from Inventory
where Price_Per_Unit
between 10 and 40;

/* 
----------------------------------------------------------
LIKE Operator 
Executes basic pattern matching using wildcards
(% for multiple characters
_ for a single character).
LIKE is used for pattern matching with text values
% -> Represents zero or more characters
_ -> Represents excatly one character
----------------------------------------------------------
*/

-- 1. Display all products whose product_name starts with 'P'
select * from Inventory
where Product_Name like 'P%';

-- 2. Display all products whose product_name ends with 'e'
select * from Inventory
where Product_Name like '%e';

-- 3. Display all products whose product_name contains with 'en'
select * from Inventory
where Product_Name like '%en%';

-- 4. Display all products whose product_name has exactlt 3 characters and ends with 'en'
select * from Inventory
where Product_Name like '_en';

/*
--------------------------------------------
Logical Operators
Used to combine or reverse conditions
--------------------------------------------
*/
-- 1. Display all products whose quantity is greater than 50 AND price_per_unit is less than 30
select * from Inventory
where Quantity > 50 AND
Price_Per_Unit < 30;

-- 2. Display all products whose quantity is less than 50 OR price_per_unit is greater than 50
select * from Inventory
where Quantity < 50 or
Price_Per_Unit > 50;

-- 3. Display all products whose price_per_unit is not equal to 20
select * from Inventory
where not Price_Per_Unit = 20;

/*
-------------------------------------------------------
Assignment Operator (=)
Used to assign a new value to a column, mainly with the UPDATE statement
-------------------------------------------------------
*/
-- 1. Change the quantity of the product with the id = 1 to 120
update Inventory
set Quantity=120
where ID=1;
select * from Inventory;

-- 2. Change the price_per_unit of Pen to 15
update Inventory
set Price_Per_Unit=15
where Product_Name='Pen';
select * from Inventory;

-- 3. Increase the existing quantity of the product with id = 2 by 20
update Inventory
set Quantity=Quantity + 20
where ID=2;
select * from Inventory;

/*
--------------------------------------------------------------------------
Additional Operators As a Task
--------------------------------------------------------------------------
IN(): Validates whether a value matches any option inside a specified
comma-separated list or subquery.

REGEXP or RLIKE: Executes advanced pattern matching using POSIX regular
expressions.

IS NULL: Tests explicitly for the absence of data in a table field.

IS NOT NULL: Tests explicitly for fields that contain data.

EXISTS(): Evalutes to TRUE if a subquery returns one or more matching
database rows.
--------------------------------------------------------------------------
*/

-- Create Products Table
CREATE TABLE Products (
    Product_ID INT,
    Product_Name VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price_Per_Unit DECIMAL(10,2),
    Supplier_ID INT
);


-- Create Suppliers Table
CREATE TABLE Suppliers (
    Supplier_ID INT,
    Supplier_Name VARCHAR(50),
    City VARCHAR(50),
    Product_Type VARCHAR(50)
);


-- Insert Data into Products
INSERT INTO Products
(Product_ID, Product_Name, Category, Quantity, Price_Per_Unit, Supplier_ID)
VALUES
(1, 'Pen', 'Stationery', 100, 10.00, 101),
(2, 'Notebook', 'Stationery', 50, 45.00, 102),
(3, 'Pencil', 'Stationery', 200, 5.00, 101),
(4, 'Marker', 'Stationery', 80, 25.00, 103),
(5, 'Eraser', 'Stationery', 150, 8.00, 104),
(6, 'Stapler', 'Office Supplies', 30, 120.00, 102),
(7, 'File', 'Office Supplies', 60, 35.00, 105),
(8, 'Glue', 'Stationery', 90, 20.00, 103),
(9, 'Calculator', 'Electronics', 40, 350.00, 106),
(10, 'Keyboard', 'Electronics', 25, 750.00, NULL);


-- Insert Data into Suppliers
INSERT INTO Suppliers
(Supplier_ID, Supplier_Name, City, Product_Type)
VALUES
(101, 'ABC Stationers', 'Pune', 'Stationery'),
(102, 'Office World', 'Mumbai', 'Office Supplies'),
(103, 'Bright Supplies', 'Delhi', 'Stationery'),
(104, 'National Traders', 'Pune', 'Stationery'),
(105, 'Smart Office', 'Mumbai', 'Office Supplies'),
(106, 'Tech World', 'Pune', 'Electronics'),
(107, 'Modern Supplies', 'Nashik', 'Stationery');

/*
------------------------------------------------------------
IN() OPERATOR
------------------------------------------------------------
*/

-- 1. Display products belonging to Stationery or Electronics.
SELECT *
FROM Products
WHERE Category IN ('Stationery', 'Electronics');

-- 2. Display products whose price is 10, 20, or 35.
SELECT *
FROM Products
WHERE Price_Per_Unit IN (10, 20, 35);

/*
------------------------------------------------------------
REGEXP / RLIKE OPERATOR
------------------------------------------------------------
*/

-- 3. Display products whose name starts with 'P'.
SELECT *
FROM Products
WHERE Product_Name REGEXP '^P';

-- 4. Display products whose name ends with 'r'.
SELECT *
FROM Products
WHERE Product_Name RLIKE 'r$';

-- 5. Display products whose name contains the letter 'e'.
SELECT *
FROM Products
WHERE Product_Name REGEXP 'e';

/*
------------------------------------------------------------
IS NULL OPERATOR
------------------------------------------------------------
*/

-- 6. Display products that do not have a supplier assigned.
SELECT *
FROM Products
WHERE Supplier_ID IS NULL;

/*
------------------------------------------------------------
IS NOT NULL OPERATOR
------------------------------------------------------------
*/

-- 7. Display products that have a supplier assigned.
SELECT *
FROM Products
WHERE Supplier_ID IS NOT NULL;

/*
------------------------------------------------------------
EXISTS() OPERATOR
------------------------------------------------------------
*/

-- 8. Display products whose supplier exists in the Suppliers table.
SELECT *
FROM Products p
WHERE EXISTS (
    SELECT *
    FROM Suppliers s
    WHERE s.Supplier_ID = p.Supplier_ID
);

-- 9. Display products supplied by suppliers from Pune.
SELECT *
FROM Products p
WHERE EXISTS (
    SELECT *
    FROM Suppliers s
    WHERE s.Supplier_ID = p.Supplier_ID
    AND s.City = 'Pune'
);

-- 10. Display products whose supplier supplies Stationery products.
SELECT *
FROM Products p
WHERE EXISTS (
    SELECT *
    FROM Suppliers s
    WHERE s.Supplier_ID = p.Supplier_ID
    AND s.Product_Type = 'Stationery'
);

/*
------------------------------------------------------------
NOT EXISTS() OPERATOR
------------------------------------------------------------
*/

-- 11. Display products whose supplier does not exist in the Suppliers table.
SELECT *
FROM Products p
WHERE NOT EXISTS (
    SELECT *
    FROM Suppliers s
    WHERE s.Supplier_ID = p.Supplier_ID
);