-- Cohort Analysis by Join Month
SELECT DATE_TRUNC('month', join_date) AS cohort_month, COUNT(DISTINCT customer_id) AS new_customers
FROM customers
GROUP BY cohort_month
ORDER BY cohort_month;