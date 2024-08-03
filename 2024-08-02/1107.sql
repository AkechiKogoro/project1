# Write your MySQL query statement below
# Write your MySQL query statement below
WITH
first_login AS
(
    SELECT T.user_id, MIN(activity_date) AS first_date
    FROM Traffic T 
    WHERE T.activity = 'login'
    GROUP BY T.user_id
) 

SELECT T.activity_date AS login_date, COUNT(DISTINCT T.user_id) AS user_count
FROM Traffic T INNER JOIN first_login F
ON T.activity_date = F.first_date AND T.user_id = F.user_id
WHERE T.activity_date >= DATE_ADD('2019-06-30', INTERVAL -90 DAY)
GROUP BY T.activity_date