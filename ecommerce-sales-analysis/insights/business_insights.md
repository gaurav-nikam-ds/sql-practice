# Business Insights

## Analysis Summary

The project currently focuses on order, revenue, payment and repeat-customer analysis using the SQL concepts learned so far.

### 1. Delivered Revenue

- **Finding:** Delivered orders generated approximately **₹81,881.10** in revenue.
- **Business logic:** Revenue is calculated as quantity × unit price × (1 − discount), using delivered orders only.
- **Business meaning:** This provides the current sales baseline for the dataset.
- **Possible action:** Use delivered revenue as a baseline KPI when comparing future project versions.

### 2. Average Delivered Order Value

- **Finding:** The average delivered order value is approximately **₹2,924.33**.
- **Business logic:** Average the calculated order value for delivered orders.
- **Business meaning:** This provides a simple view of the typical delivered transaction size.
- **Possible action:** Track this KPI alongside order volume in future analysis.

### 3. Order Status

- **Finding:** There are **28 delivered orders**, **1 cancelled order** and **1 returned order**.
- **Business logic:** Group orders by order_status.
- **Business meaning:** Most records in this sample are delivered, while cancellation and return records can be separately monitored.
- **Possible action:** Investigate cancelled and returned orders in a deeper operational analysis.

### 4. Cancelled / Returned Rate

- **Finding:** Cancelled or returned orders represent approximately **6.67%** of all orders.
- **Business logic:** Count cancelled and returned orders and compare them with total orders.
- **Business meaning:** This gives a simple unsuccessful-order rate for the sample.
- **Possible action:** Track this rate over time and investigate the reasons behind unsuccessful orders.

### 5. Payment Method Usage

- **Finding:** Among delivered orders, UPI has **13 orders**, Card has **12**, and Cash has **3**.
- **Business logic:** Group delivered orders by payment_method and count orders.
- **Business meaning:** UPI has the highest transaction count in this sample.
- **Possible action:** Monitor payment-method usage separately from revenue contribution.

### 6. Payment Method Revenue

- **Finding:** Card generated approximately **₹47,002.05**, UPI generated **₹28,573.85**, and Cash generated **₹6,305.20** in delivered revenue.
- **Business logic:** Group delivered orders by payment_method and sum calculated revenue.
- **Business meaning:** The payment method with the highest number of transactions is not necessarily the one with the highest revenue.
- **Possible action:** Track both transaction volume and revenue contribution when evaluating payment methods.

### 7. Repeat Purchasers

- **Finding:** **10 customers** placed more than one delivered order.
- **Business logic:** Group delivered orders by customer_id and use HAVING COUNT(*) > 1.
- **Business meaning:** The sample contains a meaningful group of repeat purchasers.
- **Possible action:** A future analysis can investigate what products, segments or locations are associated with repeat purchasing.

### 8. Highest-Revenue Customer ID

- **Finding:** Customer **107** generated approximately **₹14,744.50**, the highest delivered revenue among customers in this dataset.
- **Business logic:** Group delivered orders by customer_id, calculate revenue and sort descending.
- **Business meaning:** A small number of customers may contribute a significant amount of revenue.
- **Possible action:** Analyze high-value customer behavior further after JOINs are learned.

### 9. Highest-Value Delivered Order

- **Finding:** Order **1010** has the highest delivered order value at approximately **₹6,648.10**.
- **Business logic:** Calculate order value and use a basic subquery to identify the maximum.
- **Business meaning:** This identifies the largest individual transaction in the current sample.
- **Possible action:** Examine the product and customer characteristics behind high-value orders in the next project version.

## Important Scope Note

The current version intentionally does not use JOINs or CASE WHEN because those concepts have not been learned yet. The project will be expanded progressively as new SQL concepts are learned.
