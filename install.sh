#!/bin/bash
###################
# Made for Debian #
###################

# Install neovim
apt update
apt install -y wget
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xvfz nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
mv nvim-linux64 /opt
echo -e "export PATH=/opt/nvim-linux64/bin:$PATH" >> ~/.zshrc

# Install Python
#apt install -y software-properties-common
#add-apt-repository -y ppa:deadsnakes/ppa
#apt update
apt remove -y python3.10 
DEBIAN_FRONTEND=noninteractive apt install -y python3.12 python3-pip
pip install pynvim

# Install Node.js
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y
npm i -g prettier neovim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy .vimrc
curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/gpt-partners/dotfiles/main/.vimrc

# Enable colors
echo "export TERM=xterm-color" >> ~/.zshrc
echo "alias v=nvim" >> ~/.zshrc

# Install ripgrep
apt-get install ripgrep

# Configure .gitconfig
echo -e "[user]\n\temail = 124867543+gpt-partners@users.noreply.github.com" >> ~/.gitconfig

# Install zsh
apt-get install -y zsh git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
