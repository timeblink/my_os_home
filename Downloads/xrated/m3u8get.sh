#!/bin/bash


mp4dir=${HOME}/Videos/xrated
mkdir -p ${mp4dir}
m3u8url=$1
relname=


m3u8file=${mp4dir}/playlist.m3u8

dirurl=$(dirname ${m3u8url})

set -x
rm -f ${m3u8file}
wget --quiet -O ${m3u8file} ${m3u8url}
set +x

relname=$(stat -c %Y ${m3u8file})
txtfile=${mp4dir}/${relname}.txt
rm -f ${txtfile}

[ -f ${mp4dir}/${relname}.m3u8 ] && exit 0

for i in `grep -e '.ts$' ${m3u8file}`
do
    echo ${dirurl}"/"${i} | tee -a ${txtfile}
done

mv ${m3u8file} ${mp4dir}/${relname}.m3u8

sed -i '1d' ${txtfile}

exit 0
