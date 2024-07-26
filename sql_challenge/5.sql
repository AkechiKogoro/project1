SELECT R.customer_id, R.product_id
FROM
(
	SELECT T.customer_id, T.product_id, DENSE_RANK() OVER(PARTITION BY T.customer_id ORDER BY T.cts DESC) AS rnk
	FROM
	(
		SELECT S.customer_id, S.product_id, COUNT(*) AS cts
		FROM sales S 
		GROUP BY S.customer_id, S.product_id
	) T
) R
WHERE R.rnk = 1