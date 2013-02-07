# -*- encoding: utf-8 -*-

# Macでダウンロードしたファイルにつくアットマークを再帰的に削除する
# ref. http://d.hatena.ne.jp/kanonji/20100912/1284292517

dir = ARGV[0]

Dir.glob("#{dir}/**/*").each do |file|
  `xattr -d com.apple.metadata:kMDItemWhereFroms #{file}`
  `xattr -d com.apple.quarantine #{file}`
end
