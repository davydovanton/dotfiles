#!/bin/sh

INSTALLATION_DIR=~/bin

printf "\033[2K\033[00;32mCreating a backup file of your vim files...\n\033[0m\n"

cp ~/.vimrc ~/.vimrc.orig
cp ~/.zshrc ~/.zshrc.orig

printf "\033[2K\033[00;32mBackup created! \033[0m\n\n"

printf "\033[2K\033[00;32mDownloading project...\033[0m\n\n"
cd $INSTALLATION_DIR
git clone git@github.com:davydovanton/dotfiles.git
cd dotfiles

CURRENT_DIR=`pwd`

ln -sf $CURRENT_DIR/git/git_template ~/.git_template

ln -sf $CURRENT_DIR/vim ~/.vim
ln -sf $CURRENT_DIR/vim/vimrc ~/.vimrc
ln -sf $CURRENT_DIR/vim/gvimrc ~/.gvimrc

curl -L http://install.ohmyz.sh | sh
cp -sf $CURRENT_DIR/zsh/themes/excess.zsh-theme ~/.oh-my-zsh/themes/excess.zsh-theme
ln -sf $CURRENT_DIR/zsh/zshrc ~/.zshrc

ln -sf $CURRENT_DIR/ctags ~/.ctags
ln -sf $CURRENT_DIR/tmux ~/.tmux.conf

ln -sf $CURRENT_DIR/ruby/rubocop.yml ~/.rubocop.yml
ln -sf $CURRENT_DIR/ruby/gemrc ~/.gemrc
ln -sf $CURRENT_DIR/ruby/irbrc ~/.irbrc

cp -sf $CURRENT_DIR/iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

ln -sf $CURRENT_DIR/git/gitconfig ~/.gitconfig
ln -sf $CURRENT_DIR/git/gitignore_global ~/.gitignore_global
ln -sf $CURRENT_DIR/git/hooks/post-commit ~/.git/hooks/post-commit
 
printf "\033[2K\033[00;32mInstalling vim plugins...\033[0m\n\n"
git submodule update --init

printf "\n\r\033[2K\033[00;32mInstallation finished.\nEnjoy your vim :)\033[0m\n"
