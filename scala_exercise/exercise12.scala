package org.itc.com

object Main {



  def filter[A](p: A => Boolean, l: List[A]): List[A] = l match
  {
    case Nil => Nil
    case x :: xs => p(x) match
      {
        case true => x :: filter(p, xs)
        case _ => filter(p, xs)
    }
  }

  def func(n: Int) : Boolean = (n % 3) match
  {
    case 0 => true
    case _ => false
  }

  def main(args: Array[String]): Unit = {

    var x= List(1, 2, 3,4,5,6,7,8,9,10)

    println(filter(func, x))

  }
}