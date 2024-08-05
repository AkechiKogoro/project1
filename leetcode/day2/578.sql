# Write your MySQL query statement below
SELECT question_id AS survey_log
FROM 
(
    SELECT DISTINCT question_id, SUM(CASE WHEN answer_id IS NOT NULL THEN 1 ELSE 0 END) OVER(partition by question_id) / SUM(1) OVER(partition by question_id) AS rate
    FROM Surveylog 
    ORDER BY rate DESC
    LIMIT 1
) T