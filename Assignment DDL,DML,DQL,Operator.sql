create database Books;
use Books;

CREATE TABLE Books (
    Book_ID INT,
    Book_Name VARCHAR(100),
    Author VARCHAR(50),
    Category VARCHAR(30),
    Price DECIMAL(10,2),
    Quantity INT
);

INSERT INTO books
(Book_ID, Book_Name, Author, Category, Price, Quantity)
VALUES
(101, 'The Alchemist', 'Paulo Coelho', 'Fiction', 350.00, 25),
(102, 'Atomic Habits', 'James Clear', 'Self Help', 500.00, 40),
(103, 'Wings of Fire', 'A P J Abdul Kalam', 'Biography', 400.00, 30),
(104, 'The Psychology of Money', 'Morgan Housel', 'Finance', 600.00, 20),
(105, 'Ikigai', 'Hector Garcia', 'Self Help', 450.00, 35),
(106, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 550.00, 15),
(107, 'The Monk Who Sold His Ferrari', 'Robin Sharma', 'Fiction', 300.00, 50),
(108, 'Think Like a Monk', 'Jay Shetty', 'Self Help', 480.00, 28),
(109, 'Steve Jobs', 'Walter Isaacson', 'Biography', 700.00, 18),
(110, 'The Power of Now', 'Eckhart Tolle', 'Self Help', 380.00, 45);

select * from Books;

-- ==================================================
-- DDL QUERIES
-- ==================================================

-- 1. Add a new column called publisher to the books table.
alter table Books
add Publisher varchar(50);

-- 2. Add a new column called publication_year to the books table.
alter table Books
add Publication_Year year;

-- 3. Modify the author column to store up to 100 characters.
alter table Books
modify Author varchar(100);

-- 4. Rename the quantity column to stock.
alter table Books
rename column Quantity to Stock;

-- 5. Remove the publisher column.
alter table Books
drop Publisher;

-- 6. Create another table called magazines with appropriate
--    columns of your choice.
CREATE TABLE Magazines (
    Magazine_ID INT,
    Magazine_Name VARCHAR(100),
    Publisher VARCHAR(50),
    Category VARCHAR(30),
    Price DECIMAL(10,2),
    Quantity INT
);

INSERT INTO Magazines (Magazine_ID, Magazine_Name, Publisher, Category, Price, Quantity)
VALUES
(201, 'Forbes India', 'Forbes', 'Business', 200.00, 15),
(202, 'India Today', 'Living Media', 'News', 120.00, 25),
(203, 'National Geographic', 'NatGeo', 'Science', 300.00, 10);

select * from Magazines;

-- 7. Remove all records from the magazines table using TRUNCATE.
TRUNCATE TABLE Magazines;
select * from Magazines;

-- 8. Delete the magazines table using DROP.
drop table Magazines;

-- ==================================================
-- DML QUERIES
-- ==================================================

-- 1. Insert a new book into the books table.
INSERT INTO books
(Book_ID, Book_Name, Author, Category, Price, Stock)
VALUES
(111, 'The 7 Habits of Highly Effective People', 'Stephen Covey', 'Self Help', 550.00, 22);

-- 2. Insert two new books using a single INSERT statement.
INSERT INTO books
(Book_ID, Book_Name, Author, Category, Price, Stock)
VALUES
(112, 'The Intelligent Investor', 'Benjamin Graham', 'Finance', 650.00, 16),
(113, 'Harry Potter and the Sorcerer''s Stone', 'J K Rowling', 'Fiction', 450.00, 30);

-- 3. Update the price of Atomic Habits to 550.
update Books
set Price=550
where Book_Name='Atomic Habits';

-- 4. Increase the price of all books by 10%.
update Books
set Price=Price * 1.10;

-- 5. Update the quantity of The Alchemist to 30.
update Books
set Stock=30
where Book_Name='The Alchemist';

-- 6. Delete a specific book record from the table.
DELETE FROM books
WHERE book_id = 111;
select * from Books;

-- 7. Delete all records from a temporary table using DELETE.
CREATE TEMPORARY TABLE Temp_Books AS
SELECT * FROM Books;

DELETE FROM Temp_Books;

SELECT * FROM Temp_Books;

-- ==================================================
-- DQL QUERIES
-- ==================================================

-- 1. Display all records from the books table.
select * from Books;

-- 2. Display only book_name and price.
select Book_Name, Price
from Books;

