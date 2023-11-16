FROM ubuntu:latest

COPY install.sh /install.sh
COPY tmux.conf /root/.tmux.conf
COPY gitconfig /root/.gitconfig
COPY zshrc /root/.zshrc
COPY gotty /root/.gotty

RUN chmod +x /install.sh
RUN /install.sh
RUN rm /install.sh

ENTRYPOINT ["/usr/local/gotty", "-w", "tmux", "new", "-A", "-s", "nvim"]
