SELECT S.customer_id, SUM(M.price) AS total_cost
FROM sales S LEFT JOIN menu M
ON S.product_id = M.product_id 
GROUP BY S.customer_id
ORDER BY total_cost DESC, customer_id ASC
