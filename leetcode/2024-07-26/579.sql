# Write your MySQL query statement below
SELECT F.id, F.month, F.S1 + F.S2 + F.S3 AS salary
FROM
(
    SELECT A.id, A.month, A.salary AS S1, IFNULL(B.salary, 0) AS S2, IFNULL(C.salary, 0) AS S3
    FROM
    (
        SELECT E.id, E.month, E.salary
        FROM Employee E
        WHERE E.month < (
            SELECT MAX(T.month) 
            FROM Employee T
            WHERE T.id = E.id 
        )
    ) AS A
    LEFT JOIN Employee B 
    ON B.id = A.id AND B.month = A.month - 1
    LEFT JOIN Employee C 
    ON C.id = A.id AND C.month = A.month - 2
) AS F 
ORDER BY id ASC, month DESC
