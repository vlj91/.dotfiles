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
export PATH="$(npm config get prefix)/bin:$PATH"

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

# Regenerate 1Password secrets
function refresh_op_secrets() {
  cat << EOF > "$HOME/.op_secrets"
export GITHUB_PACKAGES_TOKEN=$(op read "op://Private/GitHub Packages Token/credential")
export BUNDLE_RUBYGEMS__PKG__GITHUB__COM="$GITHUB_PACKAGES_TOKEN"
export OPENAI_API_KEY=$(op read "op://Private/OpenAI API Key/credential")
EOF
}

# Source 1Password secrets
if [[ -f "$HOME/.op_secrets" ]]; then
  . "$HOME/.op_secrets"
else
  refresh_op_secrets
fi

# Ruby config
export BUNDLE_RUBYGEMS__PKG__GITHUB__COM="$GITHUB_PACKAGES_TOKEN"

# bun completions
[ -s "/Users/vlj/.bun/_bun" ] && source "/Users/vlj/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# BEGIN ANSIBLE MANAGED BLOCK - SOURCE ~/environment
# Source ~/environment recursively for files ending with *.rc *.zsh *.sh
mkdir -p $HOME/environment
touch $HOME/environment/environment.zsh $HOME/environment/secrets.zsh $HOME/environment/aliases.zsh $HOME/environment/functions.zsh
for file in $(find -L $HOME/environment -type f -type f \( -name "*.rc" -o -name "*.zsh" -o -name "*.sh" \) | sort ); do
    if [[ ${DEBUG:-FALSE} == "TRUE" ]]; then
      echo "Now sourcing ${file}"
    fi
    . "${file}"
done
# END ANSIBLE MANAGED BLOCK - SOURCE ~/environment

# opencode
export PATH=/Users/vlj/.opencode/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
PATH=$PATH:~/.kube/commands/

PATH="~/.local/bin:$PATH"
