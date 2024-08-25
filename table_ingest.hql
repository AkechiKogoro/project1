CREATE DATABASE IF NOT EXISTS NYC_TLC_data;
USE NYC_TLC_data;


CREATE EXTERNAL TABLE IF NOT EXISTS data_for_hire_vehicle (
    dispatching_base_num STRING,
    PUlocationID INT,
    DOlocationID INT,
    affiliated_base_number INT,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//clean_data//small_dataset//for_hire_vehicle//";


CREATE EXTERNAL TABLE IF NOT EXISTS data_yellow_taxi (
    vendorID INT,
    passenger_count INT,
    trip_distance FLOAT,
    RatecodeID INT,
    PUlocationID INT,
    DOlocationID INT,
    payment_type INT,
    fare_amount FLOAT,
    extra FLOAT,
    mta_tax FLOAT,
    tip_amount FLOAT,
    tolls_amount FLOAT,
    improvement_surcharge FLOAT,
    total_amount FLOAT,
    congestion_surcharge FLOAT,
    airport_fee FLOAT,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,
    store_and_fwd_flag BOOLEAN
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//clean_data//small_dataset//yellow_taxi//";


CREATE EXTERNAL TABLE IF NOT EXISTS data_green_taxi (
    vendorID INT,
    RatecodeID INT,
    PUlocationID INT,
    DOlocationID INT,
    passenger_count INT,
    trip_distance FLOAT,
    fare_amount FLOAT,
    extra FLOAT,
    mta_tax FLOAT,
    tip_amount FLOAT,
    tolls_amount FLOAT,
    ehail_fee FLOAT,
    improvement_surcharge FLOAT,
    total_amount FLOAT,
    payment_type INT,
    trip_type INT,
    congestion_surcharge FLOAT,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,
    store_and_fwd_flag BOOLEAN
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//clean_data//small_dataset//green_taxi//";


CREATE EXTERNAL TABLE IF NOT EXISTS data_high_volume_fhv (
    hvfhs_license_num STRING, 
    dispatching_base_num STRING, 
    originating_base_num STRING,
    PULocationID INT, 
    DOLocationID INT, 
    trip_miles FLOAT, 
    trip_time INT, 
    base_passenger_fare FLOAT, 
    tolls FLOAT, 
    bcf FLOAT, 
    sales_tax FLOAT, 
    congestion_surcharge FLOAT, 
    airport_fee FLOAT, 
    tips FLOAT, 
    driver_pay FLOAT, 
    shared_request_flag BOOLEAN,
    shared_match_flag BOOLEAN, 
    access_a_ride_flag BOOLEAN, 
    wav_request_flag BOOLEAN, 
    wav_match_flag BOOLEAN,
    pickup_datetime TIMESTAMP, 
    dropoff_datetime TIMESTAMP,
    request_datetime TIMESTAMP, 
    on_scene_datetime TIMESTAMP
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//clean_data//small_dataset//high_volume_for_hire_vehicle//";

CREATE TABLE IF NOT EXISTS sample_high_volume_fhv AS
SELECT * FROM data_high_volume_fhv WHERE RAND() < 0.15;

CREATE TABLE IF NOT EXISTS sample_for_hire_vehicle AS
SELECT * FROM data_for_hire_vehicle WHERE RAND() < 0.15;

CREATE TABLE IF NOT EXISTS sample_yellow_taxi AS
SELECT * FROM data_yellow_taxi WHERE RAND() < 0.15;

CREATE TABLE IF NOT EXISTS sample_green_taxi AS
SELECT * FROM data_green_taxi WHERE RAND() < 0.15;


CREATE EXTERNAL TABLE IF NOT EXISTS taxi_zone_lookup (
    LocationID INT,
    Borough STRING,
    Zone String,
    service_zone STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//clean_data//taxi_zone_lookup//"
TBLPROPERTIES ("skip.header.line.count"="1");