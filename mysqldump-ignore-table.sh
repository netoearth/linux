DATABASE=test                                                                                                                                                                                 EXCLUDED_TABLES=(
    table_name_1
    table_name_2
    table_name_3
)

IGNORED_TABLES_STRING=''
for TABLE in "${EXCLUDED_TABLES[@]}"
do:
    IGNORED_TABLES_STRING+="--ignore-table=${DATABASE}.${TABLE} "
done

mysqldump -u root -p ${DATABASE} ${IGNORED_TABLES_STRING} > ${DATABASE}.sql