tail -5000 /data/logs/www.xiaohulu.com/access.log |awk '{print $1}'|sort|uniq -c|sort -nr | head -n 9 
