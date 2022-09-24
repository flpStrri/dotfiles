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
brew install kitty starship zsh-autosuggestions gh trash dockutil duti cookiecutter jq difftastic

brew tap homebrew/cask-drivers
brew install logitech-g-hub

brew install python@3.10 python@3.9 python@3.8 python@3.7 poetry
brew install rust rust-analyzer
brew install elixir elixir-ls
brew install terraform hashicorp/tap/terraform-ls
brew install postgresql@14
mkdir -p /usr/local/opt/postgresql/lib
ln -s /usr/local/opt/postgresql@14/lib/postgresql@14/libpq.5.dylib /usr/local/opt/postgresql/lib/libpq.5.dylib

brew install --cask raycast 1password appcleaner slack firefox
brew install --cask docker pycharm fork paw postman
brew install helix

# AB InBev Specific
brew install --cask zoom pritunl
