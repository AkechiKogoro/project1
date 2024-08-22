CREATE DATABASE IF NOT EXISTS NYC_TLC_data;
USE NYC_TLC_data;


CREATE EXTERNAL TABLE IF NOT EXISTS data_for_hire_vehicle (
    dispatching_base_num STRING,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,
    PUlocationID INT,
    DOlocationID INT,
    SR_Flag INT,
    Affiliated_base_number INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//clean_data//small_dataset//for_hire_vehicle//";


CREATE EXTERNAL TABLE IF NOT EXISTS data_yellow_taxi (
    vendorID INT,
    tpep_pickup_datetime TIMESTAMP,
    tpep_dropoff_datetime TIMESTAMP,
    passenger_count INT,
    trip_distance FLOAT,
    RatecodeID INT,
    store_and_fwd_flag STRING,
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
    airport_fee FLOAT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//clean_data//small_dataset//yellow_taxi//";


CREATE EXTERNAL TABLE IF NOT EXISTS data_green_taxi (
    vendorID INT,
    lpep_pickup_datetime TIMESTAMP,
    lpep_dropoff_datetime TIMESTAMP,
    store_and_fwd_flag STRING,
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
    congestion_surcharge FLOAT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//clean_data//small_dataset//green_taxi//";


CREATE EXTERNAL TABLE IF NOT EXISTS data_high_volume_fhv (
    hvfhs_license_num STRING, 
    dispatching_base_num STRING, 
    originating_base_num STRING,
    request_datetime TIMESTAMP, 
    on_scene_datetime TIMESTAMP, 
    pickup_datetime TIMESTAMP, 
    dropoff_datetime TIMESTAMP, 
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
    shared_request_flag STRING,
    shared_match_flag STRING, 
    access_a_ride_flag STRING, 
    wav_request_flag STRING, 
    wav_match_flag STRING 
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//clean_data//small_dataset//high_volume_for_hire_vehicle//";

CREAT TABLE IT NOT EXISTS sample_high_volume_fhv AS
SELECT * FROM data_high_volume_fhv WHERE RAND() < 0.2;