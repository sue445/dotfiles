#!/bin/bash

# ex)
# vi ~/.bash_profile
#
# alias rake-dev='~/dotfiles/scripts/rake-dev.sh'

echo "[START] bundle exec rake $1 RAILS_ENV=development"
bundle exec rake $1 RAILS_ENV=development

RET=$?
if [ $RET -ne 0 ]; then
  exit $RET
fi

echo "[END]   bundle exec rake $1 RAILS_ENV=development"

echo "[START] bundle exec rake $1 RAILS_ENV=test"
bundle exec rake $1 RAILS_ENV=test
echo "[END]   bundle exec rake $1 RAILS_ENV=test"

