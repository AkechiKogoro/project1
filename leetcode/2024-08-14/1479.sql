# Write your MySQL query statement below
WITH summary AS
(
    SELECT DISTINCT I.item_category, DATEDIFF(O.order_date, '2020-05-31') % 7 AS days, SUM(quantity) AS total
    FROM Orders O LEFT JOIN Items I 
    ON O.item_id = I.item_id
    GROUP BY days, I.item_category 
)

SELECT DISTINCT I.item_category AS CATEGORY, IFNULL(S1.total, 0) AS MONDAY, IFNULL(S2.total, 0) AS TUESDAY, IFNULL(S3.total, 0) AS WEDNESDAY,
    IFNULL(S4.total, 0) AS THURSDAY, IFNULL(S5.total, 0) AS FRIDAY, IFNULL(S6.total, 0) AS SATURDAY, IFNULL(S7.total, 0) AS SUNDAY
FROM Items I LEFT JOIN summary S1 
ON I.item_category = S1.item_category AND S1.days = 1
LEFT JOIN summary S2 
ON I.item_category = S2.item_category AND S2.days = 2
LEFT JOIN summary S3 
ON I.item_category = S3.item_category AND S3.days = 3 
LEFT JOIN summary S4 
ON I.item_category = S4.item_category AND S4.days = 4
LEFT JOIN summary S5 
ON I.item_category = S5.item_category AND S5.days = 5
LEFT JOIN summary S6
ON I.item_category = S6.item_category AND S6.days = 6
LEFT JOIN summary S7 
ON I.item_category = S7.item_category AND S7.days = 0
ORDER BY I.item_category
