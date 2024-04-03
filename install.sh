docker run -p 65432:5432 --name pg14-full -e POSTGRES_PASSWORD=mysecretpassword -d pgsql14-full-ext
docker cp pg14-full:/etc/locale.gen ./locale.gen