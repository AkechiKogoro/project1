import pandas as pd
import numpy as np
from pyspark.sql import SparkSession

from pyspark.sql.functions import (
    col, sum, avg, stddev, count, countDistinct, trim,
    to_utc_timestamp, from_utc_timestamp, when, date_format, rand,
    year, month, hour, dayofweek, dayofmonth, lit
)

import pyspark.sql.functions as F # min, max
import glob
import shapefile

spark = SparkSession.builder.appName("dataCleaning") \
    .config("spark.driver.memeory", "128g") \
    .config("saprk.executor.memory", "128g") \
    .config("spark.hadoop.fs.defaultFS", "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020") \
    .master("local[*]") \
    .getOrCreate()

spark.sparkContext.setLogLevel("ERROR")

hdfs_directory = "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//"

df_yellow_taxi = spark.read.parquet(f"{hdfs_directory}yesheng/raw_data/*/*/yellow_taxi/*.parquet")
df_green_taxi = spark.read.parquet(f"{hdfs_directory}yesheng/raw_data/*/*/green_taxi/*.parquet")
df_for_hire_vehicle = spark.read.parquet(f"{hdfs_directory}yesheng/raw_data/*/*/for_hire_vehicle/*.parquet")
df_high_volume_for_hire_vehicle = spark.read.parquet(f"{hdfs_directory}yesheng/raw_data/*/*/high_volume_for_hire_vehicle/*.parquet")

# print(df_yellow_taxi.count(), df_green_taxi.count(), df_for_hire_vehicle.count())


df_yellow_taxi = df_yellow_taxi.withColumn("passenger_count", col("passenger_count").cast("long")) \
    .withColumn("RatecodeID", col("RatecodeID").cast("long")) \
    .withColumn("pickup_datetime_utc", to_utc_timestamp("tpep_pickup_datetime", 'America/New_York')) \
    .withColumn("dropoff_datetime_utc", to_utc_timestamp("tpep_dropoff_datetime", 'America/New_York')) \
    .withColumn("pickup_datetime_nyc", from_utc_timestamp("pickup_datetime_utc", 'America/New_York')) \
    .withColumn("dropoff_datetime_nyc", from_utc_timestamp("dropoff_datetime_utc", 'America/New_York')) \
    .drop("tpep_pickup_datetime", "tpep_dropoff_datetime", "pickup_datetime_utc", "dropoff_datetime_utc") \
    .withColumn("store_and_fwd", col("store_and_fwd_flag") != 'N') \
    .drop("store_and_fwd_flag") \
    .withColumnRenamed("pickup_datetime_nyc", "pickup_datetime") \
    .withColumnRenamed("dropoff_datetime_nyc", "dropoff_datetime") \
    .withColumnRenamed("store_and_fwd", "store_and_fwd_flag") \
    .withColumn("pickup_datetime", date_format("pickup_datetime", "yyyy-MM-dd HH:mm:ss")) \
    .withColumn("dropoff_datetime", date_format("dropoff_datetime", "yyyy-MM-dd HH:mm:ss"))

df_yellow_taxi.write.csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/yellow_taxi")

sample_yellow_taxi = df_yellow_taxi.filter(rand() < 0.15)
sample_yellow_taxi.write.csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/sample_yellow_taxi")

df_green_taxi = df_green_taxi.withColumn("RatecodeID", col("RatecodeID").cast("long")) \
      .withColumn("passenger_count", col("passenger_count").cast("long")) \
      .withColumn("trip_type", col("trip_type").cast("long")) \
      .withColumn("payment_type", col("payment_type").cast("long")) \
      .withColumn("ehail_fee", col("ehail_fee").cast("long")) \
      .withColumn("pickup_datetime_utc", to_utc_timestamp("lpep_pickup_datetime", 'America/New_York')) \
      .withColumn("dropoff_datetime_utc", to_utc_timestamp("lpep_dropoff_datetime", 'America/New_York')) \
      .withColumn("pickup_datetime_nyc", from_utc_timestamp("pickup_datetime_utc", 'America/New_York')) \
      .withColumn("dropoff_datetime_nyc", from_utc_timestamp("dropoff_datetime_utc", 'America/New_York')) \
      .drop("lpep_pickup_datetime", "lpep_dropoff_datetime", "pickup_datetime_utc", "dropoff_datetime_utc") \
      .withColumn("store_and_fwd", col("store_and_fwd_flag") != 'N') \
      .drop("store_and_fwd_flag") \
      .withColumnRenamed("pickup_datetime_nyc", "pickup_datetime") \
      .withColumnRenamed("dropoff_datetime_nyc", "dropoff_datetime") \
      .withColumnRenamed("store_and_fwd", "store_and_fwd_flag") \
      .withColumn("pickup_datetime", date_format("pickup_datetime", "yyyy-MM-dd HH:mm:ss")) \
      .withColumn("dropoff_datetime", date_format("dropoff_datetime", "yyyy-MM-dd HH:mm:ss"))

df_green_taxi.write.csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/green_taxi")

sample_green_taxi = df_green_taxi.filter(rand() < 0.15)
sample_green_taxi.write.csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/sample_green_taxi")

df_for_hire_vehicle = df_for_hire_vehicle.withColumn("PUlocationID", col("PUlocationID").cast("long")) \
        .withColumn("DOlocationID", col("DOlocationID").cast("long")) \
        .withColumn("Affiliated_base_number", trim(col("Affiliated_base_number"))) \
        .withColumn("pickup_datetime_utc", to_utc_timestamp("pickup_datetime", 'America/New_York')) \
        .withColumn("dropoff_datetime_utc", to_utc_timestamp("dropOff_datetime", 'America/New_York')) \
        .withColumn("pickup_datetime_nyc", from_utc_timestamp("pickup_datetime_utc", 'America/New_York')) \
        .withColumn("dropoff_datetime_nyc", from_utc_timestamp("dropoff_datetime_utc", 'America/New_York')) \
        .drop("pickup_datetime", "dropOff_datetime", "pickup_datetime_utc", "dropoff_datetime_utc") \
        .withColumnRenamed("pickup_datetime_nyc", "pickup_datetime") \
        .withColumnRenamed("dropoff_datetime_nyc", "dropoff_datetime") \
        .drop("SR_flag") \
        .withColumn("dispatching_base_num", trim(col("dispatching_base_num"))) \
        .withColumn("Affiliated_base_number", trim(col("Affiliated_base_number"))) \
        .withColumnRenamed("Affiliated_base_number", "affiliated_base_number") \
        .withColumn("pickup_datetime", date_format("pickup_datetime", "yyyy-MM-dd HH:mm:ss")) \
        .withColumn("dropoff_datetime", date_format("dropoff_datetime", "yyyy-MM-dd HH:mm:ss"))

df_for_hire_vehicle.write.csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/for_hire_vehicle")

sample_for_hire_vehicle = df_for_hire_vehicle.filter(rand() < 0.15)
sample_for_hire_vehicle.write.csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/sample_for_hire_vehicle")