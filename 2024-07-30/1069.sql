# Write your MySQL query statement below
SELECT A.product_id, SUM(A.quantity) AS 'total_quantity'
FROM Sales A 
GROUP BY A.product_id