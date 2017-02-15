#!/bin/sh
#by ljk 20160526

if [ "$1" = "" ];then    #判断后面是否有跟参数
    echo -e "\n      use interface_name after the script,like \"script eth0\"...\n"
    exit -1
fi

echo -e "\n      start monitoring the $1,press \"ctrl+c\" to stop"
echo ----------------------------------------------------------

file=/proc/net/dev    #内核网卡信息文件
while true
    do
    RX_bytes=`cat $file|grep $1|sed 's/^ *//g'|awk -F'[ :]+' '{print $2}'`    #这里sed这一步为了同时兼容centos6和7
    TX_bytes=`cat $file|grep $1|sed 's/^ *//g'|awk -F'[ :]+' '{print $10}'`
    sleep 10
    RX_bytes_later=`cat $file|grep $1|sed 's/^ *//g'|awk -F'[ :]+' '{print $2}'`
    TX_bytes_later=`cat $file|grep $1|sed 's/^ *//g'|awk -F'[ :]+' '{print $10}'`

    #B*8/1024/1024=Mb
    speed_RX=`echo "scale=2;($RX_bytes_later - $RX_bytes)*8/1024/1024/10"|bc`
    speed_TX=`echo "scale=2;($TX_bytes_later - $TX_bytes)*8/1024/1024/10"|bc`

    printf "%-3s %-3.1f %-10s %-4s %-3.1f %-4s\n" IN: $speed_RX Mb/s OUT: $speed_TX Mb/s
done