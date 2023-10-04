# Dotfiles

## Features
- .vimrc

## How to use

``apt update && apt install -y curl && bash <(curl -s https://raw.githubusercontent.com/gpt-partners/dotfiles/main/install.sh)``

Or as Docker container:
``docker build -t devbox .; docker run --name -d devbox -v /mnt/c/Users/<YourUsername>/Downloads:/root devbox; docker exec -it devbox zsh``
