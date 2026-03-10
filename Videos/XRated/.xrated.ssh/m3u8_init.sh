#!/bin/bash

rm playlist0.m3u8
touch playlist0.m3u8
echo "#EXTM3U" > playlist0.m3u8
while read line
do
  printf "%s/%s\n" ${PWD} $line | tee -a playlist0.m3u8
done < filelist.txt

#    | sort -t'/' -rk7 -k6 \
rm playlist1.m3u8
touch playlist1.m3u8
echo "#EXTM3U" > playlist1.m3u8
find "$(pwd)" -type f -name '*.mp4' -printf '%p\n' \
    | sort -t'/' -rk7 -k6 \
	| tee -a playlist1.m3u8

