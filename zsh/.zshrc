# Installation path
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Load plugins
plugins=(asdf rails git ruby)

# Source ohmyzsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias vim="nvim"

# Exports
export EDITOR="nvim"
export ARCHFLAGS="-arch $(uname -m)"
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# ASDF autocomplete
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit && compinit
