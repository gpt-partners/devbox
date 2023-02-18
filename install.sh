# Install vim
apt-get update;
apt-get install -y neovim;

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy .vimrc
curl -o ~/.config/nvim/init.vim --create-dirs https://raw.githubusercontent.com/gpt-partners/dotfiles/main/.vimrc;

# Enable colors
echo "export TERM=xterm-color" ~/.bashrc
echo "alias v=nvim" > ~/.bashrc
source ~/.bashrc
