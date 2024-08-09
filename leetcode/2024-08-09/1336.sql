# Write your MySQL query statement below
WITH RECURSIVE
user_count AS 
(
SELECT user_id, transaction_date, COUNT(*) AS transactions_count
FROM Transactions
GROUP BY user_id, transaction_date
),
rec AS 
(
    SELECT 0 AS value, MAX(transactions_count) AS max_value
    FROM user_count
    UNION ALL
    SELECT value + 1, max_value FROM rec 
    WHERE value < max_value
)
SELECT R.value AS transactions_count, IFNULL(COUNT(B.user_id), 0) AS visits_count 
FROM rec R LEFT JOIN (
    SELECT V.user_id, V.visit_date, IFNULL(COUNT(T.transaction_date), 0) AS transactions_count
    FROM Visits V LEFT JOIN Transactions T 
    ON V.user_id = T.user_id AND V.visit_date = T.transaction_date
    GROUP BY V.user_id, V.visit_date
) B 
ON R.value = B.transactions_count
GROUP BY R.value

