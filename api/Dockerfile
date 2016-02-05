FROM gliderlabs/alpine:3.3

COPY . /usr/app/

WORKDIR /usr/app

ENV DEV curl-dev ruby-dev build-base

ENV RUNTIME tzdata libxml2 libxslt libevent libffi ruby ruby-io-console ruby-bundler

#ncurses readline glib zlib yaml openssl
  
RUN apk add --no-cache $DEV  $RUNTIME && bundle install && apk del $DEV




CMD ["ruby","/usr/app/server.rb"]
