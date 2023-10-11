#!/bin/bash
###################
# Made for Ubuntu #
###################

# Install neovim
apt update
apt install -y wget
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xvfz nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
mv nvim-linux64 /opt
ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin

# Install ctags
wget https://github.com/universal-ctags/ctags-nightly-build/releases/download/2023.09.29%2B0aa6d047ffd78c3baff508a53f4a176d97a28b5b/uctags-2023.09.29-linux-x86_64.tar.xz
tar xf uctags-2023.09.29-linux-x86_64.tar.xz
rm uctags-2023.09.29-linux-x86_64.tar.xz
mv uctags-2023.09.29-linux-x86_64 /opt
ln -s /opt/uctags-2023.09.29-linux-x86_64/bin/ctags /usr/local/bin

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy .vimrc and coc-settings.json
curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/gpt-partners/dotfiles/main/.vimrc
curl -o ~/.config/nvim/coc-settings.json https://raw.githubusercontent.com/gpt-partners/dotfiles/main/coc-settings.json


# Install Python
apt install python3 python3-pip -y
pip install pynvim
ln -s /usr/bin/python3 /usr/local/bin/python

# Install Node.js
apt-get install -y ca-certificates curl gnupg
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt update
apt install nodejs -y
npm i -g prettier neovim

# Install ripgrep
apt-get install ripgrep

# Configure .gitconfig
echo -e "[user]\n\temail = 124867543+gpt-partners@users.noreply.github.com" >> ~/.gitconfig

# Install zsh
apt-get install -y zsh git
echo -e "export PATH=/opt/nvim-linux64/bin:$PATH" >> /root/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
