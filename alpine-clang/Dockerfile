# Usage:
#   build docker image command as follows
#       % docker build -t {image_name}:{tag} {Dockerfile location}
#   e.g.,
#       % docker build -t alpine-clang .
#
#   run docker image command as follows
#       % docker run -it {image_name}:{tag}
#   e.g.,
#       % docker run -t alpine-clang

FROM alpine:latest

RUN echo "ipv6" >> /etc/modules

RUN apk update && apk upgrade

RUN apk update
RUN apk add --no-cache clang clang-dev alpine-sdk dpkg
RUN apk add --update --no-cache cmake
RUN apk add --update --no-cache ccache
RUN apk add --update --no-cache python3

RUN ls -l /usr/bin/cc /usr/bin/c++ /usr/bin/clang /usr/bin/clang++

RUN ln -sf /usr/bin/clang /usr/bin/cc
RUN ln -sf /usr/bin/clang++ /usr/bin/c++

RUN update-alternatives --install /usr/bin/cc cc /usr/bin/clang 10
RUN update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 10

RUN update-alternatives --auto cc
RUN update-alternatives --auto c++

RUN update-alternatives --display cc
RUN update-alternatives --display c++

RUN ls -l /usr/bin/cc /usr/bin/c++

RUN cc --version
RUN c++ --version

RUN echo '#include <iostream>                                       ' >> temp.cpp && \
    echo 'int main()                                                ' >> temp.cpp && \
    echo '{                                                         ' >> temp.cpp && \
    echo '  std::cout << "hello alpine-clang\n";                    ' >> temp.cpp && \
    echo '  return 0;                                               ' >> temp.cpp && \
    echo '}                                                         ' >> temp.cpp && \
    clang++ temp.cpp && \
    ./a.out && \
    rm -f temp.cpp a.out
 
