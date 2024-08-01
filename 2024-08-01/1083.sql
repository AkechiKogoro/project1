# Write your MySQL query statement below

SELECT DISTINCT T.buyer_id 
FROM Product P LEFT JOIN Sales T 
ON P.product_id = T.product_id 
WHERE P.product_name = "S8" AND T.buyer_id NOT IN (
                            SELECT T.buyer_id 
                            FROM Product P LEFT JOIN Sales T 
                            ON P.product_id = T.product_id 
                            WHERE P.product_name = "iPhone"
        )