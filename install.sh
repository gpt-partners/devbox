#!/bin/bash

# Install dependencies
apt update
apt -y install python3 python3-pip python3-venv openssh-server build-essential ninja-build cmake gettext git ripgrep fd-find unzip tmux zsh locales ca-certificates curl gnupg xclip

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "alias v=nvim\nalias t=\"tmux -u\"" >> ~/.zshrc

# Install NodeJS
curl -fsSL https://raw.githubusercontent.com/tj/n/master/bin/n | bash -s lts
npm install -g n
n lts

# Install neovim plugins
npm install -g neovim pyright
pip install pynvim neovim

# Download and install vscode-js-debug
cd /root
git clone https://github.com/microsoft/vscode-js-debug
cd vscode-js-debug
npm install --legacy-peer-deps
npx gulp vsDebugServerBundle
mv dist out
cd /

# Install neovim
git clone --depth=1 https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
make install
mv /neovim/build/bin/nvim /usr/bin/
cd .. && rm -r neovim

# Install NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
rm -rf $HOME/.config/nvim/.git
git clone https://github.com/gpt-partners/nvim-config /root/.config/nvim/lua/custom
nvim --headless +MasonInstallAll +qa

# Install SSH server
mkdir /var/run/sshd
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
chsh -s /usr/bin/zsh root
echo 'root:root' | chpasswd
chage -d 0 root


# Fix UTF-8 support
echo -e "export LC_ALL=en_IN.UTF-8\nexport LANG=en_IN.UTF-8" >> ~/.zshrc
locale-gen en_IN.UTF-8

# Configure .gitconfig
echo -e "[user]\n\temail = 124867543+gpt-partners@users.noreply.github.com" >> ~/.gitconfig
