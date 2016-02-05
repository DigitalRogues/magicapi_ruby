FROM ruby:alpine

RUN mkdir /usr/app
WORKDIR /usr/app


RUN apk add --update \
  build-base tzdata\
  libxml2-dev \
  libxslt-dev \
  && bundle config build.nokogiri --use-system-libraries && bundle install &&  rm -rf /var/cache/apk/* && apk del build-base

#set the timezone so calls to time.new are in PST
#ENV TZ=America/Los_Angeles
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


COPY . /usr/app
#RUN bundle config build.nokogiri --use-system-libraries
#RUN bundle install

CMD ["ruby","/usr/app/scrape.rb"]
