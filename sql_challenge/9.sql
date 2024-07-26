SELECT DISTINCT P.customer_id, SUM(CASE WHEN M.product_name = "sushi" then 20 ELSE 10 END) OVER(PARTITION BY P.customer_id) AS points
FROM members P LEFT JOIN sales S 
ON P.customer_id = S.customer_id 
LEFT JOIN menu M 
ON M.product_id = S.product_id