# devbox

## Features

- NvChad support
- tmux
- oh-my-zsh
- vs-code-js-debug

## How to use

From terminal:

`apt update && apt install -y curl && bash <(curl -s https://raw.githubusercontent.com/gpt-partners/dotfiles/main/install.sh)`

Or as Docker container:

```
docker build -t devbox --no-cache .
docker run -p 23:22 --name devbox -v /var/run/docker.sock:/var/run/docker.sock -d devbox
ssh -p 23 root@devbox
```
