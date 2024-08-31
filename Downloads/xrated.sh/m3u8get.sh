#!/bin/bash


mp4dir=${HOME}/Videos/xrated.txt
mkdir -p ${mp4dir}
m3u8url=$1
relname=

m3u8file=${mp4dir}/playlist.m3u8

dirurl=$(dirname ${m3u8url})

#set -x
rm -f ${m3u8file}
wget --quiet -O ${m3u8file} ${m3u8url}
res=$?
#echo ${res}
if [ ${res} -ne 0 ]
then
  echo ${m3u8url} | tee -a /home/zzz/Public/xrated.sh/url_m3u8_faild.txt
fi
#set +x

relname=$(stat -c %Y ${m3u8file})

[ -f ${mp4dir}/${relname}.m3u8 ] && exit 0
if [ -s ${m3u8file} ]
then
  mv ${m3u8file} ${mp4dir}/${relname}.m3u8
else
  echo ${m3u8url} | tee -a /home/zzz/Public/xrated.sh/url_m3u8_faild.txt
  exit 0
fi

txtfile=${mp4dir}/${relname}.txt
rm -f ${txtfile}
touch ${txtfile}

for i in `grep -e '.ts$' ${mp4dir}/${relname}.m3u8`
do
  echo ${dirurl}"/"${i} >> ${txtfile}
done

#sed -i '1d' ${txtfile}

exit 0
