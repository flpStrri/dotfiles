#!/bin/sh

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

DEVELOPMENT_DIR="$HOME/GitHub"
DOTFILES_DIR="$DEVELOPMENT_DIR/dotfiles"

printf "\e[1m\e[32m?\e[39m Enter your computer password to install software updates and Xcode dev tools:\e[0m\n"
sudo softwareupdate -i -a
xcode-select --install

mkdir -p $DEVELOPMENT_DIR
cd $DEVELOPMENT_DIR
git clone https://github.com/flpStrri/dotfiles.git
cd $DOTFILES_DIR
source etc/bootstrap-macos.sh
