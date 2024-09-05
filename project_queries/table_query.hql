CREATE DATABASE IF NOT EXISTS query_taxi;
USE query_taxi;

--hdfs://ip-172-31-3-80.eu-west-2.compute.internal:8020/warehouse/tablespace/managed/hive

CREATE TABLE IF NOT EXISTS query_taxi.trip_info 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS
(
    SELECT 'yellow_taxi' AS cab_type, pickup_datetime, dropoff_datetime, pulocationid, dolocationid 
    FROM clean_taxi.sample_yellow_taxi
    WHERE YEAR(pickup_datetime) = 2022
    UNION ALL
    SELECT 'green_taxi' AS cab_type, pickup_datetime, dropoff_datetime, pulocationid, dolocationid 
    FROM clean_taxi.sample_green_taxi
    WHERE YEAR(pickup_datetime) = 2022
    UNION ALL
    SELECT 'for_hire_vehicle' AS cab_type, pickup_datetime, dropoff_datetime, pulocationid, dolocationid 
    FROM clean_taxi.sample_for_hire_vehicle
    WHERE YEAR(pickup_datetime) = 2022
    UNION ALL
    SELECT 'uber' AS cab_type, pickup_datetime, dropoff_datetime, pulocationid, dolocationid 
    FROM clean_taxi.sample_high_volume_fhv
    WHERE YEAR(pickup_datetime) = 2022 AND hvfhs_license_num = 'HV0003'
    UNION ALL
    SELECT 'lyft' AS cab_type, pickup_datetime, dropoff_datetime, pulocationid, dolocationid 
    FROM clean_taxi.sample_high_volume_fhv
    WHERE YEAR(pickup_datetime) = 2022 AND hvfhs_license_num = 'HV0005'
);


CREATE TABLE IF NOT EXISTS query_taxi.cab_type_cnt_pct 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS
(
    SELECT A.cab_type, A.cts, ROUND(A.cts * 100/ (SUM(A.cts) OVER()), 2) AS pct
    FROM
    (
        SELECT cab_type, COUNT(*) AS cts 
        FROM trip_info 
        GROUP BY cab_type
    ) A
);


CREATE TABLE IF NOT EXISTS query_taxi.trip_starting_zone 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS
(
    SELECT pulocationid, A.cts, ROUND(A.cts * 100 / (SUM(A.cts) OVER()), 2) AS pct
    FROM
    (
        SELECT pulocationid, COUNT(*) AS cts 
        FROM trip_info 
        WHERE pulocationid IS NOT NULL
        GROUP BY pulocationid
    ) A 
    ORDER BY A.cts DESC
);

CREATE TABLE IF NOT EXISTS query_taxi.trip_ending_zone 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS
(
    SELECT dolocationid, A.cts, ROUND(A.cts * 100 / (SUM(A.cts) OVER()), 2) AS pct
    FROM
    (
        SELECT dolocationid, COUNT(*) AS cts 
        FROM trip_info 
        WHERE dolocationid IS NOT NULL
        GROUP BY dolocationid
    ) A 
    ORDER BY A.cts DESC
);

CREATE TABLE IF NOT EXISTS query_taxi.trip_start_and_end 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS
(
    SELECT pulocationid, dolocationid, A.cts, ROUND(A.cts * 100 / (SUM(A.cts) OVER()), 2) AS pct
    FROM
    (
        SELECT pulocationid, dolocationid, COUNT(*) AS cts 
        FROM trip_info 
        WHERE dolocationid IS NOT NULL AND pulocationid IS NOT NULL
        GROUP BY pulocationid, dolocationid
    ) A 
    ORDER BY A.cts DESC
);

CREATE TABLE IF NOT EXISTS query_taxi.avg_time_to_scene_by_license 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS 
(
    SELECT hvfhs_license_num, AVG(UNIX_TIMESTAMP(on_scene_datetime) - UNIX_TIMESTAMP(request_datetime)) AS time_to_scene 
    FROM clean_taxi.sample_high_volume_fhv
    WHERE YEAR(pickup_datetime) = 2022
    GROUP BY hvfhs_license_num
);

