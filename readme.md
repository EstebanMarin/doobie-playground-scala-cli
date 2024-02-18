# Scala-cli && docker-compose

Database based on https://www.w3schools.com/postgresql/postgresql_create_demodatabase.php

```bash
docker run -d\
  --name postgres \
  --restart always \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=postgres \
  -p 5432:5432 postgres
```

```bash
//removing name
docker run -d\
  --restart always \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=postgres \
  -p 5432:5432 postgres
```