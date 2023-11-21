#!/bin/bash

service ssh start
/usr/local/bin/ttyd -p 8080 -W -t "fontSize=20" -t "fontFamily='Hack Nerd Font Mono'" tmux -u new -A -s nvim
