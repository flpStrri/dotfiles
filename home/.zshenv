#!/usr/bin/env zsh

HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"  # The path to the history file.
HISTSIZE=10000                          # The maximum number of events to save in the internal history.
SAVEHIST=10000                          # The maximum number of events to save in the history file.
setopt BANG_HIST                        # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY                 # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY               # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY                    # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST           # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS                 # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS             # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS                # Do not display a previously found event.
setopt HIST_IGNORE_SPACE                # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS                # Do not write a duplicate event to the history file.
setopt HIST_VERIFY                      # Do not execute immediately upon history expansion.

# Defines environment variables.
# --------
privenv="$HOME/.private-env"
[[ -f "$privenv" ]] && source $privenv
export STARSHIP_CONFIG="$HOME/.starship-config.toml"
export PATH="/usr/local/sbin:$PATH"
export GPG_TTY=$(tty)
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export POETRY_VIRTUALENVS_CREATE=true
export POETRY_VIRTUALENVS_IN_PROJECT=true

# Browser.
# --------
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Editors.
# --------
export EDITOR='usr/local/bin/hx'

# Commonly used directories.
# ---------
dev="$HOME/GitHub"
zx="$dev/ZXVentures"
as="$HOME/Library/Application Support"
