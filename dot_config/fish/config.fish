# Environment Variables
set -gx EDITOR hx
set -gx VISUAL $EDITOR
set -gx PAGER less
set -gx LESS '-R --quit-if-one-screen'
set -gx MANPAGER $PAGER
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx COLIMA_SAVE_CONFIG 0
set -gx GOPATH $HOME/.local/share/go

# Path configuration
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.local/bin
fish_add_path $GOPATH/bin

# Suppress greeting
set -U fish_greeting

if status is-interactive
    atuin init fish | source
end

zoxide init fish | source
