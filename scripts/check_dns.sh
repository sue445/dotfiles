#!/bin/bash -xe

# Usage
# check_dns.sh example.com <http|https>

readonly DNS=$1

if [ -n "$2" ]; then
  SCHEMA=$2
else
  SCHEMA="http"
fi

dig $DNS
curl -I "$SCHEMA://$DNS"
