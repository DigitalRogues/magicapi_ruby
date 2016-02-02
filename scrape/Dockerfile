FROM ruby:latest

RUN mkdir /usr/app
WORKDIR /usr/app

#set the timezone so calls to time.new are in PST
ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY . /usr/app
RUN bundle install

CMD ["ruby","/usr/app/scrape.rb"]
