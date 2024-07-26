SELECT T.customer_id, T.total_cost AS total_cost
FROM members P LEFT JOIN
(
	SELECT S.customer_id, SUM(M.price) AS total_cost
	FROM sales S LEFT JOIN menu M
	ON S.product_id = M.product_id 
	GROUP BY S.customer_id
) T 
ON P.customer_id = T.customer_id

UNION

SELECT T.customer_id, T.total_cost AS total_cost
FROM members P RIGHT JOIN
(
	SELECT S.customer_id, SUM(M.price) AS total_cost
	FROM sales S LEFT JOIN menu M
	ON S.product_id = M.product_id 
	GROUP BY S.customer_id
) T 
ON P.customer_id = T.customer_id

ORDER BY total_cost DESC, customer_id ASC
