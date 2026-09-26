# E-Commerce Sales & Customer Analysis using SQL

A practical SQL analytics project built while learning SQL step by step. The project uses a small e-commerce dataset to answer business questions about customers, products, orders, payments and sales performance.

## Business Problem

An e-commerce business wants to understand its customers, orders and sales performance. This project connects SQL concepts to business questions, results and business meaning.

## Current Version

**Version 4 — SQL JOINs and relational business analysis**

This version introduces INNER JOIN and LEFT JOIN, explains how the customers, products and orders tables relate, and applies joins to product, category and customer revenue questions. JOIN queries are in a separate learning file so they can be studied and run section by section.

## SQL Concepts Applied

### Analytical SQL
- SELECT / FROM
- WHERE
- AND / OR / NOT
- IN, BETWEEN, LIKE
- DISTINCT, ORDER BY, LIMIT
- COUNT / COUNT DISTINCT / SUM / AVG / MIN / MAX
- GROUP BY, HAVING
- CASE
- NULL checks using IS NULL and COALESCE()
- String functions: UPPER, LOWER, LENGTH, LEFT, RIGHT, TRIM, REPLACE, CONCAT
- INNER JOIN and LEFT JOIN
- Table aliases and join conditions using matching keys

### Database Operations Practiced Separately
- UPDATE, DELETE, ALTER TABLE, ADD / DROP COLUMN
- RENAME COLUMN, RENAME TABLE
- PostgreSQL ALTER COLUMN for data-type changes
- CHANGE / MODIFY concept and PostgreSQL equivalents
- TRUNCATE

## Business Analysis Approach

**Business Question → Required Data → SQL Concept → Query → Result → Business Meaning → Possible Action**

Examples include total delivered revenue, revenue by payment method, top products and categories by delivered revenue, customer revenue, customers without orders, order-value classification, missing-discount handling, and customer-name standardization.

## Intermediate SQL Upgrade

### CASE
Delivered orders are classified into Low, Medium and High Value categories using calculated order value.

**Business use:** Turn a numeric metric into an operational category that is easier to interpret.

### NULL + COALESCE()
The project checks for missing discount values using IS NULL and uses COALESCE(discount, 0) so revenue calculations remain usable when discount information is missing.

**Business use:** Separate data-quality checking from safe reporting logic.

### String Functions
Customer names are transformed with UPPER() and LOWER(), checked with LENGTH(), shortened with LEFT() and RIGHT(), cleaned with TRIM(), modified with REPLACE(), and combined with CONCAT().

**Business use:** Prepare text fields for cleaner reports and basic data-quality checks.

### JOINs
- INNER JOIN returns records with matching keys in both tables.
- LEFT JOIN keeps all records from the left table and adds matching rows from the right table; unmatched right-side columns are NULL.
- orders.customer_id connects to customers.customer_id.
- orders.product_id connects to products.product_id.

The JOIN learning file demonstrates two-table and three-table joins, top products by revenue, revenue by category, revenue by customer, and customers without orders.

**Business use:** Combine transactional data with customer and product descriptions to produce meaningful business reports.

## Key Findings

Using the current sample data from the project's existing analysis:

- Delivered revenue: **₹81,881.10**
- Average delivered order value: **₹2,924.33**
- Delivered orders: **28**
- Cancelled orders: **1**
- Returned orders: **1**
- Cancelled/returned rate: **6.67%**
- Highest-delivered-revenue payment method: **Card — ₹47,002.05**
- Highest delivered-order count payment method: **UPI — 13 orders**
- Repeat purchasers: **10 customers**
- Highest-revenue customer ID: **107 — ₹14,744.50**
- Highest-value delivered order: **1010 — ₹6,648.10**

## Database

The project contains three tables: customers (customer information), products (product catalog and pricing), and orders (order transactions).

## Project Structure

    ecommerce-sales-analysis/
    ├── README.md
    ├── sql/
    │   ├── 01_schema.sql
    │   ├── 02_analysis.sql
    │   ├── 03_data_operations.sql
    │   ├── 04_case_business_analysis.sql
    │   ├── 05_null_coalesce_business_analysis.sql
    │   ├── 06_string_business_analysis.sql
    │   └── 07_joins_learning_and_business_analysis.sql
    └── insights/
        ├── business_questions.md
        └── business_insights.md

## How to Run in PostgreSQL / pgAdmin 4

1. Create or open a PostgreSQL database.
2. Open Query Tool for the database.
3. Run sql/01_schema.sql to create and populate the dataset.
4. Run sql/02_analysis.sql for the core business analysis.
5. Run sql/03_data_operations.sql separately for data-operation practice.
6. Run sql/04_case_business_analysis.sql for order-value classification.
7. Run sql/05_null_coalesce_business_analysis.sql for missing-value handling.
8. Run sql/06_string_business_analysis.sql for customer-name text analysis.
9. Run sql/07_joins_learning_and_business_analysis.sql section by section for JOIN learning and business analysis.
10. Review the results in the output grid.

## Learning Progression

**Learn → Practice → Apply to business question → Understand result → Add business insight → Upgrade project**

The project is intentionally upgraded with concepts as they are learned and practiced, rather than adding advanced SQL only to make the project look complex.

## Note

This is a portfolio learning project. The goal is to build strong SQL fundamentals and gradually turn them into practical Data Analyst skills.
