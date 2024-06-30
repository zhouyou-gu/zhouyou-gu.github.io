FROM ruby:latest as jekyll

RUN apt-get update && apt-get install -y --no-install-recommends \
    ruby-dev\
    ruby-bundler\
    nodejs\
    build-essential \
    git

RUN mkdir /srv/jekyll

ADD Gemfile /srv/jekyll

WORKDIR /srv/jekyll

RUN bundle install 
# && rm -rf /var/lib/gems/3.1.0/cache
EXPOSE 8080

CMD ["jekyll", "serve", "-l", "-H", "0.0.0.0", "-P", "8080" ]