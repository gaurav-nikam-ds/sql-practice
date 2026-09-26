# Business Insights

## Project Summary

I used PostgreSQL to explore a sample e-commerce dataset and answer business questions about delivered sales, order status, payment methods and repeat customers.

**Dataset size:** 30 orders  
**Revenue formula:** quantity × unit_price × (1 − discount)  
**Revenue scope:** Delivered orders only. Cancelled and returned orders are excluded from delivered-sales KPIs.

## 1. Delivered Sales Revenue

- **Business question:** How much revenue did delivered orders generate?
- **Result:** ₹81,881.10
- **Insight:** The 28 delivered orders generated ₹81,881.10 after discounts.
- **Business use:** This is the baseline delivered-revenue KPI for this sample dataset.

## 2. Average Delivered Order Value

- **Business question:** What was the average value of a delivered order?
- **Result:** ₹2,924.33
- **Insight:** On average, each delivered order was worth ₹2,924.33 after discounts.
- **Business use:** Track average order value alongside the number of delivered orders to understand changes in sales performance.

## 3. Order Status

- **Business question:** How were orders distributed by status?
- **Result:** 28 Delivered, 1 Cancelled and 1 Returned, out of 30 orders.
- **Insight:** 93.33% of orders were delivered; one order was cancelled and one was returned.
- **Business use:** Monitor order status counts to identify whether cancellations or returns increase as more data is collected.

## 4. Cancelled and Returned Order Rate

- **Business question:** What percentage of all orders were cancelled or returned?
- **Result:** 6.67% (2 out of 30 orders).
- **Insight:** Two records were not delivered: one cancellation and one return.
- **Business use:** Track this rate over a larger period and investigate the reasons behind each unsuccessful order. The sample is too small to generalize to a real business.

## 5. Payment Method Usage

- **Business question:** Which payment methods were used for delivered orders?
- **Result:** UPI — 13 orders; Card — 12 orders; Cash — 3 orders.
- **Insight:** UPI had the highest delivered-order count in this dataset, followed by Card and Cash.
- **Business use:** Compare payment-method order counts over time. Order count alone does not show profitability or customer preference for a wider population.

## 6. Delivered Revenue by Payment Method

- **Business question:** How much delivered revenue came from each payment method?
- **Result:**
  - Card: ₹47,002.05
  - UPI: ₹28,573.85
  - Cash: ₹6,305.20
- **Insight:** Card contributed the largest delivered revenue in this sample, while UPI had the highest delivered-order count.
- **Business use:** Review both revenue and order count instead of relying on only one metric.

## 7. Repeat Purchasers

- **Business question:** How many customer IDs had more than one delivered order?
- **Result:** 10 customer IDs.
- **Insight:** Ten customers in the sample made repeat delivered purchases.
- **Business use:** With more data, compare repeat purchasing across customer segments, locations or product categories. Those comparisons are outside this version's no-JOIN scope.

## 8. Highest-Revenue Customer

- **Business question:** Which customer ID generated the highest delivered revenue?
- **Result:** Customer ID 107 — ₹14,744.50.
- **Insight:** Customer ID 107 had the highest total delivered revenue among customer IDs in this sample.
- **Business use:** Use this as a starting point for further customer-level analysis; the ID alone does not explain why the customer spent more.

## 9. Highest-Value Delivered Order

- **Business question:** Which delivered order had the highest calculated order value?
- **Result:** Order ID 1010 — ₹6,648.10.
- **Insight:** Order 1010 was the largest delivered transaction in the sample, after discount.
- **Business use:** A future analysis could examine its product and customer details once table relationships and JOINs are learned.

## Limitations

- This is a small sample dataset of 30 orders, not a representative dataset of a real e-commerce company.
- Findings describe only the records included in this project.
- Customer-level analysis uses customer IDs from the orders table.
- This version does not use JOINs, so it does not connect order transactions to customer names or product categories.
- Revenue is calculated from the provided quantity, unit price and discount fields; it should not be interpreted as profit because other costs are not included.

