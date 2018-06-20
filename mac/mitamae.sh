#!/bin/bash -xe

readonly MITAMAE_OPTIONS="$1"

./bin/mitamae-x86_64-darwin local --node-yaml=node.yml homebrew.rb $MITAMAE_OPTIONS
