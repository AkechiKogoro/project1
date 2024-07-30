package org.itc.com

object Main {
  def compose[A,B,C](f: A => B, g : B => C): A =>C = {
    val composition = {x: A => g(f(x))}
    return composition
  }
  def main(args: Array[String]): Unit = {
    val op1 = {x: Double => x + 5}
    val op2 = {x: Double => x * x}

    val new_op = compose(op1, op2)
    println(new_op(10))
  }
}