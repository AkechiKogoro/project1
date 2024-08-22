package org.itc.com
import org.apache.log4j.{Level, Logger}
import org.apache.spark.{SparkConf, SparkContext}
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.functions._
//import org.apache.spark.

object DFDemo extends App{

    Logger.getLogger("org").setLevel(Level.ERROR)
    val sc = new SparkContext(master="local[1]", appName="appName")

    val sparkconf = new SparkConf();
    sparkconf.set("spark.app.name", "DataframeDemo")
    sparkconf.set("spark.master", "local[*]")

    val ddlSchema =
        """product_number string, product_name string, product_category string, product_scale string, product_manufacturer string, product_description string,
          |length double, width double, height float""".stripMargin

    val spark = SparkSession.builder().config(sparkconf).getOrCreate()
    var productdf = spark.read.option("header", true).schema(ddlSchema).option("inferSchema", true).option("inferSchema", true).
      csv("C:\\Users\\Yesheng Huang\\Documents\\TechConsulting\\warehouse\\products.csv")

    /*
    Outlier values are those outside (mean - 3 * std, mean + 3 * std)
    here, we chose the interval to be (mean - 2 * std, mean + 2 * std),
    because otherwise there would be no outliers
     */
    val stats = productdf.agg(
        avg("length").alias("avg_length"),
        stddev("length").alias("std_length"),
        avg("width").alias("avg_width"),
        stddev("width").alias("std_width"),
        avg("height").alias("avg_height"),
        stddev("height").alias("std_height")
    ).first()

    val avg_length = stats.getAs[Double]("avg_length")
    val std_length = stats.getAs[Double]("std_length")
    val avg_width = stats.getAs[Double]("avg_width")
    val std_width = stats.getAs[Double]("std_width")
    val avg_height = stats.getAs[Double]("avg_height")
    val std_height = stats.getAs[Double]("std_height")

    val out_length = productdf.filter(col("length") > avg_length + 2 * std_length || col("length") < avg_length - 2 * std_length)
    val out_width = productdf.filter(col("width") > avg_width + 2 * std_width || col("width") < avg_width - 2 * std_width)
    val out_height = productdf.filter(col("height") > avg_height + 2 * std_height || col("height") < avg_height - 2 * std_height)

    out_length.show(5)
    out_width.show(5)
    out_height.show(5)

    /* split product_number into store_number and product_number */

    var splitDF = productdf.withColumn("store_number", split(col("product_number"), "_")(0))
      .withColumn("product_number", split(col("product_number"), "_")(1))

    splitDF.show(5)

    val product_with_class = productdf.withColumn("product_classification", when(col("length") > 4000 && col("width") > 2000, value = "small and wide")
      .when(col("length") > 6000 && col("width") > 40, value = "small and narrow")
      .when(col("length") > 8000 && col("width") > 60, value = "large and wide")
      .otherwise(value = "large and narrow"))

    product_with_class.show(5)
    
    val product_agg = productdf.groupBy("product_category").agg(min(col("length")).alias("length_min"),
        max(col("length")).alias("length_max"),
        avg(col("length")).alias("length_avg")).na.drop()

    product_agg.show(5)
//    productdf.printSchema()
//    productdf.show(5)
}