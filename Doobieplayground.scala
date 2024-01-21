//> using toolkit typelevel:0.1.21
//> using dependency org.tpolecat::doobie-core:1.0.0-RC4
//> using dependency org.tpolecat::doobie-postgres:1.0.0-RC4

import cats.effect.*
import doobie._
import doobie.implicits._
import cats.implicits._
import cats.syntax.all._
import cats.syntax._
import doobie.util.transactor.Transactor
import fs2.{Stream, text}
import fs2.io.file.{Files, Path}

object DoobieplaygroundApp extends IOApp.Simple:

  trait StudentRepository[F[_]]:
    def findAllStudentNames: F[List[String]]
    def getVersion: F[String]
    def saveStudent(id: Int, name: String): F[Int]

  object StudentRepository:
    def make[F[_]: Async]: StudentRepository[F] = new StudentRepository[F]:
      val xa: Transactor[F] = Transactor.fromDriverManager[F](
        driver = "org.postgresql.Driver",
        url = "jdbc:postgresql://localhost:5432/postgres",
        user = "docker",
        password = "docker",
        logHandler = None
      )

      def findAllStudentNames: F[List[String]] =
        sql"select name from students"
          .query[String]
          .to[List]
          .transact(xa)

      def getVersion: F[String] =
        sql"select version()".query[String].unique.transact(xa)

      def saveStudent(id: Int, name: String): F[Int] =
        sql"insert into students(id, name) values ($id, $name)".update.run
          .transact(xa)
  val resource = Stream.bracket(
    IO(StudentRepository.make[IO])
  )((x: StudentRepository[IO]) => x.getVersion *> IO.print("closing DB"))

  val run =
    (for
      repo    <- resource
      version <- Stream.eval(repo.getVersion)
      names   <- Stream.eval(repo.findAllStudentNames)
      _       <- Stream.eval(IO.println(version))
    yield ()).compile.drain
