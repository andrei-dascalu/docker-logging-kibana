FROM andrei/ubuntu_base

RUN add-apt-repository -yqq ppa:webupd8team/java
RUN apt-get update -yqq
RUN apt-get -yqq install oracle-java8-installer apt-transport-https

RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

RUN echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list


RUN apt-get update -yqq

RUN apt-get -yqq install elasticsearch

RUN echo "deb http://packages.elastic.co/kibana/4.4/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana-4.4.x.list