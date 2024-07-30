package org.itc.com

object Main {
  def p(x: Int, y: Int):Int= {
    val v = x * x + 2 * x * y + y * y * y - 1
    return v
  }

  def main(args: Array[String]): Unit = {
    val x = scala.io.StdIn.readInt()
    val y = scala.io.StdIn.readInt()
    println(p(x, y))
  }
}