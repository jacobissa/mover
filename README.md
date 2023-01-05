# MOVER

MOVER watches a source directory and moves its content into a target directory

Example docker-compose.yml
```
version: "3.9"

services:
  mover:
    container_name: mover
    image: jacobissa/mover:latest
    volumes:
      - /home/pi/docker/mover/source:/app/source
      - /home/pi/docker/mover/target:/app/target
      - /home/pi/docker/mover/logs:/app/logs
    restart: unless-stopped
```