CREATE TABLE IF NOT EXISTS query_taxi.avg_time_to_scene_by_zone
TBLPROPERTIES ('transactional'='false', 'insert_only'='false') 
AS 
(
    SELECT hvfhs_license_num, pulocationid, AVG(UNIX_TIMESTAMP(on_scene_datetime) - UNIX_TIMESTAMP(request_datetime)) AS time_to_scene 
    FROM clean_taxi.sample_high_volume_fhv
    WHERE YEAR(pickup_datetime) = 2022
    GROUP BY hvfhs_license_num, pulocationid
    ORDER BY pulocationid
);

CREATE TABLE IF NOT EXISTS query_taxi.avg_time_to_pickup_by_license 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS 
(
    SELECT hvfhs_license_num, AVG(UNIX_TIMESTAMP(pickup_datetime) - UNIX_TIMESTAMP(request_datetime)) AS time_to_pickup
    FROM clean_taxi.sample_high_volume_fhv
    WHERE YEAR(pickup_datetime) = 2022
    GROUP BY hvfhs_license_num
);


CREATE TABLE IF NOT EXISTS query_taxi.avg_time_to_pickup_by_zone 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS 
(
    SELECT pulocationid, AVG(UNIX_TIMESTAMP(pickup_datetime) - UNIX_TIMESTAMP(request_datetime)) AS time_to_pickup
    FROM clean_taxi.sample_high_volume_fhv
    GROUP BY pulocationid
    ORDER BY time_to_pickup
);

CREATE TABLE IF NOT EXISTS query_taxi.avg_time_to_pickup_uber_by_zone 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS 
(
    SELECT pulocationid, AVG(UNIX_TIMESTAMP(pickup_datetime) - UNIX_TIMESTAMP(request_datetime)) AS time_to_pickup
    FROM clean_taxi.sample_high_volume_fhv
    WHERE hvfhs_license_num = "HV0003"
    GROUP BY pulocationid
    ORDER BY time_to_pickup
);

CREATE TABLE IF NOT EXISTS query_taxi.avg_time_to_pickup_lyft_by_zone 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS 
(
    SELECT pulocationid, AVG(UNIX_TIMESTAMP(pickup_datetime) - UNIX_TIMESTAMP(request_datetime)) AS time_to_pickup
    FROM clean_taxi.sample_high_volume_fhv
    WHERE hvfhs_license_num = "HV0005"
    GROUP BY pulocationid
    ORDER BY time_to_pickup
);

CREATE TABLE IF NOT EXISTS query_taxi.fhv_dest_cnt_pct 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS 
(
    SELECT A.dolocationid, B.zone, cnt, ROUND(A.cnt * 100 / (SUM(A.cnt) OVER()), 3) AS pct
    FROM
    (
        SELECT dolocationid, COUNT(*) AS cnt 
        FROM clean_taxi.sample_for_hire_vehicle
        GROUP BY dolocationid
    ) A 
    LEFT JOIN clean_taxi.taxi_zone_lookup B
    ON A.dolocationid = B.locationid 
    WHERE A.dolocationid IS NOT NULL
    ORDER BY cnt DESC
);

CREATE TABLE IF NOT EXISTS query_taxi.trip_intervals 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS 
(
    SELECT A.cab_type, A.pulocationid, A.dolocationid, B.zone AS puzone, C.zone AS dozone, (UNIX_TIMESTAMP(A.dropoff_datetime) - UNIX_TIMESTAMP(A.pickup_datetime)) / 60 AS trip_time 
    FROM trip_info A
    LEFT JOIN clean_taxi.taxi_zone_lookup B 
    ON A.pulocationid = B.locationid
    LEFT JOIN clean_taxi.taxi_zone_lookup C 
    ON A.dolocationid = C.locationid
    WHERE (UNIX_TIMESTAMP(A.dropoff_datetime) - UNIX_TIMESTAMP(A.pickup_datetime)) BETWEEN 60 * 3 AND 60 * 180
);

