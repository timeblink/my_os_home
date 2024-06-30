#!/bin/bash

rm playlist.m3u8
touch playlist.m3u8
echo "#EXTM3U" > playlist.m3u8
find "$(pwd)" -type f -name '*.mp4' -printf '%p\n' \
    | sort \
	| tee -a playlist.m3u8

exit 0

rm playlist.m3u8
touch playlist.m3u8
echo "#EXTM3U" > playlist.m3u8
find "$(pwd)" -type f -name '*.mp4' -printf '%p\n' \
    | sort -t'/' -rk7 -k6 \
	| tee -a playlist.m3u8

exit 0

rm rsync_playlist.sh
touch rsync_playlist.sh
chmod +x rsync_playlist.sh
echo "\$!/bin/bash" | tee rsync_playlist.sh

find -type f -name '*.mp4' -printf '%P\n' \
    | awk -F'/' '{print "mkdir -p "$1}' | sort | uniq \
    | tee -a rsync_playlist.sh

find -type f -name '*.mp4' -printf '%P\n' \
    | awk -F'/' '{print "rsync -rav zzz@192.168.12.104:Videos/xrated.ssh/"$1"/"$2,$1"/"}' \
    | tee -a rsync_playlist.sh
