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
brew install kitty starship zsh-autosuggestions gh trash dockutil jq difftastic httpie

brew install python@3.10 python@3.9 python@3.8 python@3.7 poetry
brew install rust rust-analyzer
brew install terraform hashicorp/tap/terraform-ls
brew install colima docker docker-credential-helper docker-compose minikube kubectl

brew install --cask raycast 1password 1password-cli appcleaner
brew install --cask fork paw
brew install helix
