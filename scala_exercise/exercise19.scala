package org.itc.com

import scala.collection.immutable.ListMap

object Main {

  def list2map[K, V](l: List[(K,V)]): ListMap[K, V] = l match{
    case Nil => new ListMap()
    case x::xs =>  list2map(xs) + (x._1 -> x._2)
  }
  def main(args: Array[String]): Unit = {
    val map123 = List((1,"a"),(2,"b"), (3,"c"))
    print(list2map(map123))
  }
}