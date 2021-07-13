#!/bin/bash


# Fonts
if [ ! -f ~/Library/Fonts/Meslo\ LG\ M\ DZ\ Bold\ Nerd\ Font\ Complete.ttf ]; then
  (cd ~/Library/Fonts && curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip && unzip Meslo.zip)
fi

# Zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
source ~/.zshrc
zinit self-update
cp -f .zshrc ~/.zshrc

# Dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
mkdir -p ~/.config/nvim
cp -f ./neovim/* ~/.config/nvim/
cp -f .gitconfig ~/.gitconfig

# npm
npm install -g npm

# trash-cli
pip3 install trash-cli

# gitconfig
cp -f .gitconfig ~/.gitconfig
