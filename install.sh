#!/bin/sh

INSTALLATION_DIR=~/bin

printf "\033[2K\033[00;32mCreating a backup file of your vim files...\n\033[0m\n"

mv ~/.vimrc ~/.vimrc.bak

printf "\033[2K\033[00;32mBackup created in the ~/.vimrc.bac file\033[0m\n\n"

printf "\033[2K\033[00;32mDownloading project...\033[0m\n\n"
cd $INSTALLATION_DIR
git clone git@github.com:davydovanton/dotfiles.git
cd dotfiles

CURRENT_DIR=`pwd`

ln -sf $CURRENT_DIR/vim ~/.vim
ln -sf $CURRENT_DIR/vim/vimrc ~/.vimrc
ln -sf $CURRENT_DIR/vim/gvimrc ~/.gvimrc

ln -sf $CURRENT_DIR/zsh/zshrc ~/.zshrc
ln -sf $CURRENT_DIR/ctags ~/.ctags
ln -sf $CURRENT_DIR/tmux ~/.tmux.conf

ln -sf $CURRENT_DIR/ruby/rubocop.yml ~/.rubocop.yml
ln -sf $CURRENT_DIR/ruby/gemrc ~/.gemrc
ln -sf $CURRENT_DIR/ruby/irbrc ~/.irbrc

ln -sf $CURRENT_DIR/git/gitconfig ~/.gitconfig
ln -sf $CURRENT_DIR/git/gitignore_global ~/.gitignore_global
 

printf "\033[2K\033[00;32mInstalling vim plugins...\033[0m\n\n"
git submodule update --init

printf "\n\r\033[2K\033[00;32mInstallation finished.\nEnjoy your vim :)\033[0m\n"
