//> using toolkit typelevel:latest

import cats.effect.*

object DoobieplaygroundApp extends IOApp.Simple:
  case class Student(id: Int, name: String, age: Int)
  val run = IO.println("Hello, World!")
