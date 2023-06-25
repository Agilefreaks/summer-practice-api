FROM ruby:3.0.1-alpine

ARG HOST_URL

WORKDIR /app

RUN apk update \
  && apk upgrade \
  && apk add \
  git \
  curl \
  wget \
  bash \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-client \
  postgresql-dev \
  nodejs \
  && rm -rf /var/cache/apk/*

RUN gem install rake -v '13.0.3'
RUN gem install bundler -v '2.1.4'

# Prepare docs
WORKDIR /app/docs
COPY ./docs/Gemfile* ./
RUN bundle install -j4

# Prepare App
WORKDIR /app
COPY ./Gemfile* ./
RUN bundle install -j4

COPY . ./

RUN rake routes:generate && bash ./bin/deploy-docs.sh
