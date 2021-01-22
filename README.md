# docker-compose-poc
POC of Docker Compose

This project specify a `docker-compose.yaml` file to orchestrate four containers, they are:

- app: The container that holds *PHP-FPM* with *Laravel*
- nginx: The Nginx container
- db: The MySql database container
- redis: The Redis container

The final generated image can be found [here](https://hub.docker.com/repository/docker/adrianokerber/laravel)