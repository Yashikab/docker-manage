FROM docker:dind

RUN apk update
RUN apk upgrade
RUN apk --no-cache add \
    less \
    wget \
    git \
    curl \
    gcc \
    make
RUN which sh

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh
