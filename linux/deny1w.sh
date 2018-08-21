#!/bin/bash

max=10000   #我们设定的最大值，当访问量大于这个值得时候，封锁

logdir=/data/logs/www.xiaohulu.com/access.log   #nginx封锁配置文件路径

cat $logdir|awk '{print $1}'|sort|uniq -c|sort -rn|while read line  #截取IP段

do

a=(`echo $line`)

if [ $a -ge $max ]    #比较每个访问IP是否大于设定的max值

then

 iptables -I INPUT -p tcp --dport 80 -s ${a[1]} -j DROP #把访问量大于设定值的IP加入的防火墙规则中

fi

done
