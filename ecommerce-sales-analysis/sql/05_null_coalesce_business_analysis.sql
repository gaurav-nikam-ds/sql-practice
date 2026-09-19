-- E-Commerce Sales & Customer Analysis
-- Version 3: Intermediate SQL - NULL and COALESCE business analysis
--
-- Business problem:
-- Missing values can make business reports incomplete or difficult to read.
-- Before using a field in an analysis, we should identify missing records
-- and decide how they should be handled.
--
-- Question:
-- Are there orders with missing discount information?

SELECT
    COUNT(*) AS missing_discount_orders
FROM orders
WHERE discount IS NULL;

-- Business question:
-- How can missing discount values be treated as zero for reporting?
--
-- COALESCE returns the existing discount when it is available and 0 when
-- the discount value is NULL.

SELECT
    order_id,
    quantity,
    unit_price,
    discount,
    COALESCE(discount, 0) AS discount_for_analysis
FROM orders
ORDER BY order_id;

-- Business question:
-- What is the revenue after safely handling a missing discount value?

SELECT
    order_id,
    ROUND(
        quantity * unit_price * (1 - COALESCE(discount, 0)),
        2
    ) AS revenue_after_null_handling
FROM orders
WHERE order_status = 'Delivered'
ORDER BY revenue_after_null_handling DESC;

-- Business meaning:
-- The NULL check acts as a data-quality check, while COALESCE keeps
-- revenue calculations usable when a discount value is missing.
