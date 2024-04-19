export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
alias v=nvim
alias t="tmux -u"
alias ta="tmux a"
alias e="exit"
alias g="git"
alias cv="python -m venv .venv"
alias f="python -m pip freeze > requirements.txt"
alias s="source .venv/bin/activate"
alias rc="cd /root/.config/nvim/lua/custom"
alias dc="docker container"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcb="docker compose up -d --build"
alias dcc="docker system prune -a -f --volumes"
alias di="docker image"
alias dl="docker logs -f"
alias p="python"
alias cds="cd /root/src"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8
export TERM=screen-256color
