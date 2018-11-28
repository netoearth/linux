ip addr|grep inet |grep -i em|awk {'print $NF, $2'}|awk -F'/' {'print $1'}
