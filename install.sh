#!/bin/bash
###################
# Made for Debian #
###################

# Install vim
apt-get update
apt-get install -y neovim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy .vimrc
curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/gpt-partners/dotfiles/main/.vimrc

# Enable colors
echo "export TERM=xterm-color" >> ~/.zshrc
echo "alias v=nvim" >> ~/.zshrc

# Install ChatGPT
python3 -m pip install revChatGPT
echo "alias g=\"python3 -m revChatGPT.V1\"" >> ~/.zshrc

# Source .zshrc
zsh
source ~/.zshrc
