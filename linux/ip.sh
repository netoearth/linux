#!/bin/bash
ip addr|grep inet |grep -i em|awk {'print $NF, $2'}|awk -F'/' {'print $1'}
ip=$(curl -s http://myip.ipip.net)
echo "My public IP address is: $ip"

