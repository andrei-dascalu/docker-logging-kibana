FROM andrei/ubuntu_base

RUN apt-get update -yqq
RUN apt-get install -yqq openjdk-8-jdk nginx-full

RUN groupadd -g 1000 logstash && useradd logstash -u 1000 -g 1000

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | tee /etc/apt/sources.list.d/logstash-2.2.x.list

RUN apt-get update -yqq

RUN apt-get -yqq install logstash

WORKDIR /opt/logstash

RUN set -ex && for path in logs config; do \
        mkdir -p "$path"; \
        chown -R logstash:logstash "$path"; \
    done

COPY configs/02-beats-input.conf /opt/logstash/config/02-beats-input.conf
COPY configs/10-syslog-filter.conf /opt/logstash/config/10-syslog-filter.conf
COPY configs/30-elasticsearch-output.conf /opt/logstash/config/30-elasticsearch-output.conf

ENV PATH=$PATH:/opt/logstash/bin

EXPOSE 5044
