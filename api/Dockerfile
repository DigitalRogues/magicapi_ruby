FROM gliderlabs/alpine:3.3

COPY . /usr/app/

WORKDIR /usr/app

ENV DEV curl-dev ruby-dev build-base

ENV RUNTIME tzdata libxml2 libxslt libevent libffi ruby ruby-io-console ruby-bundler

#set the timezone so calls to time.new are in PST
ENV TZ=America/Los_Angeles

#ncurses readline glib zlib yaml openssl
  
RUN apk add --no-cache $DEV  $RUNTIME && bundle install && apk del $DEV && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone




CMD ["ruby","/usr/app/server.rb"]
