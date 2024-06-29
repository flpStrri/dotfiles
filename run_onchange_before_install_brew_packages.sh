#!/bin/bash

brew bundle --no-lock --file=/dev/stdin <<EOF

brew "atuin"
brew "bat"
brew "eza"
brew "fd"
brew "forgit"
brew "fzf"
brew "starship"
brew "trash"
brew "zsh-autosuggestions"

brew "colima"
brew "docker"
brew "docker-buildx"
brew "docker-compose"
brew "docker-credential-helper"

brew "helm"
brew "istioctl"
brew "minikube"

brew "helix"
brew "httpie"
brew "rustup-init"

cask "1password", args: { force: true }
cask "discord", args: { force: true }
cask "firefox", args: { force: true }
cask "font-jetbrains-mono-nerd-font", args: { force: true }
cask "font-jetbrains-mono", args: { force: true }
cask "fork", args: { force: true }
cask "kitty", args: { force: true }
cask "raycast", args: { force: true }
cask "slack", args: { force: true }
cask "zed", args: { force: true }

EOF
