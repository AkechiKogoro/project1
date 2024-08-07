# Write your MySQL query statement below
WITH 
player_score AS 
(
    SELECT A.player_id, SUM(A.score) AS total_score
    FROM 
    (
        SELECT first_player AS player_id, SUM(first_score) AS score 
        FROM Matches
        GROUP BY first_player
        UNION ALL
        SELECT second_player AS player_id, SUM(second_score) AS score 
        FROM Matches
        GROUP BY first_player
    ) A
    GROUP BY A.player_id
)

SELECT T.group_id, T.player_id
FROM
(
    SELECT P.player_id, P.group_id, S.total_score, RANK() OVER(PARTITION BY P.group_id ORDER BY S.total_score DESC, P.player_id ASC) AS rnk
    FROM Players P INNER JOIN player_score S
    ON P.player_id = S.player_id 
) T 
WHERE T.rnk = 1