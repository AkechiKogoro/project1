# Write your MySQL query statement below
SELECT DISTINCT A.follower, C.cts AS num
FROM Follow A INNER JOIN (
    SELECT B.followee, COUNT(*) AS cts 
    FROM Follow B 
    GROUP BY B.followee 
    HAVING cts > 0
) C
WHERE A.follower = C.followee
ORDER BY A.follower ASC