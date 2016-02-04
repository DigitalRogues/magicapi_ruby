#!/bin/bash

docker rm rubyscrape
docker rmi cawaker/magicscrape-ruby:0.1

docker build -t cawaker/magicscrape-ruby:0.1 .
docker run --name rubyscrape  -d  cawaker/magicscrape-ruby:0.1

