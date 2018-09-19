#!/bin/bash
host='192.168.1.240';
port='6391';
file="/data/keys.txt";
i=0;
cat ${file} | while read key;
do
  let i=i+1;
  cmd="/usr/local/redis/bin/redis-cli -h ${host} -p ${port} del ${key}";
  echo "line:"${i}",cmd:"${cmd};
  eval ${cmd}; 
done;
