FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y sudo 

ENV USER=ymdymd

# add sudo user
RUN groupadd -g 1000 ${USER} && \
    useradd  -g      ${USER} -G sudo -m -s /bin/bash ${USER} && \
    echo "${USER}:${USER}" | chpasswd

RUN echo "Defaults visiblepw"             >> /etc/sudoers
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER}
WORKDIR /home/${USER}
