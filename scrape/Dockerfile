FROM gliderlabs/alpine:3.3

COPY . /usr/app/

WORKDIR /usr/app

ENV DEV build-base ruby-dev libxml2-dev libxslt-dev
ENV RUNTIME tzdata libxml2 libxslt  ruby ruby-io-console ruby-bundler

#set the timezone so calls to time.new are in PST
ENV TZ=America/Los_Angeles

#ncurses readline libxml2 libxslt libevent libffi glib  openssl yaml zlib
  
RUN apk add --no-cache $DEV  $RUNTIME && bundle config build.nokogiri --use-system-libraries &&  bundle install && apk del $DEV \
&& ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone




CMD ["ruby","/usr/app/scrape.rb"]
