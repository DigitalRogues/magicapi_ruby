#!/bin/bash

docker rm magicscrape
docker rmi cawaker/magicscrape:0.1

docker build -t cawaker/magicscrape:0.1 .
docker run --name magicscrape  -d  cawaker/magicscrape:0.1

