# `rubocop --auto-correct --only COP` and `git commit`
# Usage: ruby rubocop_auto_correct_commit.rb

require "json"

rubocop_result = JSON.parse(`rubocop --display-cop-names --format=json`)

cop_names = []
rubocop_result["files"].each do |file|
  cop_names += file["offenses"].map { |offense| offense["cop_name"] }
end
cop_names = cop_names.sort.uniq

cop_names.each do |cop_name|
  command = "rubocop --auto-correct --only #{cop_name}"

  ret = system command
  system "git commit -am '#{command}'" if ret
end
