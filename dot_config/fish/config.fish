# Environment Variables
set -gx EDITOR hx
set -gx VISUAL $EDITOR
set -gx PAGER less
set -gx MANPAGER $PAGER
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# Path configuration
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.local/bin

# Suppress greeting
set -U fish_greeting

if status is-interactive
    export ZELLIJ_CONFIG_DIR=$HOME/.config/zellij
    if [ "$TERM" = xterm-ghostty ]
        eval (zellij setup --generate-auto-start fish | string collect)
    end
end
