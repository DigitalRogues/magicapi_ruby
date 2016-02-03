#!/bin/sh
docker stop mongo-prod
docker rm mongo-prod

docker run --name mongo-prod --volumes-from data-mongo -p 27017:27017 -d --restart=always cawaker/mongo:3.0.9 mongod --auth
