#!/bin/bash

#    | sort -t'/' -rk7 -k6 \
rm playlist.m3u8
touch playlist.m3u8
echo "#EXTM3U" > playlist.m3u8
find "$(pwd)" -type f -name '*.mp4' -printf '%p\n' \
    | sort -t'/' -rk7 -k6 \
	| tee -a playlist.m3u8

