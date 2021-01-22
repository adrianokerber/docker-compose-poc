# docker-compose-poc

## POC of Docker-Compose

This project specify a `docker-compose.yaml` file to orchestrate four containers, they are:

- **app**: The container that holds *PHP-FPM* with *Laravel*
- **nginx**: The Nginx container
- **db**: The MySql database container
- **redis**: The Redis container

## Run docker-compose

Initialize all containers
```bash
docker-compose up -d
```
Shutdown all containers
```bash
docker-compose down
```
Initialize and build all containers
```bash
docker-compose up -d --build
```

## Docker command tips

Build Docker image locally
```bash
docker build -t adrianokerber/laravel .
```

Run Docker image on a container
```bash
docker run -d --name laravel -p 8000:8000 adrianokerber/laravel
```

Remove all Docker containers
```bash
docker rm $(docker ps -aq) -f
```

Interact with container using Bash (Note: <container_name> is the name of your target container)
```
docker exec -it <container_name> bash
```
Other useful commands:
```
# List running containers
docker ps

# List images
docker images

# Remove container
docker rm <container_id>

# Remove image
docker rmi <image_id>
```

> The final generated Docker image can be found on Docker Hub by clicking [here!](https://hub.docker.com/repository/docker/adrianokerber/laravel)