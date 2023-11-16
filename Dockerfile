FROM ubuntu:latest

COPY install-docker.sh /install-docker.sh
COPY install.sh /install.sh
COPY tmux.conf /root/.tmux.conf
COPY gitconfig /root/.gitconfig

RUN chmod +x /install-docker.sh
RUN chmod +x /install.sh
RUN /install-docker.sh
RUN /install.sh
RUN rm /install-docker.sh /install.sh

EXPOSE 22

#CMD ["/usr/sbin/sshd", "-D", "-e"]
ENTRYPOINT ["/usr/local/bin/ttyd", "-p", "7681", "-W", "zsh"]
