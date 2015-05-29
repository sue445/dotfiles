#!/bin/bash -x

ln -s _agignore  ~/.agignore
ln -s _bashrc    ~/.bashrc
ln -s _gitconfig ~/.gitconfig
ln -s _gitignore ~/.gitignore
ln -s _tigrc     ~/.tigrc
ln -s _tmux.conf ~/.tmux.conf
ln -s vimfiles   ~/.vim
ln -s _vimrc     ~/.vimrc
ln -s _rbenv/default-gems ~/.rbenv/default-gems

cp -i ~/dotfiles/_gitconfig.local.example ~/.gitconfig.local
