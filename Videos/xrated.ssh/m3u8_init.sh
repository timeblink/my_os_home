#!/bin/bash

rm playlist1.m3u8
touch playlist1.m3u8
echo "#EXTM3U" > playlist1.m3u8
find /home/zzz/Videos/xrated.ssh -type f -name '*.mp4' -printf '%p\n' \
	| sort -t'/' -rk7 \
	| tee -a playlist1.m3u8

rm playlist2.m3u8
touch playlist2.m3u8
echo "#EXTM3U" > playlist2.m3u8
cat filelist.txt | tee -a playlist2.m3u8

rm playlist3.m3u8
touch playlist3.m3u8
echo "#EXTM3U" > playlist3.m3u8
diff playlist1.m3u8 playlist2.m3u8 \
	| grep '<' | cut -c3- | sort | uniq \
	| sort -t'/' -rk7 | tee -a playlist3.m3u8
