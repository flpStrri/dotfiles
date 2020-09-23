#!/usr/bin/env zsh

which -s brew
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Homebrew packages
# --------
brew install pyenv postgresql poetry gh trash mas terraform pre-commit
brew cask install docker pycharm-ce 1password visual-studio-code fork appcleaner discord insomnia liteicon mater postico zoomus whatsapp slack amazon-chime microsoft-excel
mv /Applications/PyCharm\ CE.app/ /Applications/PyCharm.app/
brew install docker-compose
brew tap homebrew/cask-fonts
brew cask install font-jetbrains-mono 