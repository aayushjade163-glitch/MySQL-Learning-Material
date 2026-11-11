create database Joins_Practice;
use Joins_Practice;
/*
========================================================
1. INNER JOIN
Tables: employees + projects
========================================================
*/
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    project_id INT
);

INSERT INTO employees VALUES
(101, 'Amit', 'IT', 501),
(102, 'Neha', 'HR', 502),
(103, 'Rahul', 'Finance', 503),
(104, 'Sneha', 'IT', 501),
(105, 'Karan', 'Marketing', 504),
(106, 'Pooja', 'Finance', 506);

CREATE TABLE projects (
    project_id INT,
    project_name VARCHAR(100),
    budget INT
);

INSERT INTO projects VALUES
(501, 'Banking App', 500000),
(502, 'Recruitment Portal', 300000),
(503, 'Financial Dashboard', 450000),
(504, 'Marketing Campaign', 200000),
(505, 'E-commerce Website', 600000);

-- TASKS - INNER JOIN

-- 1. Display employee name and their project name.
select e.emp_id, e.emp_name, e.department, e.project_id, p.project_name  from employees e
inner join projects p on e.project_id = p.project_id;

-- 2. Display employee name, department and project budget.
select e.emp_id, e.emp_name, e.department, e.project_id, p.budget from employees e
inner join projects p on e.project_id = p.project_id;

-- 3. Display employees working on projects having a budget
--    greater than 300000.
select e.emp_id, e.emp_name from employees e
inner join projects p on e.project_id = p.project_id
where  budget > 300000;

-- 4. Display employee name and project name for employees
--    belonging to the IT or Finance department.
select e.emp_id, e.emp_name, p.project_name from employees e
inner join projects p on e.project_id = p.project_id
where department = 'IT' or department='Finance';

