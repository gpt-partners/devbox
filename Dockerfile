# Use the official Ubuntu base image
FROM ubuntu:latest

# Update packages, install curl, and execute the install.sh script
RUN apt update && apt install -y curl && bash -c "$(curl -s https://raw.githubusercontent.com/gpt-partners/dotfiles/main/install.sh)"

# Keep the container running in an infinite loop
CMD ["tail", "-f", "/dev/null"]
