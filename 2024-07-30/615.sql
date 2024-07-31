# Write your MySQL query statement below
WITH dept_avg AS 
(
    SELECT B.department_id, DATE_FORMAT(pay_date, '%Y-%m') AS 'pay_month', AVG(A.amount) AS mean
    FROM Salary A LEFT JOIN Employee B 
    ON A.employee_id = B.employee_id
    GROUP BY B.department_id, pay_month
),
total_avg AS 
(
    SELECT DATE_FORMAT(pay_date, '%Y-%m') AS 'pay_month', AVG(A.amount) AS mean
    FROM Salary A LEFT JOIN Employee B 
    ON A.employee_id = B.employee_id
    GROUP BY pay_MONTH
)

SELECT A.pay_month, A.department_id, (CASE WHEN A.mean > B.mean THEN "higher" 
                                            WHEN A.mean = B.mean THEN "same" 
                                            ELSE "lower" END) AS comparison 
FROM dept_avg A INNER JOIN total_avg B 
ON A.pay_month = B.pay_month