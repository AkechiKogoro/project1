package org.itc.com

object Main {
  def p(xyz: (Int, Int, Int)): (Int, Int, Int) = {
    val q: (Int, Int, Int) = (xyz._2, xyz._3, xyz._1)
    return q
  }

  def main(args: Array[String]): Unit = {
    val x = scala.io.StdIn.readInt()
    val y = scala.io.StdIn.readInt()
    val z = scala.io.StdIn.readInt()
    println(p((x, y, z)))
  }
}