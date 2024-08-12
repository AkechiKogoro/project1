# Write your MySQL query statement below
WITH counts AS
(
SELECT F.activity, COUNT(F.id) AS cts
FROM Friends F
GROUP BY F.activity
)

SELECT C.activity 
FROM counts C
WHERE C.cts > (SELECT MIN(cts) FROM counts) 
        AND C.cts < (SELECT MAX(cts) FROM counts)