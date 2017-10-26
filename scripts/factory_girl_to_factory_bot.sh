#!/bin/bash -x

type gsed
if [ $? -eq 0 ]; then
  # Use GNU sed instead of BSD sed (for Mac)
  # * BSD sed: preinstalled in Mac
  # * GNU sed: brew install GNU-sed
  SED=gsed
else
  SED=sed
fi

function run_and_commit() {
  local command=$1
  sh -c "$command"

  `git status` | grep "nothing to commit, working directory clean"

  if [ $? -ne 0 ]; then
    git commit -am "$command"
  fi
}

run_and_commit "git grep -l factory_girl | xargs $SED -i 's/factory_girl/factory_bot/g'"
run_and_commit "git grep -l FactoryGirl | xargs $SED -i 's/FactoryGirl/FactoryBot/g'"

run_and_commit "bundle update factory_bot --conservative"
run_and_commit "bundle update factory_bot_rails --conservative"
