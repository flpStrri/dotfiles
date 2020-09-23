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

# Browser.
# --------
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Editors.
# --------
# export EDITOR='/usr/local/bin/code'
# export VISUAL='/usr/local/bin/code'
# export PAGER='less'

# Language.
# ---------
# if [[ -z "$LANG" ]]; then
#   eval "$(locale)"
# fi

# Commonly used directories.
# ---------
dev="$HOME/GitHub"
zx="$dev/ZXVentures"
as="$HOME/Library/Application Support"

# Git commit signing
# ---------
# export GPG_TTY=$(tty) # For git commit signing
# gitssh="$HOME/.ssh/git"
# if [[ -f $gitssh ]]; then
#   export GIT_SSH_COMMAND="ssh -i $gitssh -F /dev/null"
# fi
# unset gitssh
