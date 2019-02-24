#!/bin/sh -e

if [ -n "$1" ]; then
  master=$1
else
  master=`git remote show origin | grep 'HEAD branch:' | cut -d : -f 2 | tr -d '[[:space:]]'`
fi

current=`git branch | grep '*' | cut -f 2 -d ' '`

git checkout $master
git pull origin $master --ff-only

git checkout $current
git rebase $master
