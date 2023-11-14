#!/bin/bash

# Install dependencies
apt update
apt -y install openssh-server build-essential ninja-build cmake gettext git ripgrep fd-find unzip tmux zsh locales ca-certificates curl gnupg xclip

# Install oh-my-zsh and and configure .zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo -e "alias v=nvim\nalias t=\"tmux -u\"\nalias s=\"source .venv/bin/activate\"\nalias rc=\"cd /root/.config/nvim/lua/custom\"" >> ~/.zshrc

# Install NodeJS
curl -fsSL https://raw.githubusercontent.com/tj/n/master/bin/n | bash -s lts
npm install -g n tree-sitter-cli
n lts

# Install pyenv
DEBIAN_FRONTEND=noninteractive apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
git clone https://github.com/pyenv/pyenv ~/.pyenv
eval "$(/root/.pyenv/bin/pyenv init -)"
/root/.pyenv/bin/pyenv install 3.12
/root/.pyenv/bin/pyenv global 3.12
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

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
echo -e "\n\n[alias]\n  pom = push origin master\n  pomf = push origin master --force\n  pu = pull origin master\n  aa = add .\n  st = status\n  co = commit" >> ~/.gitconfig
