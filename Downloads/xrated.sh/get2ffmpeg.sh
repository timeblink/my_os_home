#!/bin/bash

while read line
do
    [ -z ${line} ] && break
    [ "${line}" == "" ] && break
    [ "${line}" == "END" ] && break
    sh m3u8get.sh $line
done < url.txt

rm url.txt
touch url.txt
