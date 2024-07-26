SELECT T.customer_id, T.days AS days
FROM members P LEFT JOIN
(
	SELECT S.customer_id, COUNT(DISTINCT S.order_date) AS days
	FROM sales S LEFT JOIN menu M
	ON S.product_id = M.product_id 
	GROUP BY S.customer_id
) T 
ON P.customer_id = T.customer_id

UNION

SELECT T.customer_id, T.days AS days
FROM members P RIGHT JOIN
(
	SELECT S.customer_id, COUNT(DISTINCT S.order_date) AS days
	FROM sales S LEFT JOIN menu M
	ON S.product_id = M.product_id 
	GROUP BY S.customer_id
) T 
ON P.customer_id = T.customer_id

ORDER BY days DESC, customer_id ASC
