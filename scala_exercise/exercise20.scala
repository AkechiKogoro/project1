package org.itc.com

import scala.collection.immutable.ListMap

object Main {

  def election(votes: List[String]): ListMap[String,Int] = votes match {
    case Nil => new ListMap()
    case x::xs => {
      val y = election(xs)
//      println(x, xs , y)
      if (y.contains(x))
      return y + (x -> (y(x) + 1))
      else
      return y + (x -> 1)
    }
  }
  def main(args: Array[String]): Unit = {
    val map123 = List((1,"a"),(2,"b"), (3,"c"))
    print(election(List("Hillary","Donald","Hillary")))
  }
}