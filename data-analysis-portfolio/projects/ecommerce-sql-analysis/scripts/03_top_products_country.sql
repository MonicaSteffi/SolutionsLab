-- Top Products per Country
SELECT c.country, p.product_name, SUM(o.quantity) AS total_sold
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.country, p.product_name
ORDER BY c.country, total_sold DESC;