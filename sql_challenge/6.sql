SELECT T.customer_id, T.product_id
FROM
(
	SELECT P.customer_id, S.product_id, DENSE_RANK() OVER(PARTITION BY P.customer_id ORDER BY S.order_date) AS rnk
	FROM members P LEFT JOIN sales S 
	ON P.customer_id = S.customer_id
	WHERE P.join_date <= S.order_date
) T 
WHERE T.rnk = 1