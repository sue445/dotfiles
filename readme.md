# ここを参考に環境構築 
http://d.hatena.ne.jp/holypp/20110515/1305443997

# セットアップ 
## for Vim 
    cd ~/
    git clone https://github.com/sue445/dotfiles.git
    ln -s ~/dotfiles/_vimrc ~/.vimrc
    ln -s ~/dotfiles/_gvimrc ~/.gvimrc
    ln -s ~/dotfiles/vimfiles ~/.vim

### for mkdpreview-vim
https://github.com/mattn/mkdpreview-vim#installation

にもあるように他にbundle以外にもいろいろ必要

* Macだとcurl以外全部
* Pythonは公式ホームページから落としたやつじゃないとPyQt4のインストール時にエラーになる
    * brewで入れたのだとダメ

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
