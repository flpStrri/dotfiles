#!/bin/bash

brew bundle --no-lock --file=/dev/stdin <<EOF

tap "homebrew/bundle"
tap "nikitabobko/tap"

brew "atuin"
brew "bat"
brew "eza"
brew "fd"
brew "forgit"
brew "fzf"
brew "git-delta"
brew "oh-my-posh"
brew "zellij"
brew "zoxide"
brew "zsh-autosuggestions"

brew "colima"
brew "docker"
brew "docker-buildx"
brew "docker-compose"
brew "docker-credential-helper"

brew "helix"
brew "httpie"
brew "gh"
brew "gitui"

brew "mise"
brew "rustup"
brew "typescript-language-server"

cask "aerospace", args: { force: true }
cask "1password", args: { force: true }
cask "alacritty", args: { force: true }
cask "discord", args: { force: true }
cask "firefox", args: { force: true }
cask "font-jetbrains-mono-nerd-font", args: { force: true }
cask "font-jetbrains-mono", args: { force: true }
cask "fork", args: { force: true }
cask "raycast", args: { force: true }
cask "slack", args: { force: true }
EOF

gh extension install dlvhdr/gh-dash
gh extension upgrade --all

