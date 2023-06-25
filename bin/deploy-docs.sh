#!/usr/bin/env bash

cd docs

readonly BUILD_DIR=../public/api/docs/
BUNDLE_GEMFILE=Gemfile bundle exec middleman build --build-dir=$BUILD_DIR --clean --verbose --bail
