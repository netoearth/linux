while ture;
do
    if [ `mysql -u root -ppassword -e "SHOW SLAVE STATUS \G;" | grep "Duplicate entry" | wc -l` -eq 2 ] ; then
        mysql -u root -ppassword -e "STOP SLAVE; SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1; START SLAVE;";
    fi;
    sleep 1;
    mysql -u root -ppassword -e "SHOW SLAVE STATUS\G";
done