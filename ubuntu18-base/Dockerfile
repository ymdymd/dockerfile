FROM ubuntu:18.04

#----------------------

# Set the ARG to non-interactive
ARG DEBIAN_FRONTEND=noninteractive
ARG DEBIAN_PRIORITY=critical
ARG USER_NAME

# point to mirror server
RUN sed -i.org -e 's|ports.ubuntu.com|jp.archive.ubuntu.com|g' /etc/apt/sources.list

# base 
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    sudo apt-utils

ENV USER=${USER_NAME:-ros} \
    HOME=/home/${USER_NAME}

# add sudo user
RUN groupadd -g 1000 ${USER} && \
    useradd  -g      ${USER} -G sudo -m -s /bin/bash ${USER} && \
    echo "${USER}:${USER}" | chpasswd

RUN echo "Defaults visiblepw"             >> /etc/sudoers
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER}
WORKDIR ${HOME}

#----------------------