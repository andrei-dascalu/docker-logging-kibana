#!/bin/bash
/etc/init.d/filebeat start && nginx -g "daemon off;"
