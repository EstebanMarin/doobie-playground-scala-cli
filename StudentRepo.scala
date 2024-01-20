import cats.effect.*
import doobie._
import doobie.implicits._
import cats.implicits.catsSyntaxApplicativeError
import cats.syntax.all._
import cats.syntax._
import doobie.util.transactor.Transactor

trait StudentRepository[F[_]]:
  def findAllStudentNames: F[List[String]]
  def getVersion: F[String]
  def saveStudent(id: Int, name: String): F[Int]

object StudentRepository:
  def make[F[_]: Sync](xa: Transactor[F]): StudentRepository[F] = new StudentRepository[F]:
    val xa: Transactor[IO] = Transactor.fromDriverManager[IO](
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
