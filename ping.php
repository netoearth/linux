<?php
$to_ping='rds1ra19jk37tx3pv014uo.mysql.rds.aliyuncs.com';
$count=2;
$psize=66;
echo "正在执行php ping命令，请等待...\n<br><br>";
flush();
while(1){
	echo "<pre>";
	exec("ping -c $count -s $psize $to_ping", $list);
	for($i=0;$i<count($list);$i++){
		print $list[$i]."\n";
	}
	echo "</pre>";
	flush();
	sleep(3);
}