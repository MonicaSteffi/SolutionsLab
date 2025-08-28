-- Customer Lifetime Value
SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS customer_name,
SUM(o.quantity * p.price) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_id, customer_name
ORDER BY lifetime_value DESC;