#!/bin/bash



while read line
do
    [ -z ${line} ] && break
    [ "${line}" == "" ] && break
    [ "${line}" == "END" ] && break
    ${HOME}/Desktop/my_os_home/Downloads/xrated.sh/m3u8get.sh $line
done < ${HOME}/Desktop/my_os_home/Downloads/xrated.sh/url.txt

#sn=$1

#for i in `awk -v start_num=$sn 'NR>=start_num' url_playlist.txt`
#do
#    echo $i
#    ./m3u8get.sh $i
#done

#rm *.url

# ./ffmpeg.sh
