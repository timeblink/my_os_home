#!/bin/bash

# /home/zzz/Videos/xrated.ssh

# for i in `find -type f -name '*-*.mp4' -printf '%P\n' | awk -F'-' '{print $1}' | sort | uniq`
# do
#   mkdir -p /home/zzz/Videos/xrated.ssh/$i
# done

for i in `find -type f -name '*-*.mp4' -printf '%P\n'`
do
  d=$(echo $i | awk -F'-' '{print $1}')
  n=$(echo $i | awk -F'-' '{print $2}')
  mkdir -p /home/zzz/Videos/xrated.ssh/$d
  mv $i /home/zzz/Videos/xrated.ssh/$d/$n
done

exit 0
