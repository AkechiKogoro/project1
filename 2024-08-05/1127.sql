# Write your MySQL query statement below
WITH existent AS
(
SELECT C.spend_date, C.platform, SUM(C.amount) AS total_amount, COUNT(C.user_id) AS total_users
FROM (
    SELECT A.user_id, A.spend_date, A.platform, A.amount
    FROM Spending A LEFT JOIN Spending B 
    ON A.user_id = B.user_id AND A.spend_date = B.spend_date AND A.platform <> B.platform
    WHERE B.user_id IS NULL
    
) C 
GROUP BY C.spend_date, C.platform
UNION
SELECT D.spend_date, D.platform, SUM(D.amount1+D.amount2) AS total_amount, COUNT(D.user_id) AS total_users 
FROM (
    SELECT A.user_id, A.spend_date, 'both' AS platform, A.amount AS amount1, B.amount AS amount2
    FROM Spending A INNER JOIN Spending B 
    ON A.user_id = B.user_id AND A.spend_date = B.spend_date AND A.platform = 'mobile' AND  B.platform = 'desktop'
) D
GROUP BY D.spend_date, D.platform
),
final AS 
(
SELECT * FROM existent
UNION
SELECT A.spend_date, 'both' AS platform, 0 AS total_amount, 0 AS total_users 
FROM Spending A 
WHERE A.spend_date NOT IN (
    SELECT spend_date FROM existent
    WHERE platform = 'both'
) 
UNION
SELECT A.spend_date, 'mobile' AS platform, 0 AS total_amount, 0 AS total_users 
FROM Spending A 
WHERE A.spend_date NOT IN (
    SELECT spend_date FROM existent
    WHERE platform = 'mobile'
) 
UNION
SELECT A.spend_date, 'desktop' AS platform, 0 AS total_amount, 0 AS total_users 
FROM Spending A 
WHERE A.spend_date NOT IN (
    SELECT spend_date FROM existent
    WHERE platform = 'desktop'
) 
)

SELECT * FROM final
