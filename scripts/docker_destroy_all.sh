#!/bin/bash -x

# via. https://gist.github.com/JeffBelback/5687bb02f3618965ca8f

# Stop all containers
docker stop $(docker ps -a -q)
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
# Delete all volumes
docker volume rm $(docker volume ls -q)
