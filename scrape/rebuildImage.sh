#!/bin/bash

docker rm magicscrape
docker rmi cawaker/magicscrape:0.2

docker build -t cawaker/magicscrape:0.2 .
docker push cawaker/magicscrape:0.2
#docker run --name magicscrape  -d  --link mongo-1.magicapi.302c2a25 cawaker/magicscrape:0.1

