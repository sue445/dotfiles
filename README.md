# ここを参考に環境構築
http://d.hatena.ne.jp/holypp/20110515/1305443997

homebrew使うこと前提

# セットアップ
```sh
cd ~/
git clone https://github.com/sue445/dotfiles.git
cd dotfiles
./setup.sh
vi ~/.gitconfig.local

git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
# :NeoBundleInstall

source ~/.bash_profile

tm

# Install tmux plugin
prefix + I
```

### mergetoolにp4mergeを使う
    ln -s ~/dotfiles/scripts/p4merge /usr/local/bin/p4merge

* http://wadahiro.hatenablog.com/entry/20111115/1321372150
* http://d.hatena.ne.jp/nakamura001/20110321/1300699836

# Vimコマンド
## チートシート
http://www.namaraii.com/files/vim-cheatsheet.pdf

# Vimプラグイン
## NERDTreeのショートカット
http://vimwiki.net/?scripts%2F18

[![endorse](http://api.coderwall.com/sue445/endorsecount.png)](http://coderwall.com/sue445)

