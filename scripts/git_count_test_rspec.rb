#!/usr/bin/ruby

user = `git config --get user.name`.strip
until_commit = ARGV[0] || "master"
testcase_regexp = "^\\+ *it "

command = "git log --author=#{user} --remove-empty --oneline --unified=0 HEAD #{until_commit} | grep  -E '#{testcase_regexp}'"

p command
system(command)
system(command + " -c")
