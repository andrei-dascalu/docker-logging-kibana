FROM andrei/ubuntu_base

RUN apt-get update -yqq
RUN apt-get install -yqq openjdk-8-jdk nginx-full

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
RUN echo "deb http://packages.elastic.co/kibana/4.4/debian stable main" | tee tee -a /etc/apt/sources.list.d/kibana-4.4.x.list
RUN echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | tee /etc/apt/sources.list.d/logstash-2.2.x.list

RUN apt-get update -yqq

RUN apt-get -yqq install elasticsearch

RUN apt-get -yqq install kibana logstash

ADD configs/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
ADD configs/kibana.yml /opt/kibana/config/kibana.yml
ADD configs/default /etc/nginx/sites-available/default

ADD configs/02-beats-input.conf /etc/logstash/conf.d/02-beats-input.conf
ADD configs/10-syslog-filter.conf /etc/logstash/conf.d/10-syslog-filter.conf
ADD configs/30-elasticsearch-output.conf /etc/logstash/conf.d/30-elasticsearch-output.conf

COPY configs/services.sh /root/services.sh

ADD configs/filebeat-index-template.json /root/filebeat-index-template.json

RUN chmod +x /root/services.sh

RUN update-rc.d elasticsearch defaults 95 10
RUN update-rc.d kibana defaults 96 9
RUN update-rc.d logstash defaults 96 9

EXPOSE 80
EXPOSE 5044

CMD ["service", "elasticsearch", "start"]
CMD ["service", "logstash", "start"]
CMD ["service", "kibana", "start"]
