
# Docker Cheat Sheet — essential commands

This file contains a concise list of commonly used Docker commands grouped by category. Copy-paste the examples and adapt flags as needed.

## Images

- **List images**
	```bash
	docker images
	```
- **Pull image**
	```bash
	docker pull nginx:latest
	```
- **Remove image**
	```bash
	docker rmi <image>:<tag>
	```

## Containers

- **Run (detached)**
	```bash
	docker run -d --name myapp -p 8080:80 nginx:latest
	```
- **Run interactive shell (temporary)**
	```bash
	docker run -it --rm ubuntu:latest /bin/bash
	```
- **List containers**
	```bash
	docker ps
	docker ps -a   # include stopped containers
	```
- **Stop / Start / Restart**
	```bash
	docker stop myapp
	docker start myapp
	docker restart myapp
	```
- **Remove container**
	```bash
	docker rm myapp
	```

## Logs, Exec & Inspect

- **View logs (follow)**
	```bash
	docker logs -f myapp
	```
- **Execute in running container**
	```bash
	docker exec -it myapp /bin/sh
	```
- **Inspect metadata**
	```bash
	docker inspect myapp
	```

## Build

- **Build image from Dockerfile**
	```bash
	docker build -t myapp:1.0 .
	```
- **Build without cache**
	```bash
	docker build --no-cache -t myapp:1.0 .
	```

## Registry (push / pull)

- **Login to registry**
	```bash
	docker login
	```
- **Tag & push**
	```bash
	docker tag myapp:1.0 myuser/myapp:1.0
	docker push myuser/myapp:1.0
	```

## Volumes & Bind mounts

- **Create / list volumes**
	```bash
	docker volume create mydata
	docker volume ls
	```
- **Run with named volume**
	```bash
	docker run -d -v mydata:/var/lib/postgres --name db postgres:14
	```
- **Bind mount (host path)**
	```bash
	docker run -v $(pwd):/app -w /app node:18 node index.js
	```

## Networks

- **List networks**
	```bash
	docker network ls
	```
- **Create & use network**
	```bash
	docker network create mynet
	docker run --network mynet --name a alpine sleep 1000
	```

## System & Cleanup

- **Show disk usage**
	```bash
	docker system df
	```
- **Prune unused resources**
	```bash
	docker system prune      # careful: removes stopped containers, dangling images, networks
	docker system prune -a   # also removes unused images
	```
- **Stop / remove all containers**
	```bash
	docker kill $(docker ps -q)
	docker rm $(docker ps -aq)
	```

## Docker Compose

- **Start services (detached)**
	```bash
	docker compose up -d
	```
- **Stop & remove**
	```bash
	docker compose down
	```
- **Rebuild and restart**
	```bash
	docker compose up --build -d
	```

---

If you want, I can also:
- add examples tailored to this project, or
- create a short `Makefile` with common docker tasks, or
- commit the change for you.
