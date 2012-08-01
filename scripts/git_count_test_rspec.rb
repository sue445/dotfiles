#!/usr/bin/ruby

user = `git config --get user.name`.strip
until_commit = ARGV[0] || "master"
testcase_regexp = " *it "

plus_command = "git log --author=#{user} --remove-empty --oneline --unified=0 --ignore-all-space HEAD #{until_commit} | grep -E '^\\+#{testcase_regexp}' -c"
minus_command = "git log --author=#{user} --remove-empty --oneline --unified=0 --ignore-all-space HEAD #{until_commit} | grep -E '^-#{testcase_regexp}' -c"

p plus_command
p minus_command

plus_count = `#{plus_command}`.strip.to_i
minus_count = `#{minus_command}`.strip.to_i

p "plus=#{plus_count}, minus=#{minus_count}, diff=#{plus_count - minus_count}"

