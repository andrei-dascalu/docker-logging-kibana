#!/bin/bash

#ubuntu_base : andrei/ubuntu_base
#winpty docker run -i -t andrei/ubuntu_base



# autostart services
#RUN update-rc.d elasticsearch defaults 95 10
#RUN update-rc.d kibana defaults 96 9
#RUN update-rc.d logstash defaults 96 9

#create network
#docker network create logging

#elasticsearch
#https://www.elastic.co/blog/how-to-make-a-dockerfile-for-elasticsearch
##winpty docker run -i -t -v //c/Users/austerus/Projects:/da:rw andrei/elasticsearch
##winpty docker run -d --net=logging --name andrei-elastic --memory="4g" -e ES_HEAP_SIZE=2g -p 9200:9200 -p 9300:9300 andrei/elasticsearch

#logstash
#https://www.elastic.co/guide/en/logstash/current/docker.html
##winpty docker run -i -t -v //c/Users/austerus/Projects:/da:rw andrei/logstash
##winpty docker run -d --net=logging --name andrei-logstash -p 5044:5044 andrei/logstash logstash agent -f config/