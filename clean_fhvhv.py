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

df_high_volume_for_hire_vehicle = spark.read.parquet(f"{hdfs_directory}yesheng/raw_data/*/*/high_volume_for_hire_vehicle/*.parquet")



for month in range(1, 13):
    month_str = f'{month:02d}'
    df_high_volume_for_hire_vehicle = spark.read.parquet(f"{hdfs_directory}yesheng/raw_data/*/*/high_volume_for_hire_vehicle/*{month_str}.parquet")


    df_high_volume_for_hire_vehicle.write.mode("append").csv(f"{hdfs_directory}yesheng/clean_data/small_dataset/high_volume_for_hire_vehicle/")