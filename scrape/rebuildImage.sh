#!/bin/bash

docker rm magicscrape
docker rmi cawaker/magicscrape:0.1

docker build -t cawaker/magicscrape:0.2 .
docker push cawaker/magicscrape:0.2
curl https://cloud.docker.com/api/app/v1/service/3689a9df-3101-404a-adf6-bb3e7dc76ac5/trigger/3af6e5c2-005f-4075-a2d6-967e3d1e08d1/call/
#docker run --name magicscrape  -d  --link mongo-1.magicapi.302c2a25 cawaker/magicscrape:0.1

