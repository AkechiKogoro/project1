# Write your MySQL query statement below
SELECT IFNULL(ROUND(AVG(cts), 2), 0) AS average_sessions_per_user
FROM
(
    SELECT user_id, COUNT(DISTINCT session_id) AS cts 
    FROM Activity
    WHERE activity_date BETWEEN DATE_ADD('2019-07-27', INTERVAL -29 DAY) AND '2019-07-27'
    GROUP BY user_id
) T