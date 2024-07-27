import pymysql
conn = pymysql.connect(host='localhost', user='root', password='12345678', database="challenge1")
cursor = conn.cursor()
answer_01 = """
SELECT S.customer_id, SUM(M.price) AS total_cost
FROM sales S LEFT JOIN menu M
ON S.product_id = M.product_id 
GROUP BY S.customer_id
ORDER BY total_cost DESC, customer_id ASC
"""
cursor.execute(answer_01)
conn.commit()
rows = cursor.fetchall()
print("ID\tPrice\t")
print("--\t----")
# print(len(rows), len(rows[0]))
for row in rows:
    print(f"{row[0]}\t{row[1]}")

