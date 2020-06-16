FROM alpine:3.12

RUN apk update && \
    apk upgrade && \
    apk --update \
    add python3 python3-pip

RUN pip3 install pipenv==2018.11.26
RUN curl -sfL https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh | sh -s
ENV PATH $PATH:./bin/
