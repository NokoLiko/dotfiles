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
if [[ $- == *i* ]]; then
  bind Space:magic-space
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'
  bind '"\e[C": forward-char'
  bind '"\e[D": backward-char'

  bind "set completion-ignore-case on"
  bind "set completion-map-case on"
  bind "set show-all-if-ambiguous on"
  bind "set mark-symlinked-directories on"
fi

case "$OSTYPE" in
  darwin*)
    [[ -r /opt/homebrew/etc/profile.d/bash_completion.sh ]] && . /opt/homebrew/etc/profile.d/bash_completion.sh
    ;;
  linux*)
    ;;
esac

# ALIASES
. ~/dotfiles/bashrc/.bash_aliases

# PATH
. ~/dotfiles/bashrc/.bash_env

# FUNCTIONS
. ~/dotfiles/bashrc/.bash_functions

# ELIXIR
if command -v mise &>/dev/null; then
  eval "$(~/.local/bin/mise activate bash)"
fi

# BEFORE INIT
eval "$(zoxide init bash)"
eval "$(starship init bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
