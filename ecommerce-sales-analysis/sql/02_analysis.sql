-- E-Commerce Sales & Customer Analysis
-- Version 1: Analysis using only concepts learned so far

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

-- 9. Total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 10. Total number of products
SELECT COUNT(*) AS total_products
FROM products;

-- 11. Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 12. Total quantity sold in delivered orders
SELECT SUM(quantity) AS total_quantity_sold
FROM orders
WHERE order_status = 'Delivered';

-- 13. Average product price
SELECT ROUND(AVG(price), 2) AS average_product_price
FROM products;

-- 14. Cheapest and most expensive product price
SELECT
    MIN(price) AS lowest_price,
    MAX(price) AS highest_price
FROM products;

-- 15. Total revenue from delivered orders
SELECT ROUND(SUM(quantity * unit_price * (1 - discount)), 2) AS total_revenue
FROM orders
WHERE order_status = 'Delivered';

-- 16. Highest-value delivered order
SELECT order_id,
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

-- 17. Delivered orders between two dates
SELECT order_id, order_date, customer_id
FROM orders
WHERE order_status = 'Delivered'
  AND order_date BETWEEN '2025-06-01' AND '2025-09-30'
ORDER BY order_date;

-- 18. Orders paid using UPI or Card
SELECT order_id, payment_method, order_status
FROM orders
WHERE payment_method IN ('UPI', 'Card')
ORDER BY order_id;

-- 19. Cancelled or returned orders
SELECT order_id, customer_id, order_status
FROM orders
WHERE order_status IN ('Cancelled', 'Returned')
ORDER BY order_id;

-- 20. Orders with quantity greater than 1
SELECT order_id, customer_id, product_id, quantity
FROM orders
WHERE quantity > 1
ORDER BY quantity DESC;
