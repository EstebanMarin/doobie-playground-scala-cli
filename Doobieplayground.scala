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
import org.checkerframework.checker.units.qual.s
import java.util.UUID
case class Customer(
    customerId: UUID,
    customerName: Option[String],
    contactName: Option[String],
    address: Option[String],
    city: Option[String],
    postalCode: Option[String],
    country: Option[String]
)

object DoobieplaygroundApp extends IOApp.Simple:

  trait StudentRepository[F[_]]:
    def findAllStudentNames: F[List[String]]
    def getVersion: F[String]
    def saveStudent(id: Int, name: String): F[Int]
    def getAllCustomers: F[List[Customer]]

  object StudentRepository:
    def make[F[_]: Async]: StudentRepository[F] = new StudentRepository[F]:
      val xa: Transactor[F] = Transactor.fromDriverManager[F](
        driver = "org.postgresql.Driver",
        url = "jdbc:postgresql://localhost:5432/postgres",
        user = "postgres",
        password = "postgres",
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

      given Meta[UUID] = Meta[String].timap(UUID.fromString)(_.toString)
      def getAllCustomers: F[List[Customer]] =
        sql"select * from customers"
          .query[Customer]
          .to[List]
          .transact(xa)

  val resource = Stream.bracket(
    IO(StudentRepository.make[IO])
  )((x: StudentRepository[IO]) => x.getVersion *> IO.print("closing DB"))

  val run =
    resource
      .flatMap { Repo =>
        Stream
          .eval(
            for
              version <- Repo.getVersion
              _       <- IO.println(version)
            // customers <- Repo.getAllCustomers
            // _ <- IO.println(customers)
            yield ()
          )
      }
      .compile
      .drain
