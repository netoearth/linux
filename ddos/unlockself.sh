#!/bin/bash
a=`/sbin/iptables -L -n --line-numbers|grep 117.35.118.106|awk '{print $1}'`
echo $a
iptables -D INPUT $a
