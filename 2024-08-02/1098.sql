# Write your MySQL query statement below
SELECT B.book_id, B.name #, C.total
FROM Books B LEFT JOIN (
    SELECT O.book_id, SUM(O.quantity) AS total
    FROM Orders O 
    WHERE O.dispatch_date BETWEEN DATE_ADD('2019-06-23', INTERVAL -1 YEAR) AND '2019-06-23'
    GROUP BY O.book_id
) C
On C.book_id = B.book_id  
WHERE B.available_from < DATE_ADD('2019-06-23', INTERVAL -1 MONTH) AND (C.total < 10 OR C.total IS NULL)