# E-Commerce Sales Analysis using SQL

A SQL project to analyse orders, revenue, payment methods and customer purchasing patterns using PostgreSQL.

## About the Project

I used an e-commerce sample dataset with three tables: customers, products and orders. I wrote SQL queries to answer business questions such as total sales, average order value, payment performance, repeat customers and high-value orders.

## Tools Used

- PostgreSQL
- pgAdmin 4
- SQL

## Tables

- customers — customer details such as name, age, city and segment
- products — product name, category, price and cost
- orders — order date, customer and product IDs, quantity, price, discount, payment method and order status

## SQL Concepts Used

SELECT, WHERE, AND, OR, IN, BETWEEN, LIKE, DISTINCT, ORDER BY, LIMIT, COUNT, COUNT DISTINCT, SUM, AVG, MIN, MAX, GROUP BY, HAVING, subqueries, CASE WHEN, COALESCE and string functions.

String functions practised: UPPER, LOWER, LENGTH, LEFT, RIGHT, TRIM, REPLACE and CONCAT.

## Business Questions Answered

### Sales and order performance
1. How many orders, customers and products are in the dataset?
2. How many units were sold in delivered orders?
3. What is the total revenue from delivered orders?
4. What is the average delivered order value?
5. How many orders were delivered, cancelled and returned?
6. What percentage of orders were cancelled or returned?
7. Which delivered orders have the highest order value?

### Payment analysis
8. Which payment methods are used most often?
9. How much delivered revenue comes from each payment method?
10. Which payment methods have delivered revenue above ₹20,000?
11. How many units were sold through each payment method?

### Customer and order analysis
12. Which customer IDs placed more than one delivered order?
13. Which customer IDs generated the highest delivered revenue?
14. Which customers crossed the revenue threshold of ₹5,000 or ₹8,000?
15. Which delivered orders contain more than one unit?
16. Which delivered orders fall within a selected date range?

### Data handling and text cleaning
17. How can missing discount, city, customer segment or payment values be handled in query output using COALESCE?
18. How can customer names be converted to upper/lower case, measured, trimmed, shortened, replaced or combined for reporting?

## Revenue Calculation

For delivered orders, revenue is calculated as:

quantity * unit_price * (1 - discount)

Cancelled and returned orders are excluded from delivered-sales KPIs.

## Project Files

- sql/01_schema.sql — creates and inserts the sample tables
- sql/02_analysis.sql — basic exploration and business analysis
- sql/03_data_operations.sql — SQL data-operation practice
- sql/04_case_business_analysis.sql — order-value categories using CASE
- sql/05_null_coalesce_business_analysis.sql — NULL checks and COALESCE practice
- sql/06_string_business_analysis.sql — string functions and text handling

## How to Run

1. Open the project database in pgAdmin 4.
2. Run sql/01_schema.sql to create and populate the tables (only if setting up the database from scratch).
3. Run sql/02_analysis.sql for core business questions.
4. Run the remaining SQL files individually as needed.
5. Check the output grid and record the results for your analysis.

## Current Findings

The following figures are from the current sample-data analysis in this project:

- Delivered revenue: ₹81,881.10
- Average delivered order value: ₹2,924.33
- Delivered orders: 28
- Cancelled orders: 1
- Returned orders: 1
- Cancelled/returned rate: 6.67%
- Card delivered revenue: ₹47,002.05
- UPI delivered order count: 13
- Repeat purchasers: 10 customers
- Highest-revenue customer ID: 107, with ₹14,744.50
- Highest-value delivered order: 1010, at ₹6,648.10

These findings describe this sample dataset, not the performance of a real company.

## Next Steps

I will add more SQL concepts to the project after learning and practising them, then use those concepts to answer additional business questions.
