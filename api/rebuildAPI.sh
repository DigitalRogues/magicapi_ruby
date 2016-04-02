#!/bin/bash

docker stop magicapi
docker rm magicapi
docker rmi cawaker/magicapi:0.1

docker build  -t cawaker/magicapi:0.2 .
docker push cawaker/magicapi:0.2
#docker run -d --name magicapi --restart=always -p 80:4567 cawaker/magicapi:0.1
