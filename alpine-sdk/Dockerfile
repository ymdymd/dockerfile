# docker build -t alpine-sdk .
# docker run -it -v $(pwd):/home/alpine-sdk/$(basename $(pwd)) --rm alpine-sdk

FROM alpine

#install alpine-sdk
RUN apk add --update alpine-sdk

#adduser
ENV USER=alpine-sdk
RUN addgroup -g 1000 $USER && \ 
    adduser -D -u 1000 -G $USER $USER

USER $USER
WORKDIR /home/$USER
