package org.itc.com

import scala.collection.immutable.ListMap

object Main {

  def main(args: Array[String]): Unit = {
    val map12 = new ListMap() + (1 -> "a") + (2 -> "b")

    print(map12)
  }
}