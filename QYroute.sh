ip link set eth0 up
ip link set eth1 up
ip link set eth2 up
ip link set eth3 up

ifconfig eth0:0 219.129.216.112/25 up
ifconfig eth0:1 221.5.44.112/25 up
ifconfig eth0:2 219.129.216.113/25 up
ifconfig eth0:3 221.5.44.113/25 up
ifconfig eth0:4 219.129.216.115/25 up
ifconfig eth0:5 221.5.44.115/25 up
ifconfig eth0:6 219.129.216.117/25 up
ifconfig eth0:7 221.5.44.117/25 up
ifconfig eth0:8 219.129.216.120/25 up
ifconfig eth0:9 221.5.44.120/25 up
ifconfig eth0:10 219.129.216.121/25 up
ifconfig eth0:11 221.5.44.121/25 up

ifconfig eth1:1 58.253.67.139/25 up
ifconfig eth1:2 125.90.93.19/25 up
ifconfig eth1:3 58.253.67.147/25 up
ifconfig eth1:4 125.90.93.32/25 up
ifconfig eth1:5 58.253.67.160/25 up
ifconfig eth1:6 125.90.93.33/25 up
ifconfig eth1:7 58.253.67.161/25 up
ifconfig eth1:8 125.90.93.40/25 up
ifconfig eth1:9 58.253.67.168/25 up
ifconfig eth1:10 125.90.93.42/25 up
ifconfig eth1:11 58.253.67.170/25 up
ifconfig eth1:12 125.90.93.84/25 up
ifconfig eth1:13 58.253.67.212/25 up

ifconfig eth2:1 58.253.71.13/25 up
ifconfig eth2:2 121.10.140.16/25 up
ifconfig eth2:3 58.253.71.16/25 up
ifconfig eth2:4 121.10.140.18/25 up
ifconfig eth2:5 58.253.71.18/25 up
ifconfig eth2:6 121.10.140.30/25 up
ifconfig eth2:7 58.253.71.30/25 up
ifconfig eth2:8 121.10.140.40/25 up
ifconfig eth2:9 58.253.71.40/25 up
ifconfig eth2:10 121.10.140.41/25 up
ifconfig eth2:11 58.253.71.41/25 up

ip route flush table default
ip route add default via 219.129.216.1 dev eth0 src 219.129.216.109 table default
ip rule add from 219.129.216.109 table default
ip rule add from 219.129.216.112 table default
ip rule add from 219.129.216.113 table default
ip rule add from 219.129.216.115 table default
ip rule add from 219.129.216.117 table default
ip rule add from 219.129.216.120 table default
ip rule add from 219.129.216.121 table default
ip rule add from 221.5.44.109 table default
ip rule add from 221.5.44.112 table default
ip rule add from 221.5.44.113 table default
ip rule add from 221.5.44.115 table default
ip rule add from 221.5.44.117 table default
ip rule add from 221.5.44.120 table default
ip rule add from 221.5.44.121 table default

ip route flush table vlan10
ip route add default via 125.90.93.1 dev eth1 src 125.90.93.11 table vlan10
ip rule add from 125.90.93.11 table vlan10
ip rule add from 125.90.93.19 table vlan10
ip rule add from 125.90.93.32 table vlan10
ip rule add from 125.90.93.33 table vlan10
ip rule add from 125.90.93.40 table vlan10
ip rule add from 125.90.93.42 table vlan10
ip rule add from 125.90.93.84 table vlan10
ip rule add from 58.253.67.139 table vlan10
ip rule add from 58.253.67.147 table vlan10
ip rule add from 58.253.67.160 table vlan10
ip rule add from 58.253.67.161 table vlan10
ip rule add from 58.253.67.168 table vlan10
ip rule add from 58.253.67.170 table vlan10
ip rule add from 58.253.67.212 table vlan10

ip route flush table vlan20
ip route add default via 121.10.140.1 dev eth2 src 121.10.140.13 table vlan20
ip rule add from 121.10.140.13 table vlan20
ip rule add from 121.10.140.16 table vlan20
ip rule add from 121.10.140.18 table vlan20
ip rule add from 121.10.140.30 table vlan20
ip rule add from 121.10.140.40 table vlan20
ip rule add from 121.10.140.41 table vlan20
ip rule add from 58.253.71.13 table vlan20
ip rule add from 58.253.71.16 table vlan20
ip rule add from 58.253.71.18 table vlan20
ip rule add from 58.253.71.30 table vlan20
ip rule add from 58.253.71.40 table vlan20
ip rule add from 58.253.71.41 table vlan20

