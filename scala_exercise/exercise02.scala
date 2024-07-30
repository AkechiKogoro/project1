package org.itc.com


object Main {
  def calc_sum(n: Int):Int= {
    var i: Int = 0;
    var S: Int = 0;
    for(i <- 1 to n)
      S += i
    return S
  }

  def main(args: Array[String]): Unit = {
    val n = scala.io.StdIn.readInt()

    println(calc_sum(n))
  }
}