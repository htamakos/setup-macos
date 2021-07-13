# Setup Mac

## Prerequirement

```
# Install Homebrew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Setup

```
$ sh ./mac-setup-defaults.sh
$ brew bundle
$ sh ./mac-tools-without-brew.sh
$ sh ./mac-setup-conda-env.sh
$ mv -f .zshrc ~/.zshrc
```
