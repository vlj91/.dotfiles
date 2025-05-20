* Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" </dev/null
```

* Install brews from `Brewfile`

```bash
brew bundle --file=~/.dotfiles/homebrew/.Brewfile
```

* Install ohmyzsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

* Sync dotfiles

```bash
stow *
```
