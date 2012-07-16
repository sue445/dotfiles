# ここを参考に環境構築 
http://d.hatena.ne.jp/holypp/20110515/1305443997

homebrew使うこと前提

# セットアップ 
## for Vim 
    cd ~/
    git clone https://github.com/sue445/dotfiles.git
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

### ついでに.gitignoreも管理する
    ln -s ~/dotfiles/_gitignore ~/.gitignore
    git config --global core.excludesfile $HOME/.gitignore

### rebaseでエラーが出るようになったら 
    git config --global core.editor /usr/bin/vim

### MacのターミナルでGitのブランチ名を表示する
http://d.hatena.ne.jp/ruedap/20110706/mac_terminal_git_branch_name

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
