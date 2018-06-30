# どのイメージを基にするか
FROM alpine
# 作成したユーザの情報
MAINTAINER ymdymd <ymd.jb3@gmail.com>
# RUN: docker buildするときに実行される
RUN echo "now building my_alpine..."
# CMD: docker runするときに実行される
CMD echo "now running alpine..."