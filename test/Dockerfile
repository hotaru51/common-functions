FROM ubuntu:focal

RUN apt update && apt -y install \
    logrotate \
    vim \
    less && \
    apt clean

RUN mkdir /opt/test_scripts
WORKDIR /opt/test_scripts
COPY . /opt/test_scripts
