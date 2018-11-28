# Usage:
#   build docker image command as follows
#       % docker build -t {image_name}:{tag} {Dockerfile location}
#   e.g.,
#       % docker build -t my_alpine .
#
#   run docker image command as follows
#       % docker run -it {image_name}:{tag}
#   e.g.,
#       % docker run -t my_alpine

# どのイメージを基にするか
FROM alpine
# 作成したユーザの情報
MAINTAINER ymdymd <ymd.jb3@gmail.com>
# RUN: docker buildするときに実行される
RUN echo "now building my_alpine..."
# CMD: docker runするときに実行される
CMD echo "now running alpine..."