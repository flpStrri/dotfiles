#!/bin/bash

which -s brew
if [[ $? != 0 ]]; then
  echo 'Installing Homebrew...'
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --upgrade --file=/dev/stdin <<EOF

brew "fish"
brew "zellij"
brew "fzf"
brew "less"
brew "git-delta"
brew "jq"
brew "zoxide"
brew "atuin"
brew "chezmoi"

brew "colima"
brew "docker"
brew "docker-buildx"
brew "docker-compose"
brew "docker-credential-helper"

brew "mise"
brew "helix"
brew "sst/tap/opencode"
brew "httpie"
brew "gh"
brew "git-delta"
brew "jj"
brew "uv"

cask "1password", args: { force: true }
cask "firefox", args: { force: true }

cask "font-jetbrains-mono-nerd-font", args: { force: true }
cask "font-jetbrains-mono", args: { force: true }

cask "ghostty", args: { force: true }
cask "raycast", args: { force: true }
cask "mouseless@preview", args: { force: true }
cask "fork", args: { force: true }

cask "slack", args: { force: true }
EOF
