# Write your MySQL query statement below

SELECT DISTINCT C.title
FROM content C INNER JOIN TVProgram T 
ON C.content_id = T.content_id
WHERE C.Kids_content = 'Y' AND DATE_FORMAT(T.program_date, '%Y-%m') = '2020-06'
    AND C.content_type = 'Movies'