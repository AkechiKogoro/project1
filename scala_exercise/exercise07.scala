package org.itc.com


object Main {
  abstract class Shape
  case class Circle(r: Double, x: Double, y: Double) extends Shape
  case class Rectangle(llx: Double, lly: Double, w:Double, h:Double)
    extends Shape

  def center(s: Shape): (Double,Double) = s match {
    case Rectangle(llx,lly,w,h) => (llx+w/2, lly+h/2)
    case Circle(r,x,y) => (x,y)
  }

  def boundingBox(s: Shape): Shape = s match {
    case Rectangle(llx,lly,w,h) => Rectangle(llx,lly,w,h)
    case Circle(r,x,y) => Rectangle(x-r, y-r, 2*r, 2*r)
  }

  def mayOverlap(s1: Shape, s2: Shape): Boolean = {
    val rec1 = boundingBox(s1).asInstanceOf[Rectangle]
    val rec2  = boundingBox(s2).asInstanceOf[Rectangle]
    if (rec1.llx + rec1.w >= rec2.llx && rec2.llx + rec2.w >= rec1.llx && rec1.lly + rec1. h >= rec2.lly && rec2.lly + rec2.h >= rec1.lly)
      return true
    else
      return false;
  }
  def main(args: Array[String]): Unit = {
    val myshape1 = Circle(15.0, 11.0, 10.0)
    println(boundingBox(myshape1))
    val myshape2 = Rectangle(1.0, 2.0, 3.0, 4.0)
    println(boundingBox(myshape2))

    println(mayOverlap(myshape1, myshape2))
  }
}