#!/usr/bin/env zsh

DEVELOPMENT_DIR="$HOME/GitHub"
DOTFILES_DIR="$DEVELOPMENT_DIR/dotfiles"

# Aliases
# --------
# Disable correction.
alias ack='nocorrect ack'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias ebuild='nocorrect ebuild'
alias gcc='nocorrect gcc'
alias gist='nocorrect gist'
alias grep='nocorrect grep'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias rm='nocorrect rm'

# Disable globbing.
alias bower='noglob bower'
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias rake='noglob rake'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'
alias e='${(z)VISUAL:-${(z)EDITOR}}'

# Checks if a name is a command, function, or alias.
function is-callable {
  (( $+commands[$1] )) || (( $+functions[$1] )) || (( $+aliases[$1] ))
}

if is-callable 'dircolors'; then
  # GNU Core Utilities
  alias ls='ls --group-directories-first'

  if zstyle -t ':prezto:module:utility:ls' color; then
    if [[ -s "$HOME/.dir_colors" ]]; then
      eval "$(dircolors "$HOME/.dir_colors")"
    else
      eval "$(dircolors)"
    fi

    alias ls="$aliases[ls] --color=auto"
  else
    alias ls="$aliases[ls] -F"
  fi
else
  # BSD Core Utilities
  if zstyle -t ':prezto:module:utility:ls' color; then
    # Define colors for BSD ls.
    export LSCOLORS='exfxcxdxbxGxDxabagacad'

    # Define colors for the completion system.
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

    alias ls='ls -G'
  else
    alias ls='ls -F'
  fi
fi

alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias sl='ls'            # I often screw this up.

# Simple clear command.
alias cl='clear'

# Short-cuts for copy-paste.
alias c='pbcopy'
alias p='pbpaste'

# Remove all items safely, to Trash (`brew install trash`).
[[ -z "$commands[trash]" ]] || alias rm='trash' 2>&1 > /dev/null

# Lock current session and proceed to the login screen.
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# Sniff network info.
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

# Process grep should output full paths to binaries.
alias pgrep='pgrep -fli'

# VPN CLI
alias vpn="/Applications/Pritunl.app/Contents/Resources/pritunl-client"
alias vpnp="vpn list | sed 's/ //g' | grep -v -e ID -e '+' | cut -d '|' -f2"
alias vpnc="vpn start $(vpnp) --password"
alias vpnd="vpn stop $(vpnp)"

# Start Starship
# --------
eval "$(starship init zsh)"

# Homebrew Shell Completion
# --------
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# tabtab source for packages
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true