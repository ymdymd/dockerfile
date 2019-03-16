# Usage:
#   build docker image command as follows
#       % docker build -t {image_name}:{tag} {Dockerfile location}
#   e.g.,
#       % docker build -t expgen .
#
#   run docker image command as follows
#       % docker run -it {image_name}:{tag}
#   e.g.,
#       % docker run -it --rm --net host -v $PWD:/root expgen
#       % docker run -it --rm --net host -v $PWD:/home/node expgen
#
#   create express template
#       express --view=ejs myApp

FROM alpine

RUN apk add nodejs npm
RUN npm install express-generator
ENV PATH $PATH:/node_modules/.bin
#WORKDIR /root

WORKDIR /home/node
USER 1000:1000

