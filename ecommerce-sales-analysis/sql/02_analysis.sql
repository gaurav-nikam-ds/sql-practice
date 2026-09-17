-- E-Commerce Sales & Customer Analysis
-- Beginner to intermediate business questions

-- 1. Total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 2. Total number of products
SELECT COUNT(*) AS total_products
FROM products;

-- 3. Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 4. Total quantity sold in delivered orders
SELECT SUM(quantity) AS total_quantity_sold
FROM orders
WHERE order_status = 'Delivered';

-- 5. Revenue by order
SELECT
    order_id,
    quantity,
    price,
    discount,
    ROUND(quantity * price * (1 - discount), 2) AS order_revenue
FROM orders
JOIN products USING (product_id)
WHERE order_status = 'Delivered'
ORDER BY order_revenue DESC;

-- 6. Total revenue
SELECT ROUND(SUM(quantity * price * (1 - discount)), 2) AS total_revenue
FROM orders
JOIN products USING (product_id)
WHERE order_status = 'Delivered';

-- 7. Average order value
SELECT ROUND(AVG(order_value), 2) AS average_order_value
FROM (
    SELECT order_id,
           SUM(quantity * price * (1 - discount)) AS order_value
    FROM orders
    JOIN products USING (product_id)
    WHERE order_status = 'Delivered'
    GROUP BY order_id
) AS order_summary;

-- 8. Customers by city
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY customer_count DESC;

-- 9. Revenue by city
SELECT
    c.city,
    ROUND(SUM(o.quantity * p.price * (1 - o.discount)), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY revenue DESC;

-- 10. Top customers by spending
SELECT
    c.customer_id,
    c.customer_name,
    ROUND(SUM(o.quantity * p.price * (1 - o.discount)), 2) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 10;

-- 11. Customers with more than one order
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY order_count DESC;

-- 12. Product sales quantity
SELECT
    p.product_name,
    SUM(o.quantity) AS quantity_sold
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY quantity_sold DESC;

-- 13. Product revenue
SELECT
    p.product_name,
    p.category,
    ROUND(SUM(o.quantity * p.price * (1 - o.discount)), 2) AS revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name, p.category
ORDER BY revenue DESC;

-- 14. Revenue by category
SELECT
    p.category,
    ROUND(SUM(o.quantity * p.price * (1 - o.discount)), 2) AS revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY revenue DESC;

-- 15. Profit by product
SELECT
    p.product_name,
    ROUND(SUM(o.quantity * ((p.price * (1 - o.discount)) - p.cost)), 2) AS estimated_profit
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_name
ORDER BY estimated_profit DESC;

-- 16. Payment method usage
SELECT payment_method, COUNT(*) AS order_count
FROM orders
GROUP BY payment_method
ORDER BY order_count DESC;

-- 17. Order status distribution
SELECT order_status, COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- 18. Cancelled and returned order percentage
SELECT
    ROUND(100.0 * COUNT(*) FILTER (WHERE order_status IN ('Cancelled', 'Returned')) / COUNT(*), 2)
        AS cancelled_or_returned_percentage
FROM orders;

-- 19. Monthly revenue
SELECT
    EXTRACT(MONTH FROM o.order_date) AS month_number,
    ROUND(SUM(o.quantity * p.price * (1 - o.discount)), 2) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY EXTRACT(MONTH FROM o.order_date)
ORDER BY month_number;

-- 20. Customer segment performance
SELECT
    c.customer_segment,
    COUNT(DISTINCT c.customer_id) AS customers,
    ROUND(SUM(o.quantity * p.price * (1 - o.discount)), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_segment
ORDER BY revenue DESC;
