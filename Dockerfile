FROM ubuntu:18.04

ENV HOME /root
ENV PYTHON_VERSION 3.8.3
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y git tzdata build-essential curl git libbz2-dev libffi-dev liblzma-dev \
      libncurses5-dev libncursesw5-dev libpq-dev libreadline-dev libsqlite3-dev libssl-dev \
      llvm make tk-dev unzip vim wget xz-utils zlib1g-dev mecab mecab-ipadic libmecab-dev

RUN mkdir -p $HOME/.pyenv \
    && mkdir -p $HOME/local/bin/python-$PYTHON_VERSION \
    && git clone https://github.com/pyenv/pyenv.git .pyenv/ \
    && /usr/local/bin/python-build -v $PYTHON_VERSION ./local/bin/python-$PYTHON_VERSION \
    && echo 'export PATH="$HOME/local/bin/python-$PYTHON_VERSION/bin:$PATH"' >> ~/.bashrc \
    && source ~/.bashrc

COPY requirements.txt requirements.txt

RUN pip install -U pip && pip install -r requirements.txt

CMD ["python"]
