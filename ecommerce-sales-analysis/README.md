# E-Commerce Sales & Customer Analysis using SQL

A beginner-friendly SQL analytics project built around a small e-commerce dataset. The goal is to answer practical business questions about customers, products, orders, revenue, and order performance.

## Business Problem

An e-commerce business wants to understand which customers and products contribute most to sales, which locations perform well, and how orders are distributed across payment methods and statuses.

## Objectives

- Understand overall sales performance
- Identify high-value customers
- Find best-performing products and categories
- Compare sales across cities
- Analyze payment methods and order status
- Practice writing business-focused SQL queries

## Database

The project uses three related tables:

- `customers` — customer information
- `products` — product and pricing information
- `orders` — order-level sales transactions

Relationship:

`customers (1) -> orders (many)`

`products (1) -> orders (many)`

## SQL Concepts Used

- SELECT / FROM
- WHERE
- AND / OR / NOT
- IN
- BETWEEN
- LIKE
- DISTINCT
- ORDER BY
- LIMIT
- COUNT / SUM / AVG / MIN / MAX
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- CASE

The queries are intentionally kept at a beginner-to-intermediate level so that each result can be explained during an interview.

## Project Structure

```text
ecommerce-sales-analysis/
├── README.md
├── data/
│   ├── customers.csv
│   ├── products.csv
│   └── orders.csv
├── sql/
│   ├── 01_schema.sql
│   └── 02_analysis.sql
└── insights/
    └── business_insights.md
```

## How to Run

1. Create a PostgreSQL database.
2. Run `sql/01_schema.sql` to create the tables.
3. Import the three CSV files into the matching tables.
4. Run `sql/02_analysis.sql`.
5. Review the query results and business insights.

## Note

This is a portfolio practice project focused on SQL-based business analysis. The dataset is intentionally small so the logic is easy to inspect and explain.
