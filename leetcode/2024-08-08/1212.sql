# Write your MySQL query statement below
WITH 
host_points AS 
(
    SELECT host_team AS team_id, SUM(CASE WHEN host_goals > guest_goals THEN 3
                                    WHEN host_goals = guest_goals THEN 1
                                    ELSE 0 END        
                                ) AS points
    FROM Matches
    GROUP BY host_team 
),
guest_points AS 
(
    SELECT guest_team AS team_id, SUM(CASE WHEN host_goals < guest_goals THEN 3
                                    WHEN host_goals = guest_goals THEN 1
                                    ELSE 0 END        
                                ) AS points
    FROM Matches
    GROUP BY guest_team 
),
total_points AS 
(
    SELECT A.team_id, IFNULL(A.points, 0) + IFNULL(B.points, 0) AS num_points
    FROM host_points A LEFT JOIN guest_points B 
    ON A.team_id = B.team_id 
    UNION
    SELECT B.team_id, IFNULL(A.points, 0) + IFNULL(B.points, 0) AS num_points
    FROM host_points A RIGHT JOIN guest_points B 
    ON A.team_id = B.team_id 
)

SELECT A.team_id, A.team_name, IFNULL(B.num_points, 0) AS num_points
FROM Teams A LEFT JOIN total_points B 
ON A.team_id = B.team_id
ORDER BY num_points DESC, A.team_id ASC