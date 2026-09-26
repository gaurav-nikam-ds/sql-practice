/*
E-commerce Sales Analysis — SQL JOINs
Version 4 | Learning + Business Analysis

Purpose:
Learn how to combine orders with customer and product details, then
apply joins to real e-commerce business questions.

Database: PostgreSQL
Tables:
  customers(customer_id, customer_name, gender, age, city, state,
            signup_date, customer_segment)
  products(product_id, product_name, category, sub_category, price, cost)
  orders(order_id, customer_id, product_id, order_date, quantity,
         unit_price, discount, payment_method, order_status)

Revenue formula:
  quantity * unit_price * (1 - discount)

Run each section separately in pgAdmin.
*/


-- ============================================================
-- 1. Understand INNER JOIN
-- Business question: Show delivered orders with product names.
-- INNER JOIN returns rows where the join key matches in both tables.
-- ============================================================

SELECT
    o.order_id,
    p.product_name,
    o.quantity,
    o.unit_price,
    o.discount,
    o.quantity * o.unit_price * (1 - o.discount) AS revenue
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered';


-- ============================================================
-- 2. JOIN orders with customers
-- Business question: Which customer placed each delivered order?
-- The customer_id connects orders to customers.
-- ============================================================

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.order_date,
    o.quantity * o.unit_price * (1 - o.discount) AS revenue
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'Delivered';


-- ============================================================
-- 3. Three-table JOIN
-- Business question: Show order, customer, and product details.
-- Use aliases o, c, and p to make the query easier to read.
-- ============================================================

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    o.quantity,
    o.quantity * o.unit_price * (1 - o.discount) AS revenue
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered';


-- ============================================================
-- 4. Business KPI: Top 5 products by delivered revenue
-- Aggregate revenue by product, then sort and return five rows.
-- ============================================================

SELECT
    p.product_name,
    SUM(o.quantity * o.unit_price * (1 - o.discount)) AS total_revenue
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 5;


-- ============================================================
-- 5. Business KPI: Revenue by product category
-- Helps compare delivered revenue across product categories.
-- ============================================================

SELECT
    p.category,
    SUM(o.quantity * o.unit_price * (1 - o.discount)) AS category_revenue
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY category_revenue DESC;


-- ============================================================
-- 6. Business KPI: Delivered revenue by customer
-- Shows customers and their total delivered revenue.
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    SUM(o.quantity * o.unit_price * (1 - o.discount)) AS total_revenue
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_revenue DESC;


-- ============================================================
-- 7. LEFT JOIN introduction
-- Business question: List all customers, including those with no orders.
-- LEFT JOIN keeps every row from the left table (customers).
-- Order columns are NULL when no matching order exists.
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_status
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;


-- ============================================================
-- 8. Business question: Customers with no orders
-- Keep the LEFT JOIN and filter for missing matching order IDs.
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;


-- ============================================================
-- JOIN learning reminders
-- INNER JOIN: only matching rows from both tables.
-- LEFT JOIN: all left-table rows plus matching right-table rows.
-- ON: defines how rows relate, usually using primary/foreign keys.
-- Aliases: o, c, p are short names for orders, customers, products.
-- Always check the join key to avoid accidental row multiplication.
-- ============================================================
