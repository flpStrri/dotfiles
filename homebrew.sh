#!/usr/bin/env zsh

which -s brew
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Homebrew packages
# --------
brew install postgresql poetry gh trash mas terraform pre-commit dockutil duti
brew install python@3.9 python@3.8 python@3.7
brew install --cask docker pycharm 1password visual-studio-code fork appcleaner liteicon mater zoomus whatsapp slack amazon-chime microsoft-excel netnewswire paw gpg-suite-no-mail pritunl meetingbar
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono 
