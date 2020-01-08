FROM ruby:2.5.1-alpine3.7

RUN apk add --update build-base postgresql-dev tzdata
RUN gem install bundler

WORKDIR /snoopville-api
ADD Gemfile Gemfile.lock /snoopville-api/
RUN bundle install

ADD app config.ru public test bin db lib Rakefile config README.md /snoopville-api/
CMD ["puma"]
