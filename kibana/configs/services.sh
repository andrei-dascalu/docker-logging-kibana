#!/bin/bash

service elasticsearch start
service logstash start
service kibana start

curl -XPUT 'http://localhost:9200/_template/filebeat?pretty' -d@/root/filebeat-index-template.json
