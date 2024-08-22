# New York City Taxicab data

## Dataset

*Yellow cabs*  (590mb) the only vehicles that have the right to pick up street-hailing and prearranged passengers anywhere in New York City.

*Green taxi* (16.5mb) permitted to accept street-hails. In exchange, Street-Hail Liveries may not operate in the Hail Exclusionary Zone, south of West 110th St and East 96th St.

*For-Hire Vehicle Bases* (140mb)
For-Hire Vehicles (FHVs) provide pre-arranged transportation throughout New York City.

    - Livery Base
    - Black Car Base
    - Luxury Limousine Base
    - High volume for high vehicle (5.06GB)
        - Uber
        - Lyft
        - Juno
        - Via
    


4. Taxi Zone:
LocationID, borough, zone, serviceZone. Also there is geospatial data, but I won't use that.

<img src="taxi_zone_map_bronx.jpg" width=200 height=200> <img src="taxi_zone_map_brooklyn.jpg" width=200 height=200> <img src="taxi_zone_map_manhattan.jpg" width=200 height=200>
<img src="taxi_zone_map_queens.jpg" width=200 height=200> <img src="taxi_zone_map_staten_island.jpg" width=200 height=200>

## Metrics

1. Customer behavior: average distance, passenger counts, etc.

2. hvfhv: 
    - fare per mile or per second
    - average waiting time (difference between request time and on-screen time)
    - tip percentage

3. For non-hvfhv, what makes them survive?
    - time
    - distance
    - certain destination

4. When there is more demand of cabs?
   Between which two zones were cabs most needed?

## Steps

1. Clean data

    Get rid of meaningless null values, filter out data which does not make sense (say both PUlocationID and DOlocationID are null, passenger_num is 0), cast appropriate data types.

    Due to the size of the data, only focus on the data in 2022. For high-volume-for-hire-vehicle, sample a proportion (20%) of the total data.

2. Streaming latest released data from files using Kafa to simulate real time data.