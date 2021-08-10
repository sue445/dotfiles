#!/bin/bash -xe

readonly MITAMAE_OPTIONS="$1"

./bin/mitamae local --node-yaml=node.yml bootstrap.rb $MITAMAE_OPTIONS
