#!/bin/sh

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

DEVELOPMENT_DIR="$HOME/GitHub"
DOTFILES_DIR="$DEVELOPMENT_DIR/dotfiles"

mkdir -p $DEVELOPMENT_DIR
cd $DEVELOPMENT_DIR
git clone https://github.com/flpStrri/dotfiles.git
cd $DOTFILES_DIR
source etc/bootstrap-macos.sh
