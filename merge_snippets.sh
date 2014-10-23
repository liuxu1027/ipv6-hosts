#!/bin/bash

if [ $# -ne 1 ]; then
    echo -e "Usage:"
    echo -e "    $ ./merge_snippets.sh new_hosts\n"
    exit 1
fi

new_hosts_file=$1

if [ -f $new_hosts_file ]; then
    new_hosts_file=${new_hosts_file}".new"
    printf "" > $new_hosts_file
fi

date=$(date "+%m/%d/%Y")

printf "## 项目地址: https://github.com/lennylxx/ipv6-hosts\r\n" >> $new_hosts_file
printf "## 最后更新: "$date"\r\n" >> $new_hosts_file
printf "\r\n" >> $new_hosts_file
printf "::1 localhost\r\n" >> $new_hosts_file
printf "\r\n" >> $new_hosts_file

cat ./snippets/??_*.txt >> $new_hosts_file

exit 0
