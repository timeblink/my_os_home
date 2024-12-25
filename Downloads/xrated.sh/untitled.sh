#!/bin/bash

while read line
do
    m3u8url=$line
    echo ${m3u8url}
    [ -z ${m3u8url} ] && break
    [ "${m3u8url}" == "" ] && break
    [ "${m3u8url}" == "END" ] && break
    wget ${m3u8url}
    adir=$(dirname ${m3u8url})
    aname=$(stat -c %Y playlist.m3u8)
    echo ${aname}
    mv playlist.m3u8 ${aname}.m3u8
    grep -e '.ts$' ${aname}.m3u8 | awk -v url=${adir} '{print url"/"$1}' > ${aname}.txt
done < ${HOME}/Desktop/my_os_home/Downloads/xrated.sh/url.txt

echo "~/Desktop/my_os_home/Downloads/xrated.sh/mp4get.sh"

exit 0