package org.itc.com
import org.apache.log4j.{Level, Logger}
import org.apache.spark.{SparkConf, SparkContext}
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.functions.{col, lower, trim}
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
    val productdf = spark.read.option("header", true).schema(ddlSchema).option("inferSchema", true).option("inferSchema", true).
      csv("C:\\Users\\Yesheng Huang\\Documents\\TechConsulting\\warehouse\\products.csv")

    var casteddf = productdf.withColumn(colName = "length", col("length").cast("Float").cast("Float"))
    casteddf = casteddf.dropDuplicates(col1 = "product_number")
    var cleaneddf = casteddf.na.fill("unknown", Seq("product_name")).na.fill(0, Seq("length", "width", "height"))

    cleaneddf = cleaneddf.withColumn("product_name", trim(col("product_name")))

    // change case
    cleaneddf = cleaneddf.withColumn("product_category", lower(col("product_category")))
      .withColumn("product_name", lower(col("product_name")))

    var validdf = cleaneddf.filter(col("length") > 0 || col("width") > 85)

    // drop columns
    validdf = validdf.drop("product_scale")

    validdf.printSchema()
    validdf.show(5)
    validdf.coalesce(1).write.csv("C:\\output_folder\\w")
}