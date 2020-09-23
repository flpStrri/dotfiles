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

pub=$HOME/.ssh/id_ed25519.pub
echo 'Checking for SSH key, generating one if it does not exist...'
    [[ -f $pub ]] || ssh-keygen -t ed25519

printf "\e[33m!\e[0m Copying public key to clipboard.\n"
[[ -f $pub ]] && cat $pub | pbcopy
printf "— \e[1mPress Enter\e[0m to open github.com in your browser, add a\e[1m\e[32m New SSH key\e[0m and come back here..."
    read user_wait
    open 'https://github.com/account/ssh'
    printf "\e[90m  After you add you SSH key to github.com \e[0m\e[1mPress Enter\e[0m\e[90m to continue...\e[0m\n"
    read user_wait

cd $DOTFILES_DIR
git remote set-url origin git@github.com:flpStrri/dotfiles.git

gh auth login --web
