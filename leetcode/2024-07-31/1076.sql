WITH cnt AS 
(
SELECT DISTINCT P.project_id, COUNT(*) AS cts 
FROM Project P 
GROUP BY P.project_id
)

SELECT C.project_id 
FROM cnt C 
WHERE C.cts = (
    SELECT MAX(T.cts)
    FROM cnt T
)