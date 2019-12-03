#!/bin/bash
echo "11/18/2019 0:00" | logstash -e 'input { stdin {} } filter { date { match => [ "message", "ISO8601", "yyyy-MM-dd HH:mm:ss ZZZ"] } }'
