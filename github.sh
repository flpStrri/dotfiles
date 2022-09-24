#!/usr/bin/env zsh

DEVELOPMENT_DIR="$HOME/GitHub"
DOTFILES_DIR="$DEVELOPMENT_DIR/dotfiles"

printf "\e[1m\e[32m?\e[39m Enter new hostname of the machine:\e[0m "
read hostname
scutil --set HostName "$hostname"
compname=$(sudo scutil --get HostName | tr '-' '.')
scutil --set ComputerName "$compname"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$compname"
printf "\e[90mHostname has been set to $hostname and computer name to $compname.\e[0m\n\n"

printf "\e[90m  Configure 1Password account ... \e[0m\e[1mPress Enter\e[0m\e[90m to continue...\e[0m\n"
read user_wait

cd $DOTFILES_DIR
git remote set-url origin git@github.com:flpStrri/dotfiles.git

gh auth login --web
