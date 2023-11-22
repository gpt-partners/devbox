FROM ubuntu:latest

COPY ttyd /tmp/ttyd_cache
COPY entrypoint.sh /entrypoint.sh
COPY install.sh /install.sh
COPY zshrc /root/.zshrc
COPY tmux.conf /root/.tmux.conf
COPY gitconfig /root/.gitconfig

RUN chmod +x /install.sh
RUN chmod +x /entrypoint.sh
RUN /install.sh
RUN rm /install.sh

ENTRYPOINT ["/entrypoint.sh"]
