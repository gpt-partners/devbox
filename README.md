# devbox

## Features

- NvChad
- tmux
- oh-my-zsh
- vs-code-js-debug
- debugpy
- gotty

## How to use

Start with docker-compose.

```
docker-compose up -d --build
```

SSH into machine

```
mosh -p 23 root@devbox -- tmux -u new -A -s nvim

```
