SELECT DISTINCT P.customer_id, COUNT(*) OVER(PARTITION BY P.customer_id) AS counts, SUM(M.price) OVER(PARTITION BY P.customer_id) AS money
FROM members P LEFT JOIN sales S 
ON P.customer_id = S.customer_id
LEFT JOIN menu M
ON S.product_id = M.product_id
WHERE P.join_date > S.order_date
