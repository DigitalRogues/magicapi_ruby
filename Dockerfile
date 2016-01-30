FROM phusion/baseimage:latest
MAINTAINER John Doe <john@doe.com>

ENV BUILD_PACKAGES bash ruby-dev build-essential
ENV RUBY_PACKAGES ruby ruby-bundler git

RUN apt-get update && apt-get install $BUILD_PACKAGES -y  && apt-get install $RUBY_PACKAGES -y

# Update and install all of the required packages.
# At the end, remove the apk cache
# RUN apk update && \
#     apk upgrade && \
#     apk add $BUILD_PACKAGES && \
#     apk add $RUBY_PACKAGES && \
#     rm -rf /var/cache/apk/*

RUN mkdir /usr/app
WORKDIR /usr/app

 COPY Gemfile /usr/app/
 COPY Gemfile.lock /usr/app/
 RUN bundle install
 CMD [ "rerun", "sinserver.rb" ]

# COPY . /usr/app
#RUN bundle install
EXPOSE 4567
