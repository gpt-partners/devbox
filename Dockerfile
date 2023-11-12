FROM ubuntu:latest

COPY install.sh /install.sh
COPY tmux.conf /root/.tmux.conf

RUN chmod +x /install.sh
RUN /install.sh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "-e"]
