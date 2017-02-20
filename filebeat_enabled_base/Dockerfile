FROM andrei/ubuntu_base

RUN apt-get update -yqq

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN echo "deb https://packages.elastic.co/beats/apt stable main" |  tee -a /etc/apt/sources.list.d/beats.list

RUN apt-get update -yqq

RUN apt-get -yqq install filebeat nginx-full

COPY configs/filebeat.yml /etc/filebeat/filebeat.yml
COPY configs/services.sh /services.sh

RUN chmod 755 /services.sh


ENTRYPOINT ["/bin/bash", "/services.sh"]