WITH
First AS
(
    SELECT player_id, MIN(event_date) AS 'install_dt'
    FROM Activity
    GROUP BY player_id
),
Summary AS
(
    SELECT A.player_id, A.event_date, B.install_dt
    FROM Activity A RIGHT JOIN First B 
    ON A.player_id = B.player_id AND A.event_date = DATE_ADD(B.install_dt, INTERVAL 1 DAY)
)

SELECT install_dt, COUNT(install_dt) AS 'installs', ROUND(COUNT(player_id) / COUNT(install_dt), 2) AS 'Day1_retention'
FROM Summary 
GROUP BY  install_dt
