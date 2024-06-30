#!/bin/bash



while read line
do
    ./m3u8get.sh $line
done < url.txt

#sn=$1

#for i in `awk -v start_num=$sn 'NR>=start_num' url_playlist.txt`
#do
#    echo $i
#    ./m3u8get.sh $i
#done

#rm *.url

# ./ffmpeg.sh