/*
========================================================
2. LEFT JOIN
Tables: warehouses + inventory
========================================================
*/
CREATE TABLE warehouses (
    warehouse_id INT,
    warehouse_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO warehouses VALUES
(1, 'Central Warehouse', 'Pune'),
(2, 'North Warehouse', 'Delhi'),
(3, 'West Warehouse', 'Mumbai'),
(4, 'South Warehouse', 'Bangalore'),
(5, 'East Warehouse', 'Kolkata');

CREATE TABLE inventory (
    inventory_id INT,
    warehouse_id INT,
    item_name VARCHAR(50),
    quantity INT
);

INSERT INTO inventory VALUES
(201, 1, 'Laptop', 50),
(202, 1, 'Monitor', 30),
(203, 2, 'Printer', 20),
(204, 3, 'Keyboard', 100),
(205, 3, 'Mouse', 150),
(206, 4, 'Scanner', 15);


-- TASKS - LEFT JOIN

-- 5. Display all warehouses along with the items stored in them.
select * from warehouses w
left join inventory i on w.warehouse_id = i.warehouse_id;

-- 6. Display warehouse name, city, item name and quantity.
select w.warehouse_name, w.city, i.item_name, i.quantity 
from warehouses w
left join inventory i on w.warehouse_id = i.warehouse_id;

-- 7. Find warehouses where no inventory is currently recorded.
select * from warehouses w
left join inventory i on w.warehouse_id = i.warehouse_id
where i.inventory_id is NULL;

-- 8. Display all warehouses and their inventory, including
--    warehouses having no items.
select * from warehouses w
left join inventory i on w.warehouse_id = i.warehouse_id;

/*
========================================================
3. RIGHT JOIN
Tables: suppliers + materials
========================================================
*/
CREATE TABLE suppliers (
    supplier_id INT,
    supplier_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO suppliers VALUES
(301, 'ABC Supplies', 'Pune'),
(302, 'Global Traders', 'Mumbai'),
(303, 'Prime Materials', 'Delhi'),
(304, 'Metro Suppliers', 'Nashik');

CREATE TABLE materials (
    material_id INT,
    material_name VARCHAR(50),
    supplier_id INT,
    price INT
);

INSERT INTO materials VALUES
(401, 'Steel', 301, 75000),
(402, 'Copper', 302, 95000),
(403, 'Aluminium', 303, 65000),
(404, 'Plastic', 305, 40000),
(405, 'Rubber', 302, 55000);


-- TASKS - RIGHT JOIN

-- 9. Display supplier name and material name.
select s.supplier_name, m.material_name from suppliers s 
right join materials m on s.supplier_id = m.supplier_id;

-- 10. Display material name, supplier name and material price.
select m.material_name, s.supplier_name, m.price from suppliers s
right join materials m on s.supplier_id = m.supplier_id;

-- 11. Display all materials, including materials whose supplier
--     does not exist in the suppliers table.
select * from suppliers s
right join materials m on s.supplier_id = m.supplier_id;

-- 12. Find materials that do not have a matching supplier.
select * from suppliers s
right join materials m on s.supplier_id = m.supplier_id
where s.supplier_id is NULL;

/*
========================================================
4. SELF JOIN
Table: products
========================================================
*/
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    replacement_product_id INT
);

INSERT INTO products VALUES
(101, 'iPhone 13', 'Mobile', 105),
(102, 'Galaxy S21', 'Mobile', 106),
(103, 'Dell Inspiron 15', 'Laptop', 107),
(104, 'HP Pavilion', 'Laptop', 108),
(105, 'iPhone 15', 'Mobile', NULL),
(106, 'Galaxy S24', 'Mobile', NULL),
(107, 'Dell Inspiron 16', 'Laptop', NULL),
(108, 'HP Pavilion Plus', 'Laptop', NULL);

-- TASKS - SELF JOIN

-- 13. Display the product name and its replacement product name.
select p.product_name as Product_Name, r.product_name as Replacement_Product_Name
from products p
join products r
on p.replacement_product_id = r.product_id;

-- 14. Display product name, category and replacement product name.
select p.product_name as Product_Name, p.category as Category, r.product_name as Replacement_Product_Name
from products p
join products r
on p.replacement_product_id = r.product_id;

-- 15. Display products whose replacement product is
--     'iPhone 15'.
select p.product_name as Product_Name, r.product_name as Replacement_Product_Name
from products p
join products r
on p.replacement_product_id = r.product_id
where r.product_name = 'iPhone 15';

-- 16. Display all products including products that do not
--     have a replacement product.
select p.product_name as Product_Name, r.product_name as Replacement_Product_Name
from products p
left join products r
on p.replacement_product_id = r.product_id;
/*
========================================================
5. CROSS JOIN
Tables: products + packaging
========================================================
*/
CREATE TABLE products_cross (
    product_id INT,
    product_name VARCHAR(50)
);

INSERT INTO products_cross VALUES
(501, 'Coffee'),
(502, 'Tea'),
(503, 'Green Tea');

CREATE TABLE packaging (
    package_id INT,
    package_type VARCHAR(50)
);

INSERT INTO packaging VALUES
(601, 'Box'),
(602, 'Pouch'),
(603, 'Bottle');


-- TASKS - CROSS JOIN

-- 17. Display every possible combination of product and
--     packaging type.
select * from products_cross pc 
cross join packaging pg;

-- 18. Display product name and package type for all combinations.
select pc.product_name, pg.package_type 
from products_cross pc
cross join packaging pg;

-- 19. Find the total number of possible product-packaging
--     combinations.
select count(*)
from products_cross pc
cross join packaging pg;

-- 20. Display the combinations of products and packaging types
--     in alphabetical order of product name.
select pc.product_name, pg.package_type 
from products_cross pc
cross join packaging pg
order by pc.product_name asc;

/*
========================================================
6. MULTIPLE TABLE JOIN
Tables: flights + airports + airlines
========================================================
*/
CREATE TABLE airlines (
    airline_id INT,
    airline_name VARCHAR(50)
);

INSERT INTO airlines VALUES
(1, 'SkyAir'),
(2, 'FlyFast'),
(3, 'AirConnect');


CREATE TABLE airports (
    airport_id INT,
    airport_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO airports VALUES
(101, 'Pune International Airport', 'Pune'),
(102, 'Mumbai International Airport', 'Mumbai'),
(103, 'Delhi International Airport', 'Delhi'),
(104, 'Bangalore International Airport', 'Bangalore');


CREATE TABLE flights (
    flight_id INT,
    airline_id INT,
    departure_airport INT,
    arrival_airport INT,
    ticket_price INT
);

INSERT INTO flights VALUES
(701, 1, 101, 102, 4500),
(702, 2, 102, 103, 5500),
(703, 1, 103, 101, 5000),
(704, 3, 101, 104, 6000),
(705, 2, 104, 102, 4800);


-- TASKS - MULTIPLE TABLE JOIN

-- 21. Display airline name, departure airport and arrival airport.
select a.airline_name, dep.airport_name as departure_airport, arr.airport_name as arrival_airport
from flights f
join airlines a on f.airline_id = a.airline_id
join airports dep on f.departure_airport = dep.airport_id
join airports arr on f.arrival_airport = arr.airport_id;

-- 22. Display airline name, departure city, arrival city and
--     ticket price.
select a.airline_name, dep.city as departure_city, arr.city as arrival_city, f.ticket_price
from flights f
join airlines a on f.airline_id = a.airline_id
join airports dep on f.departure_airport = dep.airport_id
join airports arr on f.arrival_airport = arr.airport_id;
    
-- 23. Display flights departing from Pune along with airline name
--     and destination city.
select f.flight_id, a.airline_name, dep.city as departure_city, arr.city as destination_city
from flights f
join airlines a on f.airline_id = a.airline_id
join airports dep on f.departure_airport = dep.airport_id
join airports arr on f.arrival_airport = arr.airport_id
where dep.city = 'pune';

-- 24. Display flights where ticket price is greater than 5000,
--     along with airline name, departure city and arrival city.
select a.airline_name, dep.city as departure_city, arr.city as arrival_city, f.ticket_price
from flights f
join airlines a on f.airline_id = a.airline_id
join airports dep on f.departure_airport = dep.airport_id
join airports arr on f.arrival_airport = arr.airport_id
where f.ticket_price > 5000;