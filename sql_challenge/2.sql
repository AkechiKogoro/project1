SELECT S.customer_id, COUNT(DISTINCT S.order_date) AS days
FROM sales S LEFT JOIN menu M
ON S.product_id = M.product_id 
GROUP BY S.customer_id
ORDER BY days DESC, customer_id ASC