-- 3. Display book_name, author, and category.
select Book_Name, Author, Category
from Books;

-- 4. Display all book details and give the price column the alias
--    Book_Price.
select Book_ID, Book_Name, Author, Category, Price as 'Book_Price', Stock from Books;

-- 5. Display book_name and give it the alias Book_Name.
select Book_Name as 'Book_Name' from Books;

-- 6. Display all unique categories.
select distinct Category from Books;

-- 7. Display all unique authors.
select distinct Author from Books;

-- 8. Find the total price of all books using SUM().
select sum(Price) 
from Books;

-- 9. Find the average price of all books using AVG().
select avg(Price)
from Books;

-- 10. Find the highest book price using MAX().
select max(Price)
from Books;

-- 11. Find the lowest book price using MIN().
select min(Price)
from Books;

-- 12. Count the total number of books using COUNT().
select count(Book_ID)
from Books;

-- ==================================================
-- ARITHMETIC OPERATORS
-- ==================================================

-- 1. Display book_name and price after adding 50 to the price.
select Book_Name, Price, Price + 50
as 'Increased Price'
from Books;

-- 2. Display book_name and price after subtracting 25 from the price.
select Book_Name, Price, Price - 25
as 'Deducted Price'
from Books;
-- 3. Display book_name and price after increasing the price by 10%.
select Book_Name, Price, Price * 1.10
as 'Increased 10% Price'
from Books;

-- 4. Display book_name and price after dividing the price by 2.
select Book_Name, Price, Price / 2
as 'Divided Price'
from Books;

-- 5. Display book_name and the remainder when quantity is divided by 2.
select Book_Name, Stock, Stock % 2
as 'Stock Remainder'
from Books;

-- ==================================================
-- COMPARISON OPERATORS
-- ==================================================

-- 1. Display books whose price is exactly 500.
select * from Books
where Price =  500;

-- 2. Display books whose quantity is not equal to 30 using !=.
select * from Books
where Stock != 30;

-- 3. Display books whose quantity is not equal to 25 using <>.
select * from Books
where Stock <> 25;

-- 4. Display books whose price is greater than 500.
select * from Books
where Price > 500;
-- 5. Display books whose quantity is less than 25.
select *  from Books
where Stock < 25;

-- 6. Display books whose price is greater than or equal to 600.
select * from Books
where Price >= 600;

-- 7. Display books whose quantity is less than or equal to 20.
select * from Books
where Stock <= 20;

-- ==================================================
-- BETWEEN OPERATOR
-- ==================================================

-- 1. Display books whose price is between 400 and 600.
select * from Books
where Price
between 400 and 600;

-- 2. Display books whose quantity is between 20 and 40.
select * from Books
where Stock
between 20 and 40;

-- ==================================================
-- LIKE OPERATOR
-- ==================================================

-- 1. Display books whose name starts with 'T'.
select * from Books
where Book_Name like 'T%';

-- 2. Display books whose name ends with 'i'.
select * from Books
where Book_Name like '%i';
-- 3. Display books whose name contains 'Money'.
select * from Books
where Book_Name like '%Money%';
-- 4. Display books whose author name starts with 'J'.
select * from Books
where Author like 'J%';
-- 5. Display books whose name has exactly 6 characters.
select * from Books
where Book_Name like '______';

-- ==================================================
-- LOGICAL OPERATORS
-- ==================================================

-- 1. Display books whose price is greater than 400 AND quantity
--    is greater than 25.
select * from Books
where Price > 400 and
Stock > 25;

-- 2. Display books whose price is less than 400 OR quantity
--    is greater than 40.
select * from Books
where Price < 400 or
Stock > 40;

-- 3. Display books that are NOT in the Fiction category.
select * from Books
where not Category='Fiction';

-- ==================================================
-- ASSIGNMENT OPERATOR
-- ==================================================

-- 1. Change the price of Ikigai to 500.
update Books
set Price=500
where Book_Name='Ikigai';
select * from Books;

-- 2. Change the quantity of Atomic Habits to 50.
update Books
set Stock=50
where Book_Name='Atomic Habits';
select * from Books;

-- 3. Increase the price of Wings of Fire by 50.
update Books
set Price=Price + 50
where Book_Name='Wings of Fire';
select * from Books;

-- 4. Decrease the quantity of Rich Dad Poor Dad by 5.
update Books
set Stock=Stock - 5
where Book_Name='Rich Dad Poor Dad';
select * from Books;
