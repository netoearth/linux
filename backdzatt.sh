#! /bin/bash
month=`date  +%Y%m`
echo $month
rsync -avzurtopg --progress /bbs/data/attachment/forum/$month /BACK/BBS/data/attachment/forum/