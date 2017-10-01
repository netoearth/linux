#!/bin/bash
logs_path="/data/logs/www.xiaohulu.com/"
pid_path="/usr/local/nginx/logs/nginx.pid"
mv ${logs_path}access.log ${logs_path}access_$(date -d "yesterday" +"%Y%m%d").log
bzip2 -9 ${logs_path}access_$(date -d "yesterday" +"%Y%m%d").log
find /data/logs/  -name "*.bz2" -type f -mtime +30 -exec rm {} \;
kill -USR1 `cat ${pid_path}`
