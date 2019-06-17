# Image file ubuntu18.04
FROM ubuntu:18.04

LABEL Yashi

# use bash
SHELL ["/bin/bash", "-c"]

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

# install pyenv & anaconda3
ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH
RUN git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    eval "$(pyenv init -)"
RUN pyenv install anaconda3-5.3.1
RUN pyenv global anaconda3-5.3.1

# some settings
ENV PATH /root/.pyenv/shims/:$PATH
RUN which pip
RUN pip install --upgrade pip
RUN pip install --upgrade jupyter

# install python3.6.8 kernel
RUN conda create -n python3.6.8 python=3.6.8 anaconda
RUN . /root/.pyenv/versions/anaconda3-5.3.1/etc/profile.d/conda.sh
ENV ipython368 /root/.pyenv/versions/anaconda3-5.3.1/envs/python3.6.8/bin/ipython
RUN $ipython368 kernel install --user --name=python3.6.8 --display-name=python3.6.8
RUN pip install environment_kernels
RUN echo "y" | jupyter notebook --generate-config
RUN echo "c.NotebookApp.kernel_spec_manager_class='environment_kernels.EnvironmentKernelSpecManager'" >> ~/.jupyter/jupyter_notebook_config.py
RUN echo "c.EnvironmentKernelSpecManager.conda_env_dirs = [ '/root/.pyenv/versions/anaconda3-5.3.1/envs/' ]" >> ~/.jupyter/jupyter_notebook_config.py
RUN echo "c.MultiKernelManager.default_kernel_name = python3.6.8" >> ~/.jupyter/jupyter_notebook_config.py

# Run jupyter-lab at docker-compose up
CMD jupyter-lab --no-browser \
    --port=8888 --ip=0.0.0.0 --allow-root --NotebookApp.password='sha1:408161a8c9a2:c3bc403dfe03f329997889dd5e8e06519f95b408'

# codec
WORKDIR /
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# set to home directory
WORKDIR /root/
