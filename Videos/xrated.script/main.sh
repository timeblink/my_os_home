#!/bin/bash

pushd ~/Desktop/my_os_home/Downloads/xrated.sh

#python untitled.py
python get_m3u_url.py
sh loop_download_m3u8.sh
sh loop_download_mp4.sh

popd

exit 0
