#!/bin/bash   
logs_path="/home/logs/bbs.uuu9.com/"
mv ${logs_path}access_01.log ${logs_path}access_$(date -d "yesterday" +"%Y%m%d").log    
kill -USR1 `cat /usr/local/nginx/nginx.pid`
cd ${logs_path}
find . -ctime +15 -name "access_20*.log" | xargs rm -f
exit 0
