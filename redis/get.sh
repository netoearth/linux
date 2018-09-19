#!/bin/bash
host='192.168.1.240'
port='6391'
/usr/local/redis/bin/redis-cli -h ${host} -p ${port} keys cache_v5_anchor_history_100*  > /data/keys1.txt
/usr/local/redis/bin/redis-cli -h ${host} -p ${port} keys cache_v3_m_anchor_history_100*  > /data/keys.txt
