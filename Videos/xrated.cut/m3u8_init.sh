#!/bin/bash

rm playlist1.m3u8
touch playlist1.m3u8
echo "#EXTM3U" > playlist1.m3u8
find "$(pwd)" -type f -name '*.mp4' -printf '%p\n' \
	| sort -t'c' -k1 -rk2 \
	| tee -a playlist1.m3u8
