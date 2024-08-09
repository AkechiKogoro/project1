# Write your MySQL query statement below
WITH
approved AS
(
    SELECT DATE_FORMAT(T.trans_date, "%Y-%m") AS month, T.country, COUNT(DISTINCT T.id) as approved_count, SUM(T.amount) AS approved_amount
    FROM Transactions T
    WHERE T.state = 'approved'
    GROUP BY DATE_FORMAT(T.trans_date, "%Y-%m"), T.country
),
refund AS
(
    SELECT DATE_FORMAT(C.trans_date, "%Y-%m") AS month, T.country, COUNT(C.trans_id) AS chargeback_count, SUM(T.amount) AS chargeback_amount
    FROM Chargebacks C LEFT JOIN Transactions T 
    ON C.trans_id = T.id 
    -- WHERE T.state = 'approved'
    GROUP BY DATE_FORMAT(C.trans_date, "%Y-%m"), T.country
)

SELECT A.month, A.country, A.approved_count, A.approved_amount, IFNULL(R.chargeback_count, 0) AS chargeback_count, IFNULL(R.chargeback_amount, 0) chargeback_amount 
FROM approved A LEFT JOIN refund R 
ON A.month = R.month AND A.country = R.country
UNION
SELECT R.month, R.country, IFNULL(A.approved_count, 0) AS approved_count, IFNULL(A.approved_amount, 0) AS approved_amount, IFNULL(R.chargeback_count, 0) AS chargeback_count, IFNULL(R.chargeback_amount, 0) chargeback_amount 
FROM refund R LEFT JOIN approved A 
ON A.month = R.month AND A.country = R.country