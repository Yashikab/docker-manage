# Image file ubuntu16.04
FROM ubuntu:16.04

LABEL Yashio Kabashima

# add configuration files
ADD ./.bashrc /root/.bashrc

# RUN commands in container
RUN apt-get update && apt-get install -y \
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
    python-pip

# install python 3.6.8 via pyenv
ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH
RUN git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    eval "$(pyenv init -)"
RUN pyenv install 3.6.8
RUN pyenv global 3.6.8
RUN pyenv rehash


# upgrade pip
ENV pip /root/.pyenv/shims/pip
RUN $pip install --upgrade pip
RUN $pip install ipython
# ADD ./requirements.txt /root/requirements.txt
# RUN /root/.pyenv/shims/pip install -r /root/requirements.txt

# codec
WORKDIR /
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# set to home directory
WORKDIR /root/