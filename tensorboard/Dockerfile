FROM python:3.5

RUN pip install tensorflow

WORKDIR /tf_logs

ENTRYPOINT [ "tensorboard", "--logdir", "/tf_logs" ]

CMD []