import pandas as pd
import numpy as np
from pyspark.sql import SparkSession
from pyspark.sql.functions import (
    col, sum, avg, stddev, count, countDistinct, trim,
    to_utc_timestamp, from_utc_timestamp, when, date_format, rand,
    year, month, hour, dayofweek, dayofmonth, lit
)
from pyspark.sql import functions as SF
import glob
import shapefile

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
sample_yellow_taxi = spark.sql("SELECT * FROM clean_taxi.sample_yellow_taxi")
sample_green_taxi = spark.sql("SELECT * FROM clean_taxi.sample_green_taxi")
sample_for_hire_vehicle = spark.sql("SELECT * FROM clean_taxi.sample_for_hire_vehicle")
sample_high_volume_fhv = spark.sql("SELECT * FROM clean_taxi.sample_high_volume_fhv")
taxi_zone_lookup = spark.sql("SELECT * FROM clean_taxi.taxi_zone_lookup")




# trip_info = spark.sql("SELECT * FROM curated_taxi.trip_info")
# trip_info.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/trip_info")

cab_type_cnt_pct = spark.sql("SELECT * FROM curated_taxi.cab_type_cnt_pct")
cab_type_cnt_pct.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/cab_type_cnt_pct")

trip_starting_zone = spark.sql("SELECT * FROM curated_taxi.trip_starting_zone")
trip_starting_zone.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/trip_starting_zone")

trip_ending_zone = spark.sql("SELECT * FROM curated_taxi.trip_ending_zone")
trip_ending_zone.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/trip_ending_zone")

trip_start_and_end = spark.sql("SELECT * FROM curated_taxi.trip_start_and_end")
trip_start_and_end.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/trip_start_and_end")

avg_time_to_scene_by_license = spark.sql("SELECT * FROM curated_taxi.avg_time_to_scene_by_license")
avg_time_to_scene_by_license.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/avg_time_to_scene_by_license")

avg_time_to_scene_by_zone = spark.sql("SELECT * FROM curated_taxi.avg_time_to_scene_by_zone")
avg_time_to_scene_by_zone.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/avg_time_to_scene_by_zone")

avg_time_to_pickup_by_license = spark.sql("SELECT * FROM curated_taxi.avg_time_to_pickup_by_license")
avg_time_to_pickup_by_license.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/avg_time_to_pickup_by_license")

avg_time_to_pickup_by_zone = spark.sql("SELECT * FROM curated_taxi.avg_time_to_pickup_by_zone")
avg_time_to_pickup_by_zone.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/avg_time_to_pickup_by_zone")

avg_time_to_pickup_uber_by_zone = spark.sql("SELECT * FROM curated_taxi.avg_time_to_pickup_uber_by_zone")
avg_time_to_pickup_uber_by_zone.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/avg_time_to_pickup_uber_by_zone")

avg_time_to_pickup_lyft_by_zone = spark.sql("SELECT * FROM curated_taxi.avg_time_to_pickup_lyft_by_zone")
avg_time_to_pickup_lyft_by_zone.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/avg_time_to_pickup_lyft_by_zone")

fhv_dest_cnt_pct = spark.sql("SELECT * FROM curated_taxi.fhv_dest_cnt_pct")
fhv_dest_cnt_pct.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/fhv_dest_cnt_pct")

# trip_intervals = spark.sql("SELECT * FROM curated_taxi.trip_intervals")
# trip_intervals.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/trip_intervals")

# fhv_trip_intervals = spark.sql("SELECT * FROM curated_taxi.fhv_trip_intervals")
# fhv_trip_intervals.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/fhv_trip_intervals")

trip_by_time_window  = spark.sql("SELECT * FROM curated_taxi.trip_by_time_window")
trip_by_time_window.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/trip_by_time_window")

avg_time_to_pickup_by_hour  = spark.sql("SELECT * FROM curated_taxi.avg_time_to_pickup_by_hour")
avg_time_to_pickup_by_hour.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/avg_time_to_pickup_by_hour")

tip_percentage = spark.sql("SELECT * FROM curated_taxi.tip_percentage")
tip_percentage.coalesce(1).write.option("header", True).csv(f"{hdfs_directory}yesheng/export_data/tip_percentage")

