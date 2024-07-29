import pymysql

answer_01 = """
SELECT S.customer_id, SUM(M.price) AS total_cost
FROM sales S LEFT JOIN menu M
ON S.product_id = M.product_id 
GROUP BY S.customer_id
ORDER BY total_cost DESC, customer_id ASC
"""


# print(len(rows), len(rows[0]))


if __name__ == "__main__":
    conn = pymysql.connect(host='localhost', user='root', password='1992091909', database="challenge1")
    cursor = conn.cursor()
    get_char = ""
    while get_char != "Q":
        get_char = input("1 for display, 2 for insert, Q for quit: ")
        if get_char == "1":
            table_name = input("input table name: ")
            if table_name in ("sales", "members", "menu"):
                command_string = "SELECT * FROM {};".format(table_name)
                cursor.execute(command_string)
                conn.commit()
                rows = cursor.fetchall()
                if table_name == "sales":
                    print("{}\t{}\t {}\t".format("customer_id", "order_date", "product_id"))
                    #print("--------------------------------------------------------")
                    for row in rows:
                        print("{}\t{}\t{}\t".format(row[0], row[1], row[2]))
                elif table_name == "members":
                    print("{}\t{}\t ".format("customer_id", "join_date"))
                    #print("--------------------------------------------------------")
                    for row in rows:
                        print("{}\t{}\t".format(row[0], row[1]))
                elif table_name == "menu":
                    print("{}\t{}\t {}\t".format("product_id", "product_name", "price"))
                    #print("--------------------------------------------------------")
                    for row in rows:
                        print("{}\t{}\t{}\t".format(row[0], row[1], row[2]))

        elif get_char == "2":
            table_name = input("input table name: ")
            if table_name == "sales":
                customer_id = input("customer_id: ")
                order_date = input("order_date: ")
                product_id = input("product_id: ")
                query = 'INSERT INTO {} (customer_id, order_date, product_id) VALUES ("{}", "{}", "{}");'.format(table_name, customer_id, order_date, product_id)
                cursor.execute(query)
                conn.commit()
            elif table_name == "members":
                customer_id = input("customer_id: ")
                join_date = input("join_date: ")
                query = 'INSERT INTO {} (customer_id, join_date) VALUES ("{}", "{}");'.format(table_name, customer_id, join_date)
                cursor.execute(query)
                conn.commit()
            elif table_name == "menu":
                product_id = input("product_id: ")
                product_name = input("product_name: ")
                price = input("price: ")
                query = 'INSERT INTO {} (product_id, product_name, price) VALUES ("{}", "{}", "{}");'.format(table_name, product_id, product_name, price)
                cursor.execute(query)
                conn.commit()

    cursor.close()
    conn.close()