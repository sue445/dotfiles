#!/bin/bash

readonly BEFORE_VERSION=$1
readonly AFTER_VERSION=$2

if [ -z "$BEFORE_VERSION" ] || [ -z "$AFTER_VERSION" ]; then
  echo "Usage: update_ruby.sh <BEFORE_VERSION> <AFTER_VERSION>"
  exit 1
fi

git checkout master
git pull --ff-only
git checkout -b upgrade_ruby_${AFTER_VERSION}

if sed --version 2>/dev/null | grep -q GNU; then
  SED_OPTION="-i"
else
  SED_OPTION="-i ''"
fi

git grep -l ${BEFORE_VERSION} | grep -v Gemfile.lock | grep -e .ruby-version -e Gemfile -e wercker.yml -e .circleci/config.yml -e .gitlab-ci.yml | xargs sed ${SED_OPTION} "s/${BEFORE_VERSION}/${AFTER_VERSION}/g"

readonly BEFORE_MINOR_VERSION="$(echo $BEFORE_VERSION | cut -d '.' -f 1).$(echo $BEFORE_VERSION | cut -d '.' -f 2)"
readonly AFTER_MINOR_VERSION="$(echo $AFTER_VERSION | cut -d '.' -f 1).$(echo $AFTER_VERSION | cut -d '.' -f 2)"

git grep -l ${BEFORE_MINOR_VERSION} | grep -e .rubocop.yml | xargs sed ${SED_OPTION} "s/${BEFORE_MINOR_VERSION}/${AFTER_MINOR_VERSION}/g"

git commit -am "Upgrade to ruby ${AFTER_VERSION} :gem:"
