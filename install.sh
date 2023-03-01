#!/bin/bash
###################
# Made for Debian #
###################

# Install neovim
apt-get update
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
apt install ./nvim-linux64.deb
rm nvim-linux64.deb

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
echo "alias gpt=\"python3 -m revChatGPT.V1\"" >> ~/.zshrc

# Source .zshrc
zsh
source ~/.zshrc

# Configure .gitconfig
echo "[user]\n\temail = your_email@example.com124867543+gpt-partners@users.noreply.github.com" >> ~/.gitconfig
