1. What is the total amount each customer spent at the restaurant?
```
SELECT S.customer_id, SUM(M.price) AS total_cost
FROM sales S LEFT JOIN menu M
ON S.product_id = M.product_id 
GROUP BY S.customer_id
ORDER BY total_cost DESC, customer_id ASC
```

2. How many days has each customer visited the restaurant?
```
SELECT S.customer_id, COUNT(DISTINCT S.order_date) AS days
FROM sales S LEFT JOIN menu M
ON S.product_id = M.product_id 
GROUP BY S.customer_id
ORDER BY days DESC, customer_id ASC
```

3. What was the first item from the menu purchased by each customer?
```
SELECT customer_id, product_id
FROM
(
	SELECT S.customer_id,S.product_id, DENSE_RANK() OVER(PARTITION BY S.customer_id ORDER BY S.order_date) AS rnk
	FROM sales S
) T
WHERE t.rnk = 1
```

4. What is the most purchased item on the menu and how many times was it purchased by all customers?
```
SELECT S.product_id, COUNT(*) AS cts
FROM sales S 
GROUP BY S.product_id 
ORDER BY cts DESC
LIMIT 1
```

5. Which item was the most popular for each customer?
```
SELECT R.customer_id, R.product_id
FROM
(
	SELECT T.customer_id, T.product_id, DENSE_RANK() OVER(PARTITION BY T.customer_id ORDER BY T.cts DESC) AS rnk
	FROM
	(
		SELECT S.customer_id, S.product_id, COUNT(*) AS cts
		FROM sales S 
		GROUP BY S.customer_id, S.product_id
	) T
) R
WHERE R.rnk = 1
```

6. Which item was purchased first by the customer after they became a member?
```
SELECT T.customer_id, T.product_id
FROM
(
	SELECT P.customer_id, S.product_id, DENSE_RANK() OVER(PARTITION BY P.customer_id ORDER BY S.order_date) AS rnk
	FROM members P LEFT JOIN sales S 
	ON P.customer_id = S.customer_id
	WHERE P.join_date <= S.order_date
) T 
WHERE T.rnk = 1
```

7. Which item was purchased just before the customer became a member?
```
SELECT T.customer_id, T.product_id
FROM
(
	SELECT P.customer_id, S.product_id, DENSE_RANK() OVER(PARTITION BY P.customer_id ORDER BY S.order_date DESC) AS rnk
	FROM members P LEFT JOIN sales S 
	ON P.customer_id = S.customer_id
	WHERE P.join_date > S.order_date
) T 
WHERE T.rnk = 1
```

8. What is the total items and amount spent for each member before they became a member?
```
SELECT DISTINCT P.customer_id, COUNT(*) OVER(PARTITION BY P.customer_id) AS counts, SUM(M.price) OVER(PARTITION BY P.customer_id) AS money
FROM members P LEFT JOIN sales S 
ON P.customer_id = S.customer_id
LEFT JOIN menu M
ON S.product_id = M.product_id
WHERE P.join_date > S.order_date

```
9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
```
SELECT DISTINCT P.customer_id, SUM(CASE WHEN M.product_name = "sushi" then 20 ELSE 10 END) OVER(PARTITION BY P.customer_id) AS points
FROM members P LEFT JOIN sales S 
ON P.customer_id = S.customer_id 
LEFT JOIN menu M 
ON M.product_id = S.product_id
```

-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
```
SELECT DISTINCT P.customer_id, SUM(CASE WHEN M.product_name = "sushi" OR (S.order_date >= P.join_date AND DATEDIFF(S.order_date, P.join_date) <= 6) then 20 ELSE 10 END) OVER(PARTITION BY P.customer_id) AS points
FROM members P LEFT JOIN sales S 
ON P.customer_id = S.customer_id 
LEFT JOIN menu M 
ON M.product_id = S.product_id
WHERE LEFT(S.order_date, 7) = "2021-01"
```