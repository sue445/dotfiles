# -*- encoding: utf-8 -*-

# Macでダウンロードしたファイルにつくアットマークを再帰的に削除する
# ref. http://d.hatena.ne.jp/kanonji/20100912/1284292517

path = ARGV[0]

if File.directory?(path)
  Dir.glob("#{path}/**/*").each do |file|
    system "xattr -d com.apple.metadata:kMDItemWhereFroms #{file}"
    system "xattr -d com.apple.quarantine #{file}"
  end
else
  system "xattr -d com.apple.metadata:kMDItemWhereFroms #{path}"
  system "xattr -d com.apple.quarantine #{path}"
end
