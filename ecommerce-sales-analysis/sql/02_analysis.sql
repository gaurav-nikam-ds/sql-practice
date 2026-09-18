-- E-Commerce Sales & Customer Analysis
-- Version 2: Business-focused SQL analysis
-- Concepts: SELECT, WHERE, AND/OR/NOT, IN, BETWEEN, LIKE, DISTINCT,
-- ORDER BY, LIMIT, COUNT, COUNT DISTINCT, SUM, AVG, MIN, MAX,
-- GROUP BY, HAVING and basic subqueries.

-- ============================================================
-- SECTION 1: BASIC EXPLORATION
-- ============================================================

-- 1. View all customers
SELECT *
FROM customers;

-- 2. Customers from Pune
SELECT customer_name, city
FROM customers
WHERE city = 'Pune';

-- 3. Customers from Pune or Nashik
SELECT customer_name, city
FROM customers
WHERE city IN ('Pune', 'Nashik')
ORDER BY city, customer_name;

-- 4. Customers aged between 25 and 30
SELECT customer_name, age, city
FROM customers
WHERE age BETWEEN 25 AND 30
ORDER BY age;

-- 5. Premium customers
SELECT customer_name, customer_segment
FROM customers
WHERE customer_segment = 'Premium'
ORDER BY customer_name;

-- 6. Different customer cities
SELECT DISTINCT city
FROM customers
ORDER BY city;

-- 7. Customers whose name starts with 'A'
SELECT customer_name, city
FROM customers
WHERE customer_name LIKE 'A%';

-- 8. Latest 5 orders
SELECT order_id, customer_id, order_date, order_status
FROM orders
ORDER BY order_date DESC
LIMIT 5;

-- ============================================================
-- SECTION 2: CORE BUSINESS KPIs
-- ============================================================

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT SUM(quantity) AS total_quantity_sold
FROM orders
WHERE order_status = 'Delivered';

SELECT ROUND(AVG(price), 2) AS average_product_price
FROM products;

SELECT
    MIN(price) AS lowest_price,
    MAX(price) AS highest_price
FROM products;

SELECT
    ROUND(SUM(quantity * unit_price * (1 - discount)), 2) AS total_revenue
FROM orders
WHERE order_status = 'Delivered';

SELECT
    ROUND(AVG(quantity * unit_price * (1 - discount)), 2) AS average_order_value
FROM orders
WHERE order_status = 'Delivered';

-- ============================================================
-- SECTION 3: ORDER STATUS ANALYSIS
-- ============================================================

SELECT
    order_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

SELECT
    order_id,
    customer_id,
    order_status
FROM orders
WHERE order_status IN ('Cancelled', 'Returned')
ORDER BY order_id;

-- Basic subquery version of the unsuccessful-order percentage.
SELECT
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders),
        2
    ) AS unsuccessful_order_percentage
FROM orders
WHERE order_status IN ('Cancelled', 'Returned');

-- ============================================================
-- SECTION 4: PAYMENT METHOD ANALYSIS
-- ============================================================

SELECT
    payment_method,
    COUNT(*) AS order_count
FROM orders
WHERE order_status = 'Delivered'
GROUP BY payment_method
ORDER BY order_count DESC;

SELECT
    payment_method,
    COUNT(*) AS order_count,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(quantity * unit_price * (1 - discount)), 2) AS total_revenue
FROM orders
WHERE order_status = 'Delivered'
GROUP BY payment_method
ORDER BY total_revenue DESC;

SELECT
    payment_method,
    SUM(quantity) AS total_quantity
FROM orders
WHERE order_status = 'Delivered'
GROUP BY payment_method
ORDER BY total_quantity DESC;

-- ============================================================
-- SECTION 5: CUSTOMER ANALYSIS
-- ============================================================

SELECT
    customer_id,
    COUNT(*) AS delivered_orders
FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY delivered_orders DESC, customer_id;

SELECT
    customer_id,
    ROUND(SUM(quantity * unit_price * (1 - discount)), 2) AS total_revenue
FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
HAVING SUM(quantity * unit_price * (1 - discount)) > 5000
ORDER BY total_revenue DESC;

SELECT
    customer_id,
    ROUND(SUM(quantity * unit_price * (1 - discount)), 2) AS total_revenue
FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 5;

SELECT
    customer_id,
    SUM(quantity) AS total_quantity
FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
HAVING SUM(quantity) > 4
ORDER BY total_quantity DESC;

-- ============================================================
-- SECTION 6: GROUP BY + HAVING BUSINESS ANALYSIS
-- ============================================================

SELECT
    payment_method,
    ROUND(SUM(quantity * unit_price * (1 - discount)), 2) AS total_revenue
FROM orders
WHERE order_status = 'Delivered'
GROUP BY payment_method
HAVING SUM(quantity * unit_price * (1 - discount)) > 20000
ORDER BY total_revenue DESC;

SELECT
    customer_id,
    COUNT(*) AS delivered_orders,
    ROUND(SUM(quantity * unit_price * (1 - discount)), 2) AS total_revenue
FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
HAVING COUNT(*) > 2
ORDER BY total_revenue DESC;

SELECT
    customer_id,
    COUNT(*) AS delivered_orders,
    ROUND(SUM(quantity * unit_price * (1 - discount)), 2) AS total_revenue
FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
HAVING SUM(quantity * unit_price * (1 - discount)) > 8000
   AND COUNT(*) >= 2
ORDER BY total_revenue DESC;

-- ============================================================
-- SECTION 7: HIGH-VALUE ORDER ANALYSIS
-- ============================================================

SELECT
    order_id,
    customer_id,
    product_id,
    ROUND(quantity * unit_price * (1 - discount), 2) AS order_value
FROM orders
WHERE order_status = 'Delivered'
  AND quantity * unit_price * (1 - discount) = (
      SELECT MAX(quantity * unit_price * (1 - discount))
      FROM orders
      WHERE order_status = 'Delivered'
  );

SELECT
    order_id,
    customer_id,
    product_id,
    quantity
FROM orders
WHERE quantity > 1
ORDER BY quantity DESC;

-- ============================================================
-- SECTION 8: DATE AND PAYMENT FILTERING PRACTICE
-- ============================================================

SELECT
    order_id,
    order_date,
    customer_id
FROM orders
WHERE order_status = 'Delivered'
  AND order_date BETWEEN '2025-06-01' AND '2025-09-30'
ORDER BY order_date;

SELECT
    order_id,
    payment_method,
    order_status
FROM orders
WHERE payment_method IN ('UPI', 'Card')
ORDER BY order_id;

-- ============================================================
-- SECTION 9: BUSINESS LOGIC NOTES
-- ============================================================
-- Revenue formula:
-- quantity * unit_price * (1 - discount)
--
-- Delivered orders are used for revenue and sales-performance analysis.
-- Cancelled/Returned orders are excluded from delivered-sales KPIs.
--
-- Current limitation:
-- Customer names, product names, categories, cities and segments are
-- intentionally not combined with order-level analysis yet because JOIN
-- has not been learned. JOIN-based analysis will be added in a future
-- project version after learning the concept.
