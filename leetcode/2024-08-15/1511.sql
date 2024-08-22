# Write your MySQL query statement below
SELECT customer_id, name 
FROM 
(
    SELECT C.customer_id, C.name, SUM(CASE WHEN DATE_FORMAT(O.order_date, "%Y-%m") = '2020-06' THEN O.quantity * P.price ELSE 0 END)  AS june, SUM(CASE WHEN DATE_FORMAT(O.order_date, "%Y-%m") = '2020-07' THEN O.quantity * P.price ELSE 0 END) AS july 
    FROM Customers C LEFT JOIN Orders O 
    ON C.customer_id = O.customer_id AND (DATE_FORMAT(O.order_date, "%Y-%m") = '2020-06' OR DATE_FORMAT(O.order_date, "%Y-%m") = '2020-07')
    LEFT JOIN Product P 
    ON P.product_id = O.product_id
    GROUP BY C.customer_id
    HAVING june >= 100 AND july >= 100
) T

