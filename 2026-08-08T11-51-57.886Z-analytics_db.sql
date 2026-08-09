-- Step 1: Create Database
CREATE DATABASE analytics_db;
USE analytics_db;

-- Step 2: Create Sales Table
CREATE TABLE sales (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    sales_amount DECIMAL(10, 2) NOT NULL
);

-- Step 3: Insert Sample Data (20 Rows)
INSERT INTO sales (customer_name, region, product, quantity, sales_amount) VALUES
('Alice Smith', 'North', 'Laptop', 1, 1200.00),
('Bob Johnson', 'South', 'Smartphone', 2, 1600.00),
('Charlie Brown', 'East', 'Tablet', 3, 900.00),
('David Miller', 'West', 'Monitor', 2, 500.00),
('Eva Green', 'North', 'Smartphone', 1, 800.00),
('Frank White', 'South', 'Laptop', 2, 2400.00),
('Grace Black', 'East', 'Headphones', 5, 250.00),
('Henry Adams', 'West', 'Tablet', 1, 300.00),
('Ivy Taylor', 'North', 'Monitor', 1, 250.00),
('Jack Nelson', 'South', 'Headphones', 4, 200.00),
('Karen Hill', 'East', 'Laptop', 1, 1200.00),
('Leo Carter', 'West', 'Smartphone', 3, 2400.00),
('Mia Dong', 'North', 'Tablet', 2, 600.00),
('Nathan Cruz', 'South', 'Monitor', 2, 500.00),
('Olivia Reed', 'East', 'Smartphone', 1, 800.00),
('Peter Parker', 'West', 'Laptop', 1, 1200.00),
('Quinn Fabray', 'North', 'Headphones', 3, 150.00),
('Rachel Green', 'South', 'Tablet', 2, 600.00),
('Sam Winchester', 'East', 'Monitor', 4, 1000.00),
('Thomas Wayne', 'West', 'Headphones', 2, 100.00);



SELECT * FROM sales;


-- only product and sales_amount show
SELECT product, sales_amount FROM sales;


-- Filtering with WHERE clause
SELECT * FROM sales WHERE region = 'North';

-- fixed product name 
SELECT * FROM sales WHERE product = 'Laptop';



--  Sorting with ORDER BY
SELECT * FROM sales ORDER BY sales_amount DESC;

-- customer_name in-order (A-Z) 
SELECT * FROM sales ORDER BY customer_name ASC;


--  Aggregating data
SELECT SUM(sales_amount) AS total_sales FROM sales;

-- COUNT
SELECT COUNT(order_id) AS total_orders FROM sales;


--  Grouping data
SELECT region, SUM(sales_amount) AS total_sales_per_region 
FROM sales 
GROUP BY region;

-- product sele's group
SELECT product, SUM(sales_amount) AS total_sales_per_product 
FROM sales 
GROUP BY product;


-- Creating second table for joins
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL
);


-- products insert
INSERT INTO products (product_name, category) VALUES
('Laptop', 'Computers'),
('Smartphone', 'Mobiles'),
('Tablet', 'Mobiles'),
('Monitor', 'Accessories'),
('Headphones', 'Accessories');



-- Using SQL joins
SELECT s.order_id, s.customer_name, s.product, p.category, s.sales_amount
FROM sales s
JOIN products p ON s.product = p.product_name;



-- Simple dashboard-style queries

SELECT p.category, SUM(s.sales_amount) AS total_sales_per_category
FROM sales s
JOIN products p ON s.product = p.product_name
GROUP BY p.category;

-- Top selling product by quantity
SELECT product, SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product
ORDER BY total_quantity_sold DESC
LIMIT 1;

