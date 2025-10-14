#!/bin/bash

rm playlist1.m3u8
touch playlist1.m3u8
echo "#EXTM3U" > playlist1.m3u8
find -type f -name '*.mp4' -printf '%P\n' \
	| sort -t'c' -k1 -rk2 \
	| awk '{print "/home/zzz/Videos/xrated.cut/"$1}' \
	| tee -a playlist1.m3u8
