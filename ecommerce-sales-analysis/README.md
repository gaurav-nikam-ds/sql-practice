# E-Commerce Sales & Customer Analysis using SQL

A practical SQL analytics project built while learning SQL step by step. The project uses a small e-commerce dataset to answer business questions about customers, products, orders, payments and sales performance.

## Business Problem

An e-commerce business wants to understand its customers, orders and sales performance. Instead of writing isolated SQL exercises, this project connects SQL concepts to business questions, results and business meaning.

## Current Version

**Version 2 — Business-focused SQL analysis**

This version includes the SQL concepts learned so far and applies the analytical concepts to practical business questions.

## SQL Concepts Applied

### Analytical SQL
- SELECT / FROM
- WHERE
- AND / OR / NOT
- IN
- BETWEEN
- LIKE
- DISTINCT
- ORDER BY
- LIMIT
- COUNT / COUNT DISTINCT
- SUM / AVG / MIN / MAX
- GROUP BY
- HAVING
- Basic subqueries

### Database Operations Practiced Separately
- UPDATE
- DELETE
- ALTER TABLE
- ADD / DROP COLUMN
- RENAME COLUMN
- RENAME TABLE
- PostgreSQL ALTER COLUMN for data-type changes
- CHANGE / MODIFY concept and PostgreSQL equivalents
- TRUNCATE

## Business Analysis Approach

The project follows:

**Business Question → Required Data → SQL Concept → Query → Result → Business Meaning → Possible Action**

Examples include:
- What is total delivered revenue?
- What is the average delivered order value?
- Which payment method is used most often?
- Which payment method generates the most revenue?
- Which customers are repeat purchasers?
- Which customers generated more than a defined revenue threshold?
- What is the highest-value delivered order?
- What percentage of orders were cancelled or returned?

## Key Findings

Using the current sample data:

- Delivered revenue: **₹81,881.10**
- Average delivered order value: **₹2,924.33**
- Delivered orders: **28**
- Cancelled orders: **1**
- Returned orders: **1**
- Cancelled/returned rate: **6.67%**
- Highest delivered-revenue payment method: **Card — ₹47,002.05**
- Highest delivered-order count payment method: **UPI — 13 orders**
- Repeat purchasers: **10 customers**
- Highest-revenue customer ID: **107 — ₹14,744.50**
- Highest-value delivered order: **1010 — ₹6,648.10**

## Database

The project contains three tables:

- `customers` — customer information
- `products` — product catalog and pricing
- `orders` — order transactions

## Project Structure

```text
ecommerce-sales-analysis/
├── README.md
├── sql/
│   ├── 01_schema.sql
│   ├── 02_analysis.sql
│   └── 03_data_operations.sql
└── insights/
    ├── business_questions.md
    └── business_insights.md
```

## How to Run in PostgreSQL / pgAdmin 4

1. Create or open a PostgreSQL database.
2. Open **Query Tool** for the database.
3. Run `sql/01_schema.sql` to create and populate the dataset.
4. Run `sql/02_analysis.sql` for the business analysis.
5. Review the results in the output grid.
6. `sql/03_data_operations.sql` is a separate learning file using a practice table so the main e-commerce analysis data is not destroyed.

## Learning Progression

**Learn → Practice → Apply to business question → Understand result → Add business insight → Upgrade project**

Future versions will add new SQL concepts only after they are learned and understood. JOIN-based customer/product/category analysis will be added in a later version.

## Note

This is a portfolio learning project. The goal is to build strong SQL fundamentals and gradually turn them into practical Data Analyst skills without adding advanced SQL just to make the project look complex.
