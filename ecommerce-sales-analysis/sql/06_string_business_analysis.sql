-- E-Commerce Sales & Customer Analysis
-- Version 3: Intermediate SQL - String function business analysis
--
-- Business problem:
-- Customer names are text fields. Standardizing text can make reports
-- easier to read and help with basic data-quality checks.
--
-- Question:
-- How can customer names be standardized for reporting?

SELECT
    customer_name,
    UPPER(customer_name) AS customer_name_upper,
    LOWER(customer_name) AS customer_name_lower
FROM customers
ORDER BY customer_name;

-- Business question:
-- Which customer names are longer than 12 characters?
--
-- This can help identify unusually long text values before displaying
-- names in reports or dashboards.

SELECT
    customer_name,
    LENGTH(customer_name) AS name_length
FROM customers
WHERE LENGTH(customer_name) > 12
ORDER BY name_length DESC, customer_name;

-- Business question:
-- How can customer names be displayed with only the first few characters
-- when a compact report is required?

SELECT
    customer_name,
    LEFT(customer_name, 5) AS name_prefix
FROM customers
ORDER BY customer_name;

-- Business meaning:
-- String functions can be used for text standardization, data-quality
-- checks and preparing fields for cleaner reporting.
