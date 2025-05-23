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
export PKG_CONFIG_PATH="$(brew --prefix)/lib/pkgconfig"
export LIBRARY_PATH="$(brew --prefix)/lib"
export CPATH="$(brew --prefix)/include"

# ASDF shims
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# ASDF autocomplete
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
autoload -Uz compinit && compinit

# ASDF Golang config
. ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh

# ASDF Ruby config
export LDFLAGS="-L$(brew --prefix libyaml)/lib"
export CPPFLAGS="-I$(brew --prefix libyaml)/include"
export RUBY_YJIT_ENABLE=1
export RUBY_CONFIGURE_OPTS="--enable-yjit --with-openssl-dir=$(brew --prefix)/opt/openssl@3 --with-zlib-dir=$(brew --prefix)/opt/zlib --enable-shared"

# Secrets from 1password CLI
export GITHUB_PACKAGES_TOKEN=$(op read "op://Private/GitHub Packages Token/credential")
export OPENAI_API_KEY=$(op read "op://Private/OpenAI API Key/credential")

# Ruby config
export BUNDLE_RUBYGEMS__PKG__GITHUB__COM="$GITHUB_PACKAGES_TOKEN"
