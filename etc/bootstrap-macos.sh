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
    "— Edit Finder preferences:" \
    "    — Add ~/ to Finder sidebar;" \
    "— Update Magic Trackpad preferences (in Accessibility):" \
    "    — Enable tap to click;" \
    "    — Enable three fingers drag;" \
    "— Organize Launchpad icons;" \
    "— Remove control + space shortcut from OS;" \
    "— Create Pycharm command-line launcher;" \
