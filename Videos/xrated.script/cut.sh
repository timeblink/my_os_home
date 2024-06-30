#!/bin/bash

rm -f /home/zzz/Videos/xrated.ssh/cut.sh
touch /home/zzz/Videos/xrated.ssh/cut.sh

# ffmpeg -i 1739267274.mp4 -ss 02:04:45 -to 02:04:55 -y -c:v copy -c:a copy output.mp4
# ffmpeg -i 1739267274.mp4 -ss 02:04:45 -t 10 -y -c:v copy -c:a copy output.mp4

# -y (global)
#     Overwrite output files without asking.

# -n (global)
#     Do not overwrite output files, and exit immediately if a specified output file already exists.

grep -v "\--,--,--" /home/zzz/Videos/xrated.ssh/cut.txt \
 | awk -F',' \
 -v sshd="/home/zzz/Videos/xrated.ssh" \
 -v cutd="/home/zzz/Videos/xrated.cut" \
 '{print "ffmpeg -loglevel level-8",
     "-i",sshd"/"$1"/"$2".mp4",
     "-ss",$3":"$4":"$5,
     "-t 21 -c:v copy -c:a copy",
     "-n",cutd"/"$2"c"$3$4$5".mp4"}' \
 | tee /home/zzz/Videos/xrated.ssh/cut.sh

sh /home/zzz/Videos/xrated.ssh/cut.sh

rm -f /home/zzz/Videos/xrated.cut/playlist.m3u8
touch /home/zzz/Videos/xrated.cut/playlist.m3u8
echo "#EXTM3U" | tee /home/zzz/Videos/xrated.cut/playlist.m3u8

find /home/zzz/Videos/xrated.cut -type f -name '*.mp4' -printf '%p\n' \
 | sort -t'/' -k5.5,5.9 -r \
 | tee -a /home/zzz/Videos/xrated.cut/playlist.m3u8

exit 0

cp cut.txt ~/Desktop/my_os_home/Downloads/xrated.sh/cut.txt

find -type f -name '*.mp4' -printf '%P\n' \
  | awk -F'.' '{print $1}' \
  | awk -F'/' '{print $1","$2",--,--,--"}' \
  | tee 2.txt

mv cut.txt 1.txt

cat 1.txt 2.txt | sort -k1,1 -k2,2n | tee cut.txt

rm 1.txt 2.txt

exit 0
