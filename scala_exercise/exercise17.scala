package org.itc.com
import scala.collection.immutable.ListMap

object Main {

  def main(args: Array[String]): Unit = {
    val presidentListMap= ListMap(41 -> "George H. W. Bush", 42 -> "Bill Clinton", 43 -> "George W. Bush", 44 -> "Barack Obama", 45 -> "Donald J. Trump")
    print(presidentListMap)
  }
}