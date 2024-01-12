# Project Name

## Introduction
Code for a Blog post, on how to introduce Scala at work.

## Getting Started
Let us take the docker compose file provided in the [official documentation](https://hub.docker.com/_/postgres)
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them:

- Docker
- Docker Compose
- scala-cli

### Installing

A step-by-step series of examples that tell you how to get a development environment running:

1. Clone the repository: `git clone https://github.com/username/project.git`
2. Navigate to the project directory: `cd project`
3. Build the Docker images: `docker-compose build`
4. Start the services: `docker-compose up`

## Running PSQL commands

Once you have ran 

```bash
$ docker-compose up
// 1 check the container's name
$ docker container ps
❯ docker container ps
CONTAINER ID   ...    NAMES
09890cf70bd5   ...    some-postgres
// 2 go to bash then psql, connect to postgres db
$ docker exec -it some-postgres bash
root@09890cf70bd5:/# psql -U postgres
psql (16.1 (Debian 16.1-1.pgdg120+1))
Type "help" for help.

postgres=# 
```

Commands that need to be continued

```bash
postgres=# CREATE DATABASE DEMO;
CREATE DATABASE
postgres=# \l
                                                      List of databases
   Name    |  Owner   | Encoding | Locale Provider |  Collate   |   Ctype    | ICU Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+------------+------------+------------+-----------+-----------------------
 demo      | postgres | UTF8     | libc            | en_US.utf8 | ......            |           | postgres=CTc/postgres
(4 rows)

postgres=# \c demo
You are now connected to database "demo" as user "postgres".
```

## Deployment

Add additional notes about how to deploy this on a live system.

## Built With

- [Docker](https://www.docker.com/) - The container platform used.

- [Docker Compose](https://docs.docker.com/compose/) - Tool for defining and running multi-container Docker applications.

## Authors

- **Your Name** - *Initial work* - [YourName](https://github.com/yourname)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration

- etc
