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

df_high_volume_for_hire_vehicle = spark.read.parquet(f"{hdfs_directory}yesheng/raw_data/*/*/high_volume_for_hire_vehicle/*.parquet")



for month in range(1, 13):
    month_str = f'{month:02d}'
    df_high_volume_for_hire_vehicle = spark.read.parquet(f"{hdfs_directory}yesheng/raw_data/*/*/high_volume_for_hire_vehicle/*{month_str}.parquet")

    df_high_volume_for_hire_vehicle = \
    df_high_volume_for_hire_vehicle.withColumn("pickup_datetime_utc", to_utc_timestamp("pickup_datetime", 'America/New_York')) \
        .withColumn("dropoff_datetime_utc", to_utc_timestamp("dropoff_datetime", 'America/New_York')) \
        .withColumn("pickup_datetime_nyc", from_utc_timestamp("pickup_datetime_utc", 'America/New_York')) \
        .withColumn("dropoff_datetime_nyc", from_utc_timestamp("dropoff_datetime_utc", 'America/New_York')) \
        .withColumn("request_datetime_utc", to_utc_timestamp("request_datetime", 'America/New_York')) \
        .withColumn("on_scene_datetime_utc", to_utc_timestamp("on_scene_datetime", 'America/New_York')) \
        .withColumn("request_datetime_nyc", from_utc_timestamp("request_datetime_utc", 'America/New_York')) \
        .withColumn("on_scene_datetime_nyc", from_utc_timestamp("on_scene_datetime_utc", 'America/New_York')) \
        .drop("request_datetime", "on_scene_datetime", "pickup_datetime", "dropoff_datetime", "pickup_datetime_utc", "dropoff_datetime_utc", "request_datetime_utc", "on_scene_datetime_utc") \
        .withColumnRenamed("pickup_datetime_nyc", "pickup_datetime") \
        .withColumnRenamed("dropoff_datetime_nyc", "dropoff_datetime") \
        .withColumnRenamed("request_datetime_nyc", "request_datetime") \
        .withColumnRenamed("on_scene_datetime_nyc", "on_scene_datetime") \
        .withColumn("shared_request_flag", col("shared_request_flag") != 'N') \
        .withColumn("shared_match_flag", col("shared_match_flag") != 'N') \
        .withColumn("wav_request_flag", col("wav_request_flag") != 'N') \
        .withColumn("wav_match_flag", col("wav_match_flag") != 'N') \
        .withColumn("access_a_ride_flag", col("access_a_ride_flag") != 'N') \
        .withColumn("dispatching_base_num", trim(col("dispatching_base_num"))) \
        .withColumn("originating_base_num", trim(col("originating_base_num"))) \
        .withColumn("hvfhs_license_num", trim(col("hvfhs_license_num"))) \
        .withColumn("pickup_datetime", date_format("pickup_datetime", "yyyy-MM-dd HH:mm:ss")) \
        .withColumn("dropoff_datetime", date_format("dropoff_datetime", "yyyy-MM-dd HH:mm:ss")) \
        .withColumn("request_datetime", date_format("request_datetime", "yyyy-MM-dd HH:mm:ss")) \
        .withColumn("on_scene_datetime", date_format("on_scene_datetime", "yyyy-MM-dd HH:mm:ss"))

    df_high_volume_for_hire_vehicle.write.mode("append").csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/high_volume_for_hire_vehicle/")

    sample_high_volume_for_hire_vehicl = df_high_volume_for_hire_vehicle.filter(rand() < 0.15)
    sample_high_volume_for_hire_vehicl.write.mode("append").csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/sample_high_volume_for_hire_vehicle")