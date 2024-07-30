package org.itc.com

object Main {

  def reverse[A](l: List[A]): List[A] = l match {
    case Nil => Nil
    case x :: xs => reverse(xs):::(x::Nil)
  }

  def main(args: Array[String]): Unit = {

    var x= List(1, 2, 3,4,5,6,7,8,9,10)
    var y = List(100, 101)
    println(reverse(x))
  }
}