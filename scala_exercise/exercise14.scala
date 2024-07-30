package org.itc.com

object Main {

  def lookup[K,V](m: List[(K,V)], k: K): V = m match
  {
    case Nil => Nil.asInstanceOf[V]
    case x::xs => if (x._1 == k)
      return x._2
    else
      return lookup(xs, k)
  }

    
  

  def main(args: Array[String]): Unit = {
    val map123 = List((1,"c"),(2,"b"), (3,"a"))
    println(lookup(map123, 2))
  }
}