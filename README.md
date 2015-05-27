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
```

#### curl
Macならデフォルトで入ってる

### MacのターミナルでGitのブランチ名を表示やタブ補完したい
* 下記を参考に `.bash_profile` に追記
 * http://sue445.hatenablog.com/entry/2012/08/30/005627
 * http://blog.ruedap.com/entry/20110706/mac_terminal_git_branch_name
* ただしbrewでインストールした時点で下記のようにエイリアスが張られるため、git-completion.bashの個別インストールは不要

```
$ ll /usr/local/etc/bash_completion.d/git-completion.bash
lrwxr-xr-x  1 sue445  admin  65  8 29 10:27 /usr/local/etc/bash_completion.d/git-completion.bash -> ../../Cellar/git/1.7.12/etc/bash_completion.d/git-completion.bash
```

* これでok

``` bash
source /usr/local/etc/bash_completion.d/git-completion.bash
```

* 別ファイルからincludeする場合はこんな感じ
  * [scripts/bash_completion_git.sh](scripts/bash_completion_git.sh)

### mergetoolにp4mergeを使う
    ln -s ~/dotfiles/scripts/p4merge /usr/local/bin/p4merge

* http://wadahiro.hatenablog.com/entry/20111115/1321372150
* http://d.hatena.ne.jp/nakamura001/20110321/1300699836

## tig
* コンソールから使える git ブラウザ、tig が超便利 - #生存戦略 、それは - subtech
 * http://subtech.g.hatena.ne.jp/secondlife/20101114/1289736508

に影響されて入れてみた

Macなら `brew install tig` でOK

## tmux
* tmuxのすすめ | catatsuyのblog
 * http://blog.catatsuy.org/a/243

に影響されていれてみた

Macなら `brew install tmux` でOK

* tmuxを管理者権限の無いユーザーで$HOMEにインストール | 身の回りの観測問題
  * http://minomawari.jp/2014/04/09/how-to-install-tmux-for-non-root-users/

# Vimコマンド
## チートシート
http://www.namaraii.com/files/vim-cheatsheet.pdf

# Vimプラグイン
## NERDTreeのショートカット
http://vimwiki.net/?scripts%2F18

# RubyとvimでQuick JUnit風にテスト実行
http://qiita.com/items/69035c454de416849b8a

* 「Could not locate Gemfile」って出たらcdする

[![endorse](http://api.coderwall.com/sue445/endorsecount.png)](http://coderwall.com/sue445)

