import cats.effect.*
import cats.implicits._
import cats.syntax.all._
import cats.syntax._
import doobie._
import doobie.implicits._
import doobie.util.transactor.Transactor

object StudentRepoService:
  trait StudentRepository[F[_]]:
    def findAllStudentNames(xa: Transactor[F]): F[List[String]]
    def getVersion(xa: Transactor[F]): F[String]
    def saveStudent(id: Int, name: String, xa: Transactor[F]): F[Int]

  object StudentRepository:
    def make[F[_]: Async]: StudentRepository[F] = new StudentRepository[F]:
      val xa: Transactor[F] = Transactor.fromDriverManager[F](
        driver = "org.postgresql.Driver",
        url = "jdbc:postgresql://localhost:5432/postgres",
        user = "docker",
        password = "docker",
        logHandler = None
      )
      def findAllStudentNames(xa: Transactor[F]): F[List[String]] =
        sql"select name from students"
          .query[String]
          .to[List]
          .transact(xa)

      def getVersion(xa: Transactor[F]): F[String] =
        sql"select version()".query[String].unique.transact(xa)

      def saveStudent(id: Int, name: String, xa: Transactor[F]): F[Int] =
        sql"insert into students(id, name) values ($id, $name)".update.run
          .transact(xa)
