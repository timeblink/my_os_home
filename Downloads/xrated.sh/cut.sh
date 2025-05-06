#!/bin/bash

rm /home/zzz/Videos/xrated.ssh/cut.sh
touch /home/zzz/Videos/xrated.ssh/cut.sh

# ffmpeg -i 1739267274.mp4 -ss 02:04:45 -to 02:04:55 -y -c:v copy -c:a copy output.mp4
# ffmpeg -i 1739267274.mp4 -ss 02:04:45 -t 10 -y -c:v copy -c:a copy output.mp4

# -y (global)
#     Overwrite output files without asking.

# -n (global)
#     Do not overwrite output files, and exit immediately if a specified output file already exists.

awk -F',' \
 -v sshd="/home/zzz/Videos/xrated.ssh" \
 -v cutd="/home/zzz/Videos/xrated.cut" \
 '{print "ffmpeg -loglevel level-8",
     "-i",sshd"/"$1"/"$2".mp4",
     "-ss",$3":"$4":"$5,
     "-t 21 -c:v copy -c:a copy",
     "-n",cutd"/"$2"c"$3$4$5".mp4"}' \
 /home/zzz/Videos/xrated.ssh/cut.txt \
 | tee /home/zzz/Videos/xrated.ssh/cut.sh


# pushd /home/zzz/Videos/xrated.cut
# rm *.mp4
# popd 

# exit 0
sh /home/zzz/Videos/xrated.ssh/cut.sh

rm /home/zzz/Videos/xrated.cut/playlist.m3u8
touch /home/zzz/Videos/xrated.cut/playlist.m3u8
echo "#EXTM3U" | tee /home/zzz/Videos/xrated.cut/playlist.m3u8

find /home/zzz/Videos/xrated.cut -type f -name '*.mp4' -printf '%p\n' \
 | tee -a /home/zzz/Videos/xrated.cut/playlist.m3u8

# clear

# echo "mpv -fs --playlist=/home/zzz/Videos/xrated.cut/playlist.m3u8 --loop-playlist=inf --shuffle"
