# GENERAL OPTIONS

set -o noclobber
shopt -s checkwinsize
shopt -s globstar 2> /dev/null
shopt -s histappend
shopt -s cmdhist
shopt -s autocd 2> /dev/null
shopt -s dirspell 2> /dev/null
shopt -s cdspell 2> /dev/null
shopt -s cdable_vars

# VARIABLES
PROMPT_COMMAND='history -a'
HISTSIZE=500000
HISTFILESIZE=100000
HISTCONTROL="erasedups:ignoreboth"
HISTTIMEFORMAT='%F %T '
CDPATH="."

export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# KEYBIDING
bind Space:magic-space
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"
bind "set mark-symlinked-directories on"

# ALIASES
. ~/dotfiles/bashrc/.bash_aliases

# BLE
. ~/dotfiles/bashrc/blesh/ble.sh

# PATH
export PATH="/home/batmiboom/programs/odin:$PATH"
export PATH="/home/batmiboom/programs/node/bin:$PATH"
export PATH="/home/batmiboom/programs/flutter/bin:$PATH"
export PATH="/home/batmiboom/programs/android/bin:$PATH"
export PATH="/home/batmiboom/.cargo/bin:$PATH"
export PATH="/home/batmiboom/.local/share/nvim/mason/bin:$PATH"

# BEFORE INIT
eval "$(zoxide init bash)"
eval "$(starship init bash)"
