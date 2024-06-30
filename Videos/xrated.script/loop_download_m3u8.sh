#!/bin/bash

while read line
do
    [ -z ${line} ] && break
    [ "${line}" == "" ] && break
    [ "${line}" == "END" ] && break
    sh download_m3u8.sh $line
done < url.txt

rm url.txt
touch url.txt

exit 0
