netstat -an|awk '{print $6}'|sort|uniq -c|sort -nr | head -n 9
