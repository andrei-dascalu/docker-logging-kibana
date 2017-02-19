FROM andrei/ubuntu_base

RUN apt-get update -yqq
RUN apt-get install -yqq openjdk-8-jdk nginx-full

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN echo "deb http://packages.elastic.co/kibana/4.4/debian stable main" | tee tee -a /etc/apt/sources.list.d/kibana-4.4.x.list

RUN apt-get update -yqq

RUN apt-get -yqq install kibana

COPY configs/kibana.yml /opt/kibana/config/kibana.yml
COPY configs/default /etc/nginx/sites-available/default

COPY configs/services.sh /services.sh

COPY configs/filebeat-index-template.json /root/filebeat-index-template.json
COPY configs/beats-dashboards-1.2.0.zip /root/beats-dashboards-1.2.0.zip

WORKDIR /root

RUN unzip beats-dashboards-1.2.0.zip

RUN chmod 755 /services.sh

RUN update-rc.d kibana defaults 96 9

EXPOSE 80
EXPOSE 5601

ENTRYPOINT ["/bin/bash", "/services.sh"]
