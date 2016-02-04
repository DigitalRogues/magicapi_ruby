#!/bin/bash

docker stop rubyapi
docker rm rubyapi
docker rmi cawaker/magicapi-ruby:0.1

docker build  -t cawaker/magicapi-ruby:0.1 .
docker run -d --name rubyapi -p 80:4567 cawaker/magicapi-ruby:0.1
