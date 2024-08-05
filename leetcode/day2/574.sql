# Write your MySQL query statement below
SELECT T.name AS name 
FROM 
(
    SELECT C.name, C.id
    FROM Candidate C left join Vote V 
    on C.id = V.candidateId 
    GROUP BY C.id 
    ORDER BY COUNT(*) DESC
    LIMIT 1
) T