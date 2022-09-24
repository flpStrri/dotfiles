#!/usr/bin/env zsh

printf "— \e[1mPress Enter\e[0m to start updating the Mac OS preferences..."
    read user_wait

source 'homebrew.sh'
source 'github.sh'
source 'macos.sh'
source 'etc/symlink-dotfiles.sh'
chmod -R go-w "$(brew --prefix)/share"

printf "\n\e[33m!\e[0m \e[1mFinish by doing this manual tasks:\e[0m\n"
    printf "%s\n" \
    "- Install fonts from iCloud folder;" \
    "— Install Camera Settings: https://support.logi.com/hc/en-ca/articles/360049055854;" \
    "— Install Citrix Workspace: https://www.citrix.com/downloads/workspace-app/mac/workspace-app-for-mac-latest.html;" \
    "- Add the GPG key from 1Passowrd to GPG Keychain and activate it at Fork" \
    "— Edit Finder preferences:" \
    "    — Add ~/ to Finder sidebar;" \
    "— Update Magic Trackpad preferences (in Accessibility):" \
    "    — Enable tap to click;" \
    "    — Enable three fingers drag;" \
    "— Organize Launchpad icons;" \
    "— Update Calendar preferences:" \
    "    — Show 5 days per week;" \
    "    — Show 6 hours a time;" \
    "— Remove control + space shortcut from OS;" \
