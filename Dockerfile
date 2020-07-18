FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y python3 python3-pip mecab mecab-ipadic libmecab-dev

COPY requirements.txt requirements.txt

RUN pip3 install -U pip && pip3 install -r requirements.txt

ENV MECABRC=/etc/mecabrc

CMD ["python3"]
