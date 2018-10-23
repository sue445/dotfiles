#!/bin/bash

readonly BEFORE_VERSION=$1
readonly AFTER_VERSION=$2

if [ -z "$BEFORE_VERSION" ] || [ -z "$AFTER_VERSION" ]; then
  echo "Usage: update_ruby.sh <BEFORE_VERSION> <AFTER_VERSION>"
  exit 1
fi

if sed --version 2>/dev/null | grep -q GNU; then
  git grep -l ${BEFORE_VERSION} | grep -v Gemfile.lock | grep -e .ruby-version -e Gemfile -e wercker.yml -e .circleci/config.yml | xargs sed -i "s/${BEFORE_VERSION}/${AFTER_VERSION}/g"
else
  git grep -l ${BEFORE_VERSION} | grep -v Gemfile.lock | grep -e .ruby-version -e Gemfile -e wercker.yml -e .circleci/config.yml | xargs sed -i "" "s/${BEFORE_VERSION}/${AFTER_VERSION}/g"
fi

git commit -am "Upgrade to ruby ${AFTER_VERSION} :gem:"
