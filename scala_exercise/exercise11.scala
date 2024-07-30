package org.itc.com

object Main {
  def map[A,B](f: A => B, l: List[A]): List[B] = l match
    {
    case Nil => Nil
    case x::xs => f(x) :: map(f, xs)
  }
  def func(n: Int) : Double = (n * n).toDouble

  def main(args: Array[String]): Unit = {

    var x= List(1, 2, 3)

    println(map(func, List(1,2,3)))

  }
}