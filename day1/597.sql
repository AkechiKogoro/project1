# Write your MySQL query statement below
WITH
request_count AS
(
    SELECT COUNT(DISTINCT sender_id, send_to_id) AS cts 
    FROM FriendRequest
),
accept_count AS
(
    SELECT COUNT(DISTINCT requester_id, accepter_id) AS cts 
    FROM RequestAccepted
)

SELECT IFNULL(ROUND(B.cts/A.cts, 2), 0) AS accept_rate
FROM request_count A JOIN accept_count B