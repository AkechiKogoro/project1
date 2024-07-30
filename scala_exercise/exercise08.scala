package org.itc.com

package org.itc.com

object Main {
  def op1(x:Double): Double = {
    x + 5
  }
  def op2(x:Double): Double ={
    x * x
  }
  def compose[A,B,C](f: A => B, g : B => C): A =>C = {
    val composition = {x: A => g(f(x))}
    return composition
  }
  def main(args: Array[String]): Unit = {

    println(compose(op1, op2)(10.0))
  }
}
