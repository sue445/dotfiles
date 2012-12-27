# ここを参考に環境構築
http://d.hatena.ne.jp/holypp/20110515/1305443997

homebrew使うこと前提

# セットアップ
## for Vim
    cd ~/

    git clone https://github.com/sue445/dotfiles.git
    git submodule init
    git submodule update

または

    git clone --recursive https://github.com/sue445/dotfiles.git

clone時に `--recursive` をつけることでsubmoduleも同時にcloneできる

    ln -s ~/dotfiles/_vimrc ~/.vimrc
    ln -s ~/dotfiles/_gvimrc ~/.gvimrc
    ln -s ~/dotfiles/vimfiles ~/.vim

### for mkdpreview-vim
* https://github.com/mattn/mkdpreview-vim#installation
* http://tell-k.hatenablog.com/entry/2012/02/11/015727

にもあるように他にbundle以外にもいろいろ必要

#### Python
Macだとデフォルトで入ってる

#### PyQt4
brewで入れるのが楽だけど時間がかかる

    brew install pyqt
    export PYTHONPATH=/usr/local/lib/Python

#### Markdown in Python
    easy_install ElementTree
    easy_install Markdown

or

    git clone git://github.com/waylan/Python-Markdown.git python-markdown
    cd python-markdown
    python setup.py install

#### curl
Macならデフォルトで入ってる

#### webapi-vim
bundleに記載済


### for taglist.vim
Exuberant Ctagsを先に入れる

    brew install ctags

### for vim-proc
http://d.hatena.ne.jp/shepherdMaster/20120408/1333900076

    cd ~/dotfiles/vimfiles/bundle/vimproc/
    rm autoload/*.so
    make -f make_mac.mak

## for Git
### submoduleを更新する
    git submodule foreach 'git checkout master; git pull'
    git commit -am "update submodule"
http://d.hatena.ne.jp/rochefort/20110410/p1

### ついでに.gitignoreと.gitconfigも管理する
    ln -s ~/dotfiles/_gitignore ~/.gitignore
    ln -s ~/dotfiles/_gitconfig ~/.gitconfig

    git config --global --includes -l

で設定が反映されていることを確認する

http://d.hatena.ne.jp/z3100/20120505/1336203155

ローカル固有の設定は ~/.gitconfig.local に置く

#### .gitconfig.local
    [user]
      name = sue445
      email = *********************

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
 * https://github.com/sue445/dotfiles/blob/master/bash_completion_git.sh

### mergetoolにp4mergeを使う
    ln -s ~/dotfiles/scripts/p4merge /usr/local/bin/p4merge

* http://wadahiro.hatenablog.com/entry/20111115/1321372150
* http://d.hatena.ne.jp/nakamura001/20110321/1300699836

## tig
* コンソールから使える git ブラウザ、tig が超便利 - #生存戦略 、それは - subtech
 * http://subtech.g.hatena.ne.jp/secondlife/20101114/1289736508

に影響されて入れてみた

Macなら `brew install tig` でOK

    ln -s ~/dotfiles/_tigrc ~/.tigrc

# Vimコマンド
## チートシート
http://www.namaraii.com/files/vim-cheatsheet.pdf

## よく使う
### Markdownのプレビュー（初回時）
    :MkdPreview!

### Markdownのプレビュー（2回目以降）
    :MkdPreview

# Vimプラグイン
## NERDTreeのショートカット
http://vimwiki.net/?scripts%2F18

# RubyとvimでQuick JUnit風にテスト実行
http://qiita.com/items/69035c454de416849b8a

* 「Could not locate Gemfile」って出たらcdする

[![endorse](http://api.coderwall.com/sue445/endorsecount.png)](http://coderwall.com/sue445)
