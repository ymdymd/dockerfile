# Usage:
#   Run docker command as follows
#       % docker build -t {image_name}:{tag} {Dockerfile location}
#   e.g.,
#       % docker build -t grpc_dev .
#
#       % docker run -it -v $PWD:/root --name grpc_dev grpc_dev
#       % docker run -it -v $PWD:/root --name grpc0 -p 50051:50051 grpc_dev 
#

FROM ubuntu:18.04

ENV     LD_LIBRARY_PATH=/usr/local/lib64:/usr/local/lib:$LD_LIBRARY_PATH

RUN     apt-get update && apt-get install -y -qq \ 
        git subversion curl \ 
        build-essential cmake \
        autoconf automake libtool pkg-config \
        clang llvm libiomp-dev \
        libc-ares-dev \
        tmux

RUN     cd && \
        git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc.git && \
        cd grpc && \
        git submodule update --init && \
        cd third_party/protobuf/ && \
        ./autogen.sh && \
        ./configure && \
        make && make install && \
        cd ../../ && make && make install && \
        cd && rm -rf grpc



