# NOTE: This is deprecated. Use https://github.com/sue445/rubocop_auto_corrector

# `rubocop --auto-correct --only COP` and `git commit`
# Usage: ruby rubocop_auto_correct_commit.rb

require "json"

DEFAULT_ORDER = 100

# --auto-correctする時の実行順(数字が小さい方が先に実行される)
COP_ORDERS = {
  # Style/UnneededPercentQはStyle/StringLiteralsのようにシングルクオーテーション優先かダブルクオーテーション優先のようなconfigがない
  # https://github.com/bbatsov/rubocop/blob/v0.49.1/lib/rubocop/cop/style/unneeded_percent_q.rb
  # Style/StringLiteralsでダブルクオーテーションにした後でStyle/UnneededPercentQでシングルクオーテーション
  # になると再度Style/StringLiteralsをかける必要があり二度手間になってしまうので先にStyle/UnneededPercentQを実行した方がいい
  "Style/UnneededPercentQ" => 50,
}.tap { |hash| hash.default = DEFAULT_ORDER }

EXCLUDE_COPS = {
  "Lint/UnneededDisable" => "Lint/UnneededDisable can not be used with --only.",
}

# Depending on the execution order, there is a possibility that the offences may increase.
# So it is executed twice
2.times do
  rubocop_result = JSON.parse(`rubocop --parallel --format=json`)

  cop_names = []
  rubocop_result["files"].each do |file|
    cop_names += file["offenses"].map { |offense| offense["cop_name"] }
  end

  # 「第1ソートキー:COP_ORDERSに登録されてる実行順、第2ソートキー:cop名」の順でソートする
  cop_names = cop_names.uniq.sort_by { |cop_name| [COP_ORDERS[cop_name], cop_name] }

  cop_names.each do |cop_name|
    if EXCLUDE_COPS.keys.include?(cop_name)
      puts EXCLUDE_COPS[cop_name]
      next
    end

    command = "rubocop --auto-correct --only #{cop_name}"

    ret = system command
    system "git commit -am ':cop: #{command}'" if ret
  end
end

