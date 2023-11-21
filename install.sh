#!/bin/bash

# Install dependencies
apt update
DEBIAN_FRONTEND=noninteractive apt -y install openssh-server build-essential ninja-build cmake gettext git ripgrep fd-find unzip tmux zsh locales ca-certificates curl wget gnupg xclip libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev libjson-c-dev libwebsockets-dev mosh

# Install Docker Engine
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get -y update

apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install NodeJS
curl -fsSL https://raw.githubusercontent.com/tj/n/master/bin/n | bash -s lts
npm install -g n tree-sitter-cli
n lts

# Install pyenv
git clone https://github.com/pyenv/pyenv ~/.pyenv
/root/.pyenv/bin/pyenv install 3.11
/root/.pyenv/bin/pyenv global 3.11
/root/.pyenv/shims/pip install --upgrade pip

# Install debugpy
mkdir -p /root/.venv/ && cd /root/.venv && python -m venv debugpy
/root/.venv/debugpy/bin/python -m pip install debugpy

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
git clone http://github.com/gpt-partners/nvim-config /root/.config/nvim/lua/custom
sed -i 's|https://github.com/|git@github.com:|g' /root/.config/nvim/lua/custom/.git/config
nvim --headless +MasonInstallAll +qa

# Install ttyd
cd /tmp && git clone https://github.com/tsl0922/ttyd.git
wget -P /tmp/hack https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
unzip hack/Hack.zip -d /tmp/ttyd/html/src/style/fonts/
cp /tmp/ttyd_cache/index.scss /tmp/ttyd/html/src/style/index.scss
cp /tmp/ttyd_cache/webpack.config.js /tmp/ttyd/html/webpack.config.js
corepack enable
cd /tmp/ttyd/html && yarn install && yarn build
cd /tmp/ttyd && mkdir -p build && cd build
cmake ..
make && make install

# Fix UTF-8 support
locale-gen en_IN.UTF-8

# Install SSH
mkdir /var/run/sshd
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
chsh -s /usr/bin/zsh root
echo 'root:root' | chpasswd
chage -d 0 root
