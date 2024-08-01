package org.itc.com

import org.apache.spark.SparkContext

object Main {
  def main(args: Array[String]): Unit = {
    println("Hello world!")

    val sc = new SparkContext(master="local[1]", appName="appName")

    // read a file
    val rdd1 = sc.textFile("highest_temp.txt")
    print(rdd1)
    // read line from file, split by space, 1 to many, 1 line gives many words
  val rows = rdd1.flatMap(line => line.split(" "))
  val temps = rows.map(line => line.split(",")(2).toDouble)

    temps.collect().foreach(println)
  val result = temps.reduce((x, y) => x.max(y))
  println(result)

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