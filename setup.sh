#!/bin/bash -x

ln -s ~/dotfiles/_agignore  ~/.agignore
ln -s ~/dotfiles/_bashrc    ~/.bashrc
ln -s ~/dotfiles/_gitconfig ~/.gitconfig
ln -s ~/dotfiles/_gitignore ~/.gitignore
ln -s ~/dotfiles/_tigrc     ~/.tigrc
ln -s ~/dotfiles/_tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimfiles   ~/.vim
ln -s ~/dotfiles/_vimrc     ~/.vimrc
ln -s ~/dotfiles/_rbenv/default-gems ~/.rbenv/default-gems

cp -i ~/dotfiles/_gitconfig.local.example ~/.gitconfig.local
