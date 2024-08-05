# Write your MySQL query statement below
SELECT T3.id, T3.visit_date, T3.people
FROM
(
    SELECT *, COUNT(*) OVER(PARTITION BY grp) AS cts
    FROM 
    (
        SELECT *, id - ROW_NUMBER() OVER() AS grp
        FROM
        (
            SELECT * 
            FROM Stadium
            WHERE people >= 100
        ) T1
    )T2
) T3 
WHERE cts >= 3
ORDER BY T3.visit_date