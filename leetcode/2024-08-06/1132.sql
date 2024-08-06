SELECT ROUND(AVG(rate)*100, 2) AS average_daily_percent
FROM
(
    SELECT B.action_date, COUNT(B.remove_date) / COUNT(B.action_date) AS rate
    FROM 
    (
        SELECT A.post_id, A.action_date AS action_date, R.remove_date
        FROM Actions A LEFT JOIN Removals R 
        ON A.post_id = R.post_id 
        WHERE A.action = 'report' AND A.extra = 'spam'
        GROUP BY A.post_id, A.action_date
    ) B
    GROUP BY B.action_date
) T