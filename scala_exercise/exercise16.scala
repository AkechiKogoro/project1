package org.itc.com

object Main {


  def keys[K,V](m: List[(K,V)]): List[K] = m match {
    case Nil => Nil
    case x::xs => x._1 :: keys(xs)
  }


  def main(args: Array[String]): Unit = {
    val map123 = List((1,"c"),(2,"b"), (3,"a"))
    println(keys(map123))
  }
}