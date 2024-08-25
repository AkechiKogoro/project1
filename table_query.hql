USE NYC_TLC_data;

CREATE TABLE IF NOT EXISTS trip_info AS
(
    SELECT 'yellow_taxi' AS cab_type, pickup_datetime, dropoff_datetime, pulocationid, dolocationid 
    FROM sample_yellow_taxi
    UNION ALL
    SELECT 'green_taxi' AS cab_type, pickup_datetime, dropoff_datetime, pulocationid, dolocationid 
    FROM sample_green_taxi
    UNION ALL
    SELECT 'for_hire_vehicle' AS cab_type, pickup_datetime, dropoff_datetime, pulocationid, dolocationid 
    FROM sample_for_hire_vehicle
    UNION ALL
    SELECT 'high_volume_fhv' AS cab_type, pickup_datetime, dropoff_datetime, pulocationid, dolocationid 
    FROM sample_high_volume_fhv
);