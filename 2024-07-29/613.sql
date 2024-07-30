# Write your MySQL query statement below
SELECT MIN(ABS(C.x - C.y)) AS shortest
FROM 
(
    SELECT A.x AS x, B.x AS y 
    FROM Point A JOIN Point B 
    WHERE A.x <> B.x
) C