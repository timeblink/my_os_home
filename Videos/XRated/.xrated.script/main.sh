#!/bin/bash

pushd /home/zzz/Videos/XRated/.xrated.script

touch download.txt

while true
do
    [ -f download.txt ] || break

    h=`date +'%k'`
    if [[ $h -ge 7 && $h -le 22 ]]
    then
        sleep 45m
        continue
    fi

    python fetch_list.py
    python fetch_detail.py

    sh loop_download_m3u8.sh
    sh loop_download_mp4.sh

    sleep 4h
done

popd

exit 0
