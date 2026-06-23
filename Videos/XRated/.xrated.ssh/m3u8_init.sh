#!/bin/ksh

rm playlist.m3u8
touch playlist.m3u8
echo "#EXTM3U" > playlist.m3u8
find "$(pwd)" -type f \
    -regex ".*\(\.mp4\|\.avi\|\.wmv\|\.rmvb\)$" \
    -printf '%P\n' \
    | sort -t'/' -rk2 \
	| tee -a playlist.m3u8

