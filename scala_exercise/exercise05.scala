package org.itc.com


object Main {
  abstract class Colour
  case class Red() extends Colour
  case class Green() extends Colour
  case class Blue() extends Colour

  def favouriteColour(c: Colour): String = c match {
    case Red() => "The colour is red"
    case Green() => "The colour is green"
    case Blue() => "The colour is blue"
    case _ => "unknown colour"
  }
  abstract class Shape
  case class Circle(r: Double, x: Double, y: Double) extends Shape
  case class Rectangle(llx: Double, lly: Double, w:Double, h:Double)
    extends Shape

  def main(args: Array[String]): Unit = {
    val mycolour = Green()

    val comments: String = favouriteColour(mycolour)
    print(comments)
  }
}