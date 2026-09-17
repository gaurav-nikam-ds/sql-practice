# E-Commerce Sales & Customer Analysis using SQL

A practical SQL analytics project built while learning SQL step by step. The project uses a small e-commerce dataset to answer business questions about customers, products, orders, and sales.

## Business Problem

An e-commerce business wants to understand its customers, products, orders, and basic sales performance. The analysis starts with foundational SQL and will be expanded as new SQL concepts are learned.

## Current Version

**Version 1 — Current SQL learning level**

This version intentionally uses only concepts learned so far. More advanced SQL will be added later as part of the learning progression.

## Current SQL Concepts

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
- Basic subqueries

## Database

The project contains three tables:

- `customers` — customer information
- `products` — product catalog and pricing
- `orders` — order transactions

The Version 1 analysis is deliberately written without JOIN, GROUP BY, HAVING, CASE, or other concepts that have not been learned yet.

## Business Questions

The current analysis answers questions such as:

1. How many customers, products, and orders are there?
2. Which customers are from Pune or Nashik?
3. Which customers fall within a particular age range?
4. How many premium customers are there?
5. What cities are represented in the customer base?
6. Which are the latest orders?
7. What is the average product price?
8. What are the minimum and maximum product prices?
9. What is the total revenue from delivered orders?
10. What is the highest-value delivered order?
11. Which orders were placed during a selected date range?
12. Which orders used UPI or Card?
13. Which orders were cancelled or returned?
14. Which orders contain more than one item?

## Project Structure

```text
ecommerce-sales-analysis/
├── README.md
├── sql/
│   ├── 01_schema.sql
│   └── 02_analysis.sql
└── insights/
    └── business_insights.md
```

## How to Run

1. Create a PostgreSQL database.
2. Run `sql/01_schema.sql`.
3. Run the queries in `sql/02_analysis.sql` one by one.
4. Check the results and write down the business meaning of each result.

## Learning Approach

This project is intentionally developed in versions:

`Learn SQL → Practice → Add the new concept → Analyze a business question → Understand the result → Upgrade the project`

When a new SQL concept is learned, it will be added in a future version instead of adding advanced SQL before it is understood.

## Note

This is a portfolio learning project. The goal is not to make the SQL look artificially advanced; the goal is to build strong SQL fundamentals and gradually turn them into practical Data Analyst skills.
