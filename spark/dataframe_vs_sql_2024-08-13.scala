package org.itc.com

import org.apache.log4j.{Level, Logger}
import org.apache.spark.{SparkConf, SparkContext}
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.functions._
import org.apache.spark._
import org.apache.spark.storage.StorageLevel
import org.apache.spark.sql.expressions._

object Main extends App {

  Logger.getLogger("org").setLevel(Level.ERROR)
  val sc = new SparkContext(master = "local[1]", appName = "appName")

  val sparkconf = new SparkConf();
  sparkconf.set("spark.app.name", "DataframeDemo")
  sparkconf.set("spark.master", "local[*]")

  val spark = SparkSession.builder().config(sparkconf).getOrCreate()

  val sales = spark.read
  .format("jdbc")
  .option("url", "jdbc:postgresql://localhost:5432/new_challenge")
  .option("dbtable", "sales")
  .option("user", "postgres")
  .option("password", "12345678")
  .load().alias("sales")
  sales.createOrReplaceTempView("sales")

  val menu = spark.read
    .format("jdbc")
    .option("url", "jdbc:postgresql://localhost:5432/new_challenge")
    .option("dbtable", "menu")
    .option("user", "postgres")
    .option("password", "12345678")
    .load().alias("menu")
  menu.createOrReplaceTempView("menu")

  val members = spark.read
    .format("jdbc")
    .option("url", "jdbc:postgresql://localhost:5432/new_challenge")
    .option("dbtable", "members")
    .option("user", "postgres")
    .option("password", "12345678")
    .load().alias("members")
  members.createOrReplaceTempView("members")

  // question 1
  val q1 = sales.join(menu, menu.col("product_id")===sales.col("product_id"))
    .groupBy("customer_id").agg(sum("price").alias("total_cost"))
  q1.show()

  // question 2
  val q2 = sales.groupBy("customer_id").agg(countDistinct("order_date").alias("num_of_days"))
  q2.show()

  // question3
  val window_q3 = Window.partitionBy("customer_id").orderBy("order_date")
  var q3 = sales.withColumn("date_rank", rank().over(window_q3))
  q3 = q3.where(col("date_rank") === 1)
  q3 = q3.join(menu, q3.col("product_id") === menu.col("product_id"))
  q3 = q3.select("customer_id", "product_name")
  q3.show()

  // question 4
  var q4 = sales.groupBy("product_id").count()
  q4 = menu.join(q4, q4.col("product_id") === menu("product_id"), joinType = "left")
  q4 = q4.select("product_name", "count")
  q4.show()

  // question 5
  val window_q5 = Window.partitionBy("sales.customer_id").orderBy(asc("order_date"))
  var q5 = members.join(sales,
    sales.col("customer_id") === members.col("customer_id") &&
      sales.col("order_date") > members.col("join_date"))
    .withColumn("date_rank", rank().over(window_q5))
    .filter(col("date_rank") === 1)


  q5 = q5.join(menu, menu.col("product_id") === q5.col("product_id"))
    .select("sales.customer_id", "product_name")
  q5.show()

  // question 6
  val query6 =
    """
      |SELECT T.customer_id, T.product_id
      |FROM
      |(
      |	SELECT P.customer_id, S.product_id, DENSE_RANK() OVER(PARTITION BY P.customer_id ORDER BY S.order_date) AS rnk
      |	FROM members P LEFT JOIN sales S
      |	ON P.customer_id = S.customer_id
      |	WHERE P.join_date <= S.order_date
      |) T
      |WHERE T.rnk = 1
      |""".stripMargin
  spark.sql(query6).show()

  // question 7
  val query7 =
    """
      |SELECT T.customer_id, T.product_id
      |FROM
      |(
      |	SELECT P.customer_id, S.product_id, DENSE_RANK() OVER(PARTITION BY P.customer_id ORDER BY S.order_date DESC) AS rnk
      |	FROM members P LEFT JOIN sales S
      |	ON P.customer_id = S.customer_id
      |	WHERE P.join_date > S.order_date
      |) T
      |WHERE T.rnk = 1
      |""".stripMargin
  spark.sql(query7).show()

  // question8
  val query8 =
    """
      |SELECT DISTINCT P.customer_id, COUNT(*) OVER(PARTITION BY P.customer_id) AS counts, SUM(M.price) OVER(PARTITION BY P.customer_id) AS money
      |FROM members P LEFT JOIN sales S
      |ON P.customer_id = S.customer_id
      |LEFT JOIN menu M
      |ON S.product_id = M.product_id
      |WHERE P.join_date > S.order_date
      |""".stripMargin
  spark.sql(query8).show()

  // question 9
  val query9 =
    """
      |SELECT DISTINCT P.customer_id, SUM(CASE WHEN M.product_name = "sushi" then 20 ELSE 10 END) OVER(PARTITION BY P.customer_id) AS points
      |FROM members P LEFT JOIN sales S
      |ON P.customer_id = S.customer_id
      |LEFT JOIN menu M
      |ON M.product_id = S.product_id
      |""".stripMargin
  spark.sql(query9).show()

  // question 10
  val query10 =
    """
      |SELECT DISTINCT P.customer_id, SUM(CASE WHEN M.product_name = "sushi" OR (S.order_date >= P.join_date AND DATEDIFF(S.order_date, P.join_date) <= 6) then 20 ELSE 10 END) OVER(PARTITION BY P.customer_id) AS points
      |FROM members P LEFT JOIN sales S
      |ON P.customer_id = S.customer_id
      |LEFT JOIN menu M
      |ON M.product_id = S.product_id
      |WHERE LEFT(S.order_date, 7) = "2021-01"
      |""".stripMargin
  spark.sql(query10).show()
}