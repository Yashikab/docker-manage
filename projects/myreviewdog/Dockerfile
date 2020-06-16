FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk --update-cache \
    add curl \
    python3 \
    python3-dev \
    py-pip

RUN pip3 install pipenv==2018.11.26
RUN curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s
ENV PATH $PATH:./bin/
