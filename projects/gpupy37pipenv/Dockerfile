FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

LABEL Yashio Kabashima

SHELL ["/bin/bash", "-c"]

COPY ./.bashrc /home/contuser1/.bashrc
COPY ./.bashrc /root/.bashrc

RUN apt-get update && apt-get install -y \
    sudo \
    less \
    wget \
    git \
    curl \
    tree \
    bash-completion \
    locales \
    build-essential \
    nano \
    gcc \
    make \
    libssl-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    zlib1g-dev \
    automake \
    python \
    python-pip \
    python3.7 \
    python3.7-distutils \
    libsm6 \ 
    libxext6 \ 
    libxrender-dev

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.7 get-pip.py
# RUN pip3.7 install pipenv

# codec
WORKDIR /
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# ROOTにパスワードをセット
RUN echo 'root:passwd' |chpasswd

ENV user contuser1
ENV pass contuser1
RUN useradd -u 1003 -m -d /home/${user} ${user} \
    && chown -R ${user}:${user} /home/${user}
RUN echo "${user}:${pass}" | chpasswd
RUN echo "contuser1    ALL=(ALL)       ALL" >> /etc/sudoers

USER contuser1
RUN pip3.7 install pipenv --user


WORKDIR /home/contuser1
