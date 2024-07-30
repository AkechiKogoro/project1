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

  def update[K,V](m: List[(K,V)], k: K, v: V): List[(K,V)] = (m, k, v) match{
    case (Nil, a, b) => List((k, v))
    case (x::xs, a, b) => if (x._1 == k) {
      return (k, v) :: xs
    }
    else {
      return x :: update(xs, k, v)
    }
  }

  def main(args: Array[String]): Unit = {
    val map123 = List((1,"c"),(2,"b"), (3,"a"))
    println(update(map123, 2, "12345"))
    println(update(map123, 4, "d"))
  }
}