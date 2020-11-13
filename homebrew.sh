#!/usr/bin/env zsh

which -s brew
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Homebrew packages
# --------
brew install pyenv postgresql poetry gh trash mas terraform pre-commit dockutil duti
brew cask install docker pycharm 1password visual-studio-code fork appcleaner discord insomnia liteicon mater postico zoomus whatsapp slack amazon-chime microsoft-excel netnewswire paw
brew install docker-compose
brew tap homebrew/cask-fonts
brew cask install font-jetbrains-mono 
