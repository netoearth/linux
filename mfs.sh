#!/bin/sh
 df -h|grep 9421|awk  -F":" '{print $2}' |awk '{print $1}' | while read output;
do
  echo $output
  if [ $output -ge 9421 ]; then
echo "MFS IS OK"
  else
fusermount -u /data/www/wwwroot/newbbs.uuu9.com/data/attachment/forum                                   
/usr/bin/mfsmount   /data/www/wwwroot/newbbs.uuu9.com/data/attachment/forum -H mfsmaster -S /attachments
fi
done
