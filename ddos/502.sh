#!/bin/bash
tail -3600 /data/logs/www.xiaohulu.com/access.log|awk -F"[ ]" '{print $9}' |grep 502|wc -l >/data/502.txt
curl -I www.xiaohulu.com |head -1|awk {'print $2'} >/data/head.txt
failcount=`cat  /data/502.txt`  
headstatus=`cat /data/head.txt`
echo  $failcount
echo  $headstatus


  
if [ "$failcount" -ge 500 ] && [ $headstatus -eq 502 ];then
     /etc/init.d/php-fpm restart
else
	echo ok
fi
