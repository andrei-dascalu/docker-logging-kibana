#!/bin/bash
curl -XPUT 'http://andrei-elastic:9200/_template/filebeat?pretty' -d@/root/filebeat-index-template.json > /root/loaded.txt
cd /root/beats-dashboards-1.2.0 && /bin/bash load.sh -url http://andrei-elastic:9200  > /root/tests.txt
#/etc/init.d/elasticsearch start
#/etc/init.d/logstash start
/etc/init.d/kibana start && nginx -g "daemon off;"
