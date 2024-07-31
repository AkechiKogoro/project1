# Write your MySQL query statement below
WITH cnt AS 
(
SELECT S.seller_id, SUM(price) AS total_price
FROM Sales S 
GROUP BY S.seller_id 
)

SELECT seller_id 
FROM cnt 
WHERE total_price = (
    SELECT MAX(total_price)
    FROM cnt
)