package org.itc.com

import org.apache.spark.SparkContext

object Main {
  def main(args: Array[String]): Unit = {

    val sc = new SparkContext(master="local[1]", appName="appName")

    // read a file
    val rdd1 = sc.textFile("highest_temp.txt")
    print(rdd1)
    // read line from file, split by space, 1 to many, 1 line gives many words
    val rows = rdd1.flatMap(line => line.split(" "))
    val sensor_temps = rows.map(line => (line.split(",")(0), line.split(",")(2).toDouble))
    val sensor_flags = sensor_temps.map(x=> (x._1, if (x._2>50) 1 else 0))

//    sensor_flags.collect().foreach(println)

    val sensor_summary = sensor_flags.reduceByKey((x, y) => x + y)
    sensor_summary.collect().foreach(println)

  }
}

/// data file
/*
Task 1 : highest temp

Input data :: sensor id -date -temp
s1,2016-01-01,20.5
s2,2016-01-01,30.1
s1,2016-01-02,60.2
s2,2016-01-02,20.4
s1,2016-01-03,55.5
s2,2016-01-03,52.5

Output data
60.2

*/