#!/usr/bin/env zsh

printf "— \e[1mPress Enter\e[0m to start updating the Mac OS preferences..."
    read user_wait

source 'homebrew.sh'
source 'github.sh'
source 'macos.sh'
source 'app_store.sh'
source 'etc/symlink-dotfiles.sh'
chmod -R go-w "$(brew --prefix)/share"

printf "\n\e[33m!\e[0m \e[1mFinish by doing this manual tasks:\e[0m\n"
    printf "%s\n" \
    "— Install fonts from iCloud folder;" \
    "— Update default font and theme in Terminal;" \
    "— Install Camera Settings: https://support.logi.com/hc/en-ca/articles/360049055854;" \
    "— Edit Finder preferences:" \
    "    — Add ~/ to Finder sidebar;" \
    "    — Make new Finder show ~/;" \
    "— Update Magic Trackpad preferences (in Accessibility):" \
    "    — Enable tap to click;" \
    "    — Enable three fingers drag;" \
    "— Organize Launchpad icons;" \
    "— Install PyCharm plugins:" \
    "    — Gruvbox theme;" \
    "    — CamelCase;" \
    "    — HashiCorp Terraform;" \
    "    — Makefile support;" \
    "    — Poetry;" \
    "    — Toml;" \
    "    — File Watchers ;" \
    "— Update PyCharm default font and theme;" \
    "— Update Calendar preferences:" \
    "    — Show 5 days per week;" \
    "    — Show 6 hours a time;" \
    "— Remove control + space shortcut from OS;" \
