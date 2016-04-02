# magicapi_ruby
Disneyland stats scraped and posted to json - Ruby style

hosted at https://disney.digitalrecall.net

## Breakdown
the ecosystem is broken down into 3 components all running in Docker containers

1.  The api/server in the `api` folder
2.  The web scrape in `scraper` folder
3.  Mongo backend thats just an ephemeral docker container

## api folder
The api is build using `Sinatra` and just outputs some basic json at `/` wrapped in ``<pre>`` tags to make it easier to read and at `/json` is the raw json dump.
###  api files
  `server.rb` all the ruby code for sinatra and the web outputs

  `Gemfile*` related ruby code to easily run `bundle install` for the required gems

  `Dockerfile` docker file used to build the image and include required gems and `server.rb`

  `rebuildAPI.sh` bash script to make rebuilding the image and push it to my docker hub account easier.


## scrape folder
The scraper runs on a loop every 10 minutes and scrapes a couple disneyland related websites for bits of information, aggregates it, then dumps it into the mongo database.

### scrape files
  `scrape.rb` ruby code that loops and scrapes the websites for information

  `Gemfile*` related ruby code to easily run `bundle install` for the required gems

  `Dockerfile` docker file used to build the image and include required gems and `scrape.rb`

  `rebuildImage.sh` bash script to make rebuilding the image and push it to my docker hub account easier.

## Mongo DB
For simplicity sake, the mongodb is just a plain official mongo docker container that will only hang onto old data as long as that container is around, for my usage, I dont need to persist long term data.

# Usage
Usage is pretty simple, just need to install `docker` & `docker-compose`.

In the root folder there is a file `docker-compose.yml` this controls the docker process and launches the api, the scraper and the mongodb and allows them all to communicate.

`docker-compose up` will pull the images and start them up and from there you should be good to go. 
