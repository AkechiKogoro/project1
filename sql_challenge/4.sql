SELECT S.product_id, COUNT(*) AS cts
FROM sales S 
GROUP BY S.product_id 
ORDER BY cts DESC
LIMIT 1