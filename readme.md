# ここを参考に環境構築 
http://d.hatena.ne.jp/holypp/20110515/1305443997

# コマンド
## for Vim 
    cd ~/
    git clone https://github.com/sue445/dotfiles.git
    ln -s ~/dotfiles/_vimrc ~/.vimrc
    ln -s ~/dotfiles/_gvimrc ~/.gvimrc
    ln -s ~/dotfiles/vimfiles ~/.vim

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
