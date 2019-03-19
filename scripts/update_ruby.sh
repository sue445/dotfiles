#!/bin/bash

type gsed
if [ $? -eq 0 ]; then
  # Use GNU sed instead of BSD sed (for Mac)
  # * BSD sed: preinstalled in Mac
  # * GNU sed: brew install GNU-sed
  readonly SED=gsed
else
  readonly SED=sed
fi

readonly BEFORE_VERSION=$1
readonly AFTER_VERSION=$2

if [ -z "$BEFORE_VERSION" ] || [ -z "$AFTER_VERSION" ]; then
  echo "Usage: update_ruby.sh <BEFORE_VERSION> <AFTER_VERSION>"
  exit 1
fi

git checkout master
git pull --ff
git checkout -b upgrade_ruby_${AFTER_VERSION}

git grep -l ${BEFORE_VERSION} | grep -v Gemfile.lock | grep -e .ruby-version -e Gemfile -e wercker.yml -e .circleci/config.yml -e .gitlab-ci.yml | xargs $SED -i ${SED_OPTION} "s/${BEFORE_VERSION}/${AFTER_VERSION}/g"

readonly BEFORE_MINOR_VERSION="$(echo $BEFORE_VERSION | cut -d '.' -f 1).$(echo $BEFORE_VERSION | cut -d '.' -f 2)"
readonly AFTER_MINOR_VERSION="$(echo $AFTER_VERSION | cut -d '.' -f 1).$(echo $AFTER_VERSION | cut -d '.' -f 2)"

git grep -l ${BEFORE_MINOR_VERSION} | grep -e .rubocop.yml | xargs $SED -i "s/TargetRubyVersion: ${BEFORE_MINOR_VERSION}/TargetRubyVersion: ${AFTER_MINOR_VERSION}/g"

git commit -am "Upgrade to ruby ${AFTER_VERSION} :gem:"
