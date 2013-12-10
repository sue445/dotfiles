# -*- encoding: utf-8 -*-

# Macでダウンロードしたファイルにつくアットマークを再帰的に削除する
# ref. http://d.hatena.ne.jp/kanonji/20100912/1284292517

path = ARGV[0]

ATTRIBUTES = %w(
  com.apple.metadata:kMDItemWhereFroms
  com.apple.quarantine
  com.apple.FinderInfo
)

def rm_xttr(path)
  ATTRIBUTES.each do |attr|
    system "xattr -d #{attr} #{path} >/dev/null 2>&1"
  end
end

if File.directory?(path)
  Dir.glob("#{path}/**/*").each do |file|
    rm_xttr(file)
  end
else
  rm_xttr(path)
end
