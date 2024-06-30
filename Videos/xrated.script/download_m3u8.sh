#!/bin/bash


# mp4dir=${HOME}/Videos/xrated.txt
mp4dir=${HOME}/Videos/xrated.mp4
mkdir -p ${mp4dir}
trashd=${HOME}/Videos/xrated.trash
mkdir -p ${trashd}
tmpd=${HOME}/Videos/xrated.tmp
mkdir -p ${tmpd}
m3u8url=$1
relname=

[ -z ${m3u8url} ] && exit 0
[ "${m3u8url}" == "" ] && exit 0
[ "${m3u8url}" == "END" ] && exit 0

m3u8file=${mp4dir}/playlist.m3u8
faildfile=${HOME}/Videos/xrated.script/url_m3u8_faild.txt

dirurl=$(dirname ${m3u8url})

#set -x
rm -f ${m3u8file}
wget --quiet --timeout=90 -O ${m3u8file} ${m3u8url}
res=$?
#echo ${res}
if [ ${res} -ne 0 ]
then
  echo ${m3u8url} | tee -a ${faildfile}
fi
#set +x

relname=$(stat -c %Y ${m3u8file})

[ -f ${mp4dir}/${relname}.m3u8 ] && exit 0
[ -f ${trashd}/${relname}.m3u8 ] && exit 0
[ -f ${tmpd}/${relname}.m3u8 ] && exit 0
if [ -s ${m3u8file} ]
then
  mv ${m3u8file} ${mp4dir}/${relname}.m3u8
else
  echo ${m3u8url} | tee -a ${faildfile}
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
