# -*- encoding: utf-8 -*-

# Macでダウンロードしたファイルにつくアットマークを再帰的に削除する
# ref. http://d.hatena.ne.jp/kanonji/20100912/1284292517

path = ARGV[0]

if File.directory?(path)
  Dir.glob("#{path}/**/*").each do |file|
    `xattr -d com.apple.metadata:kMDItemWhereFroms #{file}`
    `xattr -d com.apple.quarantine #{file}`
  end
else
  `xattr -d com.apple.metadata:kMDItemWhereFroms #{path}`
  `xattr -d com.apple.quarantine #{path}`
end
