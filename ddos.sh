tail -5000 /home/logs/bbs.uuu9.com/access_01.log |awk '{print $1}'|sort|uniq -c|sort -nr | head -n 9
