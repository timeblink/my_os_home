#!/bin/bash

pushd ~/Videos/xrated.script

#python fetch_list.py
#python fetch_detail.py

sh loop_download_m3u8.sh
sh loop_download_mp4.sh

popd

exit 0
