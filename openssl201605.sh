#!/bin/bash
# url:http://www.wdlinux.cn
###
cd /tmp
if openssl version | grep -q "1.0.1";then
wget http://dl.wdlinux.cn/files/openssl/openssl-1.0.1t.tar.gz
tar zxvf openssl-1.0.1t.tar.gz
cd openssl-1.0.1t
fi
if openssl version | grep -q "1.0.2";then
wget http://dl.wdlinux.cn/files/openssl/openssl-1.0.2h.tar.gz
tar zxvf openssl-1.0.2h.tar.gz
cd openssl-1.0.2h
fi
./config --prefix=/usr
make
cd ..
rm -fr openssl*
echo
echo
echo "Update is OK"
echo
