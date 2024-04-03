docker run -p 65432:5432 --name pg14-full -e POSTGRES_PASSWORD=mysecretpassword -d psql-full-ext:14-1.0
docker exec -it pg14-full /bin/bash

docker exec -it pg14-full /bin/bash

# docker cp pg14-full:/etc/locale.gen ./locale.gen