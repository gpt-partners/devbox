FROM ubuntu:latest

COPY ttyd /tmp/ttyd_cache
COPY install.sh /install.sh
RUN chmod +x /install.sh
RUN /install.sh
RUN rm /install.sh
COPY zshrc /root/.zshrc
COPY tmux.conf /root/.tmux.conf
COPY gitconfig /root/.gitconfig

#ENTRYPOINT ["/usr/local/bin/ttyd", "-p", "8080", "-W", "-t", "fontSize=20", "-t", "fontFamily=\"'Hack Nerd Font Mono'\"", "tmux", "-u", "new", "-A", "-s", "nvim"]
#CMD ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/entrypoint.sh"]
