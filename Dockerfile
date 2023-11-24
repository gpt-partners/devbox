FROM ubuntu:latest

COPY ttyd /tmp/ttyd_cache
COPY install.sh /install.sh
RUN chmod +x /install.sh
RUN /install.sh
RUN rm /install.sh

COPY zshrc /root/.zshrc
COPY gitconfig /root/.gitconfig
COPY tmux.conf /root/.tmux.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
