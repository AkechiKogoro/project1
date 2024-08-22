import pandas as pd
import numpy as np
from pyspark.sql import SparkSession
from pyspark.sql.functions import (
    col,
    sum,
    avg,
    stddev,
    count,
    countDistinct,
    trim
)
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



print(df_yellow_taxi.count(), df_green_taxi.count(), df_for_hire_vehicle.count())

# hvfhv_path = "USUSJULHDFS/yesheng//raw_data//*//*//high_volume_for_hire_vehicle//*.parquet"

# hadoop_conf = spark._jsc.hadoopConfiguration()
# hadoop_fs = spark._jvm.org.apache.hadoop.fs.FileSystem.get(hadoop_conf)

# Path = spark._jvm.org.apache.hadoop.fs.Path
# status = hadoop_fs.globStatus(Path(hvfhv_path + "*.parquet"))


# # Extract file paths
# hvfhv_paths = [str(file.getPath()) for file in status]

# print(hvfhv_path)
# print(status)

# spark = SparkSession.builder.appName("MemoryCheck").getOrCreate()

# # Get the Spark configuration
# conf = spark.sparkContext.getConf()

# # Retrieve memory settings
# driver_memory = conf.get("spark.driver.memory", "Not set")
# executor_memory = conf.get("spark.executor.memory", "Not set")

# print(f"Driver Memory: {driver_memory}")
# print(f"Executor Memory: {executor_memory}")

# # Stop the session
# spark.stop()

df_yellow_taxi = df_yellow_taxi.withColumn("passenger_count", col("passenger_count").cast("long")) \
    .withColumn("RatecodeID", col("RatecodeID").cast("long")) \
    .filter(col("passenger_count") > 0)

df_yellow_taxi.write.csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/yellow_taxi")

df_green_taxi = df_green_taxi.withColumn("RatecodeID", col("RatecodeID").cast("long")) \
      .withColumn("passenger_count", col("passenger_count").cast("long")) \
      .withColumn("trip_type", col("trip_type").cast("long")) \
      .withColumn("payment_type", col("payment_type").cast("long")) \
      .withColumn("ehail_fee", col("ehail_fee").cast("long"))

df_green_taxi.write.csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/green_taxi")

df_for_hire_vehicle = df_for_hire_vehicle.withColumn("PUlocationID", col("PUlocationID").cast("long")) \
         .withColumn("DOlocationID", col("DOlocationID").cast("long")) \
         .withColumn("Affiliated_base_number", trim(col("Affiliated_base_number"))) \
         .filter((col("PUlocationID").isNotNull()) | (col("DOlocationID").isNotNull()))

df_for_hire_vehicle.write.csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/for_hire_vehicle")