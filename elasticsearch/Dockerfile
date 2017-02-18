FROM andrei/ubuntu_base

RUN apt-get update -yqq
RUN apt-get install -yqq openjdk-8-jdk nginx-full

RUN groupadd -g 1000 elasticsearch && useradd elasticsearch -u 1000 -g 1000

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -

RUN echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

RUN apt-get update -yqq

RUN apt-get -yqq install elasticsearch

WORKDIR /usr/share/elasticsearch

RUN set -ex && for path in data logs config config/scripts; do \
        mkdir -p "$path"; \
        chown -R elasticsearch:elasticsearch "$path"; \
    done

COPY configs/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY configs/logging.yml /usr/share/elasticsearch/config/logging.yml

USER elasticsearch

ENV PATH=$PATH:/usr/share/elasticsearch/bin

CMD ["elasticsearch"]

EXPOSE 9200
EXPOSE 9300