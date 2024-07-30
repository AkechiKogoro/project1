package org.itc.com


object Main {
  def suffix(n: Int): String =
    (n % 100) match
    {
      case 11=> "th"
      case 12=> "th"
      case 13=> "th"
      case _ => (n % 10) match {
            case 1=> "st"
            case 2=>"nd"
            case 3=> "rd"
            case _=> "th"
          }
    }

  def main(args: Array[String]): Unit = {
    val n = scala.io.StdIn.readInt()
    println(n.toString + suffix(n))
  }
}