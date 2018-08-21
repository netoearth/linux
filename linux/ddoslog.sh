#!/bin/bash
iptables -L -n >/data/logs/iptables_$(date -d "yesterday" +"%Y%m%d").log
#iptables -F
