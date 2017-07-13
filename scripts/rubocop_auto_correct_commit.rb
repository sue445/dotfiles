# `rubocop --auto-correct --only COP` and `git commit`
# Usage: ruby rubocop_auto_correct_commit.rb

require "json"

rubocop_result = JSON.parse(`rubocop --format=json`)

cop_names = []
rubocop_result["files"].each do |file|
  cop_names += file["offenses"].map { |offense| offense["cop_name"] }
end
cop_names = cop_names.sort.uniq

cop_names.each do |cop_name|
  # Depending on the execution order, there is a possibility that the offences may increase.
  # So it is executed twice
  2.times do
    command = "rubocop --auto-correct --only #{cop_name}"

    ret = system command
    system "git commit -am '#{command}'" if ret
  end
end
