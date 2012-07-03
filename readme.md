ここを参考に環境構築

http://d.hatena.ne.jp/holypp/20110515/1305443997

    cd ~/
    git clone https://github.com/sue445/dotfiles.git
    ln -s ~/dotfiles/_vimrc ~/.vimrc
    ln -s ~/dotfiles/_gvimrc ~/.gvimrc
    ln -s ~/dotfiles/vimfiles ~/.vim
    git submodule init
    git submodule update 
    gem install ri_vim && ri_vim_install

    ln -s ~/dotfiles/_gitignore ~/.gitignore
    git config --global core.excludesfile $HOME/.gitignore
    git config --global core.editor /usr/bin/vim
