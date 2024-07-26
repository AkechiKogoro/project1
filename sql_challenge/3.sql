SELECT customer_id, product_id
FROM
(
	SELECT S.customer_id,S.product_id, DENSE_RANK() OVER(PARTITION BY S.customer_id ORDER BY S.order_date) AS rnk
	FROM sales S
) T
WHERE t.rnk = 1