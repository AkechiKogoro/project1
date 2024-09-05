import pandas as pd
import numpy as np
from pyspark.sql import SparkSession
from pyspark.sql.functions import (
    col, sum, avg, stddev, count, countDistinct, trim,
    to_utc_timestamp, from_utc_timestamp, when, date_format, rand,
    year, month, hour, dayofweek, dayofmonth, lit, unix_timestamp
)
from pyspark.sql import functions as SF
import glob
import shapefile
import seaborn as sns
from matplotlib import pyplot as plt 

# Initialize Spark Session
spark = SparkSession.builder.appName("query") \
    .config("hive.metastore.uris", "thrift://localhost:9083") \
    .config("mapreduce.input.fileinputformat.input.dir.recursive", "true") \
    .enableHiveSupport() \
    .getOrCreate()

spark.conf.set("spark.sql.parquet.timestampFormat", "yyyy-MM-dd HH:mm:ss.SSS")

spark.sparkContext.setLogLevel("ERROR")

hdfs_directory = "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//"

# Read from Hive

tip_percentage = spark.sql("SELECT * FROM curated_taxi.tip_percentage")
tip_percentage.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/tip_percentage")
