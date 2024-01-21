import cats.effect.*
import cats.implicits._
import cats.syntax.all._
import cats.syntax._
import StudentRepoService.*
import Models.*

object Http4s extends IOApp.Simple:
  val test = Student(1, "test")
  def run: IO[Unit] =
    for _ <- IO.println(test.toString)
    yield ()
