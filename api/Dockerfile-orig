FROM ruby:alpine

RUN mkdir /usr/app
WORKDIR /usr/app

#set the timezone so calls to time.new are in PST
#ENV TZ=America/Los_Angeles
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY . /usr/app

RUN apk add --update \
  build-base tzdata\
  && rm -rf /var/cache/apk/* && bundle install && apk del build-base

#RUN bundle install

EXPOSE 4567

CMD ["ruby","/usr/app/server.rb"]
