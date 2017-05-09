#!/bin/bash
tail -1000 /data/logs/access.log |awk -F"[ ]" '{print $9}' |grep 502|wc -l >/data/502.txt
failcount=`cat  /data/502.txt`  
while (("$failcount" > 50))   
do  
   /etc/init.d/php-fpm restart
done  