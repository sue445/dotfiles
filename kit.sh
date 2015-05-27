#!/bin/bash

# run servetkit
#
# USAGE
# ./kit.sh <command>

if [ -n "$1" ]; then
  COMMAND=$1
else
  # default command is "apply"
  COMMAND="apply"
fi

bundle exec serverkit $COMMAND recipe.yml.erb --variables=variables.yml

