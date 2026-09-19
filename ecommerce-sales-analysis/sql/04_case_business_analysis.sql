-- E-Commerce Sales & Customer Analysis
-- Version 3: Intermediate SQL - CASE business analysis
--
-- Business problem:
-- Sales teams need a simple way to identify low, medium and high-value
-- delivered orders so high-value transactions can be reviewed separately.
--
-- Question:
-- How can delivered orders be classified by order value?
--
-- Business logic:
-- Order value = quantity * unit_price * (1 - discount)
-- CASE is used to turn the calculated value into a business category.

SELECT
    order_id,
    customer_id,
    ROUND(quantity * unit_price * (1 - discount), 2) AS order_value,
    CASE
        WHEN quantity * unit_price * (1 - discount) >= 5000 THEN 'High Value'
        WHEN quantity * unit_price * (1 - discount) >= 2500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_category
FROM orders
WHERE order_status = 'Delivered'
ORDER BY order_value DESC;

-- Business question:
-- How many delivered orders fall into each value category?

SELECT
    CASE
        WHEN quantity * unit_price * (1 - discount) >= 5000 THEN 'High Value'
        WHEN quantity * unit_price * (1 - discount) >= 2500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_category,
    COUNT(*) AS order_count
FROM orders
WHERE order_status = 'Delivered'
GROUP BY
    CASE
        WHEN quantity * unit_price * (1 - discount) >= 5000 THEN 'High Value'
        WHEN quantity * unit_price * (1 - discount) >= 2500 THEN 'Medium Value'
        ELSE 'Low Value'
    END
ORDER BY order_count DESC;

-- Business meaning:
-- This converts a raw numeric KPI into an easy-to-read business segment
-- that can support order prioritization and further analysis.
