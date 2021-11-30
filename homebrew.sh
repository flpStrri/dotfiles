#!/usr/bin/env zsh

which -s brew
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Homebrew packages
# --------
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono 
brew install starship zsh-autosuggestions postgresql poetry gh trash mas awscli terraform pre-commit dockutil duti
brew install python@3.10 python@3.9 python@3.8 python@3.7
brew install --cask docker pycharm 1password visual-studio-code fork appcleaner mater zoom whatsapp slack amazon-chime netnewswire paw gpg pritunl meetingbar
