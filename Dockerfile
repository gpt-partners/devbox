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
EXPOSE 4200

# Run as sshd
#CMD ["/usr/sbin/sshd", "-D", "-e"]

# Run as shellinabox
CMD ["shellinaboxd", "-t", "-s", "/:LOGIN", "--disable-ssl", "--no-beep"]
