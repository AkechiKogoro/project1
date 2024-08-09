# Write your MySQL query statement below
SELECT ad_id, ROUND(100 *IFNULL(SUM(IF(action='Clicked', 1, 0)) / SUM(IF(action='Clicked' OR action = 'Viewed', 1, 0)), 0), 2) AS ctr
FROM Ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id ASC