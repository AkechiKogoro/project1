CREATE DATABASE IF NOT EXISTS curated_taxi;
USE curated_taxi;

CREATE EXTERNAL TABLE IF NOT EXISTS trip_info LIKE query_taxi.trip_info 
STORED AS ORC
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//trip_info//";

INSERT INTO trip_info 
SELECT * FROM query_taxi.trip_info;


CREATE EXTERNAL TABLE IF NOT EXISTS cab_type_cnt_pct LIKE query_taxi.cab_type_cnt_pct
STORED AS ORC
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//cab_type_cnt_pct//";

INSERT INTO cab_type_cnt_pct
SELECT * FROM query_taxi.cab_type_cnt_pct;


CREATE EXTERNAL TABLE IF NOT EXISTS trip_starting_zone LIKE query_taxi.trip_starting_zone
STORED AS ORC
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//trip_starting_zone//";

INSERT INTO trip_starting_zone
SELECT * FROM query_taxi.trip_starting_zone;

CREATE EXTERNAL TABLE IF NOT EXISTS trip_ending_zone LIKE query_taxi.trip_ending_zone
STORED AS ORC
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//trip_ending_zone//";

INSERT INTO trip_ending_zone
SELECT * FROM query_taxi.trip_ending_zone;


CREATE EXTERNAL TABLE IF NOT EXISTS trip_start_and_end LIKE query_taxi.trip_start_and_end
STORED AS ORC
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//trip_start_and_end//";

INSERT INTO trip_start_and_end
SELECT * FROM query_taxi.trip_start_and_end;


CREATE EXTERNAL TABLE IF NOT EXISTS avg_time_to_scene_by_license LIKE query_taxi.avg_time_to_scene_by_license
STORED AS ORC
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//avg_time_to_scene_by_license//";

INSERT INTO avg_time_to_scene_by_license
SELECT * FROM query_taxi.avg_time_to_scene_by_license;


CREATE EXTERNAL TABLE IF NOT EXISTS avg_time_to_scene_by_zone LIKE query_taxi.avg_time_to_scene_by_zone
STORED AS ORC 
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//avg_time_to_scene_by_zone//";

INSERT INTO avg_time_to_scene_by_zone
SELECT * FROM query_taxi.avg_time_to_scene_by_zone;


CREATE EXTERNAL TABLE IF NOT EXISTS avg_time_to_pickup_by_license LIKE query_taxi.avg_time_to_pickup_by_license
STORED AS ORC 
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//avg_time_to_pickup_by_license//";

INSERT INTO avg_time_to_pickup_by_license
SELECT * FROM query_taxi.avg_time_to_pickup_by_license;


CREATE EXTERNAL TABLE IF NOT EXISTS avg_time_to_pickup_by_zone LIKE query_taxi.avg_time_to_pickup_by_zone
STORED AS ORC 
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//avg_time_to_pickup_by_zone//";

INSERT INTO avg_time_to_pickup_by_zone
SELECT * FROM query_taxi.avg_time_to_pickup_by_zone;


CREATE EXTERNAL TABLE IF NOT EXISTS avg_time_to_pickup_uber_by_zone LIKE query_taxi.avg_time_to_pickup_uber_by_zone
STORED AS ORC
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//avg_time_to_pickup_uber_by_zone//";

INSERT INTO avg_time_to_pickup_uber_by_zone
SELECT * FROM query_taxi.avg_time_to_pickup_uber_by_zone;


CREATE EXTERNAL TABLE IF NOT EXISTS avg_time_to_pickup_lyft_by_zone LIKE query_taxi.avg_time_to_pickup_lyft_by_zone 
STORED AS ORC 
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//avg_time_to_pickup_lyft_by_zone//";

INSERT INTO avg_time_to_pickup_lyft_by_zone 
SELECT * FROM query_taxi.avg_time_to_pickup_lyft_by_zone;


CREATE EXTERNAL TABLE IF NOT EXISTS fhv_dest_cnt_pct LIKE query_taxi.fhv_dest_cnt_pct
STORED AS ORC 
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//fhv_dest_cnt_pct//";

INSERT INTO fhv_dest_cnt_pct
SELECT * FROM query_taxi.fhv_dest_cnt_pct;


CREATE EXTERNAL TABLE IF NOT EXISTS trip_intervals LIKE query_taxi.trip_intervals
STORED AS ORC 
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//trip_intervals//";

INSERT INTO trip_intervals
SELECT * FROM query_taxi.trip_intervals;


CREATE EXTERNAL TABLE IF NOT EXISTS fhv_trip_intervals LIKE query_taxi.fhv_trip_intervals
STORED AS ORC 
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//fhv_trip_intervals//";

INSERT INTO fhv_trip_intervals
SELECT * FROM query_taxi.fhv_trip_intervals;


CREATE EXTERNAL TABLE IF NOT EXISTS trip_by_time_window LIKE query_taxi.trip_by_time_window 
STORED AS ORC 
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//trip_by_time_window//";

INSERT INTO trip_by_time_window
SELECT * FROM query_taxi.trip_by_time_window;


CREATE EXTERNAL TABLE IF NOT EXISTS trip_by_hour LIKE query_taxi.trip_by_hour
STORED AS ORC 
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//trip_by_hour//";

INSERT INTO trip_by_hour
SELECT * FROM query_taxi.trip_by_hour;


CREATE EXTERNAL TABLE IF NOT EXISTS avg_time_to_pickup_by_hour LIKE query_taxi.avg_time_to_pickup_by_hour
STORED AS ORC 
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//avg_time_to_pickup_by_hour//";

INSERT INTO avg_time_to_pickup_by_hour
SELECT * FROM query_taxi.avg_time_to_pickup_by_hour;


CREATE EXTERNAL TABLE IF NOT EXISTS tip_percentage LIKE query_taxi.tip_percentage
STORED AS ORC 
LOCATION "hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020//user//ec2-user//UKUSJULHDFS//yesheng//curated_data//tip_percentage//";

INSERT INTO tip_percentage
SELECT * FROM query_taxi.tip_percentage;