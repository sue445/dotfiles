#!/bin/bash

# USAGE
# ./kit.sh <command>

sudo bundle exec serverkit $1 recipe.yml.erb --variables=variables.yml

