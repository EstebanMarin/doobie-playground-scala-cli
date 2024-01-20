//> using toolkit typelevel:default
//> using dependency org.tpolecat::doobie-core:1.0.0-RC4
//> using dependency org.tpolecat::doobie-postgres:1.0.0-RC4

import cats.effect.*
import doobie._
import doobie.implicits._
import doobie.util.transactor.Transactor

object DoobieplaygroundApp extends IOApp.Simple:
  case class Student(id: Int, name: String)

  val xa: Transactor[IO] = Transactor.fromDriverManager[IO](
    driver = "org.postgresql.Driver",
    url = "jdbc:postgresql://localhost:5432/postgres",
    user = "docker",
    password = "docker",
    logHandler = None
  )

  def findAllStudentNames: IO[List[String]] =
    sql"select name from students"
      .query[String]
      .to[List]
      .transact(xa)

  def getVersion: IO[String] =
    sql"select version()".query[String].unique.transact(xa)

  def saveStudent(id: Int, name: String): IO[Int] =
    sql"insert into students(id, name) values ($id, $name)".update.run
      .transact(xa)
      .onError(_ => IO.println("error"))
      .handleErrorWith(_ => IO(0))

  val run = for
    _ <- getVersion
    _ <- saveStudent(1, "test")
    s <- findAllStudentNames
    _ <- IO.println(s) *> IO.println("done")
  yield ()
