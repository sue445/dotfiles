#!/bin/bash -xe

# ex)
# vi ~/.bash_profile
#
# alias rake-dev='~/dotfiles/scripts/rake-dev.sh'

# support both rails and padrino
RAILS_ENV=development RACK_ENV=development bundle exec rake $1
RAILS_ENV=test RACK_ENV=test bundle exec rake $1

