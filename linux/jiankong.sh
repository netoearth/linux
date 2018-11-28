#!/bin/bash

while [ 1 ]

do

 SendMail_is_exstit=$(ps -ef | grep "crond" | grep -v grep | wc -l)

 if [ ${SendMail_is_exstit} == 0 ]

 then

service crond reload
service crond restart
 fi

 sleep 60

done