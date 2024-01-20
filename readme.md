# Scala-cli && docker-compose

Testing both tools and probably encountering a networking issue. 

### Prerequisites

What things you need to install the software and how to install them:
- Docker-compose
- Scala-cli
- 
## Question?

How can I run a `scala-cli` script that accesses a `docker-compose` resource?
What is the right `url` in [the transactor](https://github.com/EstebanMarin/doobie-playground-scala-cli/blob/1cc04f985fa5023e13fd776778f753575a4ae8d2/Doobieplayground.scala#L15) given that `docker-compose` does not expose the resource to the `scala-cli` script.

## Problem




```bash
$ docker-compose up .
//different shell or start detached 
$ scala-cli run .
❯ scala-cli run .
Compiling project (Scala 3.3.1, JVM (17))
Compiled project (Scala 3.3.1, JVM (17))
❯ scala-cli run .
org.postgresql.util.PSQLException: FATAL: role "postgres" does not exist
```


