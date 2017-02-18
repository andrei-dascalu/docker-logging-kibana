FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -yqq update
RUN apt-get -yqq dist-upgrade
RUN apt-get install -yqq software-properties-common build-essential curl python-software-properties
RUN apt-get install -yqq nano wget apt-transport-https bash bash-completion grok unzip