CREATE TABLE IF NOT EXISTS query_taxi.fhv_trip_intervals
TBLPROPERTIES ('transactional'='false', 'insert_only'='false') 
AS 
(
    SELECT pulocationid, dolocationid, puzone, dozone, trip_time 
    FROM trip_intervals 
    WHERE cab_type = "for_hire_vehicle"
);


CREATE VIEW IF NOT EXISTS query_taxi.temp_trip_info_with_time_window AS
(
    SELECT CONCAT(CAST(YEAR(pickup_datetime) AS STRING), "-", LPAD(MONTH(pickup_datetime), 2, '0'), ': ', (
        CASE WHEN DAY(pickup_datetime) <= 10 THEN '01-10 '
        WHEN DAY(pickup_datetime) >= 21 THEN '11-20 '
        ELSE '21-end' END
    )) AS date_window
    FROM trip_info
);

CREATE TABLE IF NOT EXISTS query_taxi.trip_by_time_window 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS
(   
    SELECT date_window, COUNT(*) AS cts, ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM trip_info), 2) AS pct
    FROM temp_trip_info_with_time_window
    GROUP BY date_window
    ORDER BY cts DESC
);

CREATE VIEW IF NOT EXISTS query_taxi.temp_trip_info_with_hour AS
(
    SELECT HOUR(pickup_datetime) AS hr
    FROM trip_info
);

CREATE TABLE IF NOT EXISTS query_taxi.trip_by_hour
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS
(   
    SELECT hr, COUNT(*) AS cts, ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM trip_info), 2) AS pct
    FROM temp_trip_info_with_hour
    GROUP BY hr
    ORDER BY cts DESC
);


CREATE TABLE IF NOT EXISTS query_taxi.avg_time_to_pickup_by_hour
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS 
(
    SELECT HOUR(pickup_datetime) AS hour, AVG(UNIX_TIMESTAMP(pickup_datetime) - UNIX_TIMESTAMP(request_datetime)) AS time_to_pickup
    FROM clean_taxi.sample_high_volume_fhv
    GROUP BY HOUR(pickup_datetime)
);

CREATE TABLE IF NOT EXISTS query_taxi.tip_percentage 
TBLPROPERTIES ('transactional'='false', 'insert_only'='false')
AS 
(
    SELECT "uber" AS cab_type, ROUND(100 * AVG(NVL(tips / (GREATEST(base_passenger_fare, 0) + GREATEST(bcf, 0) + GREATEST(tolls, 0) + GREATEST(sales_tax, 0) + GREATEST(congestion_surcharge, 0) + GREATEST(airport_fee, 0) + GREATEST(tips, 0)), 0)), 2) AS tip_pct
    FROM clean_taxi.sample_high_volume_fhv 
    WHERE hvfhs_license_num = 'HV0003'
    UNION ALL
    SELECT "lyft" AS cab_type, ROUND(100 * AVG(NVL(tips / (GREATEST(base_passenger_fare, 0) + GREATEST(bcf, 0) + GREATEST(tolls, 0) + GREATEST(sales_tax, 0) + GREATEST(congestion_surcharge, 0) + GREATEST(airport_fee, 0) + GREATEST(tips, 0)), 0)), 2) AS tip_pct
    FROM clean_taxi.sample_high_volume_fhv 
    WHERE hvfhs_license_num = 'HV0005'
    UNION ALL 
    SELECT "yellow" AS cab_type, ROUND(100 * AVG(tip_amount / total_amount), 2) AS tip_pct
    FROM clean_taxi.sample_yellow_taxi
    UNION ALL 
    SELECT "green" AS cab_type, ROUND(100 * AVG(tip_amount / total_amount), 2) AS tip_pct
    FROM clean_taxi.sample_green_taxi
);

--SELECT SUM(CASE WHEN wav_request_flag = TRUE THEN 1 ELSE 0 END) AS total 
--FROM sample_high_volume_fhv;

--SELECT SUM(CASE WHEN wav_request_flag = TRUE THEN 1 ELSE 0 END) AS total 
--FROM sample_high_volume_fhv
--WHERE wav_request_flag = TRUE;