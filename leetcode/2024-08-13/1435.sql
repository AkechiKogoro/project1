# Write your MySQL query statement below
SELECT "[0-5>" AS bin, COUNT(*) AS total
FROM Sessions
WHERE duration >= 0 * 60 and duration < 5 * 60

UNION

SELECT "[5-10>" AS bin, COUNT(*) AS total
FROM Sessions
WHERE duration >= 5 * 60 and duration < 10 * 60

UNION

SELECT "[10-15>" AS bin, COUNT(*) AS total
FROM Sessions
WHERE duration >= 10 * 60 and duration < 15 * 60

UNION

SELECT "15 or more" AS bin, COUNT(*) AS total
FROM Sessions
WHERE duration >= 15 * 60