#!/bin/bash

# /home/zzz/Videos/xrated.ssh

# for i in `find -type f -name '*-*.mp4' -printf '%P\n' | awk -F'-' '{print $1}' | sort | uniq`
# do
#   mkdir -p /home/zzz/Videos/xrated.ssh/$i
# done

for i in `find -type f -name '*-*.mp4' -printf '%P\n'`
do
  #printf '%s' $i
  d=$(echo $i | awk -F'-' '{print $1}')
  n=$(echo $i | awk -F'-' '{print $2}')
  f0=${i%.*}
  f1=${n%.*}
  mkdir -p /home/zzz/Videos/xrated.ssh/$d
  #printf '%s' $d
  mv $i /home/zzz/Videos/xrated.ssh/$d/$n
  #printf '%s' $n
  if [ -f $f0.txt ]
  then
    mv $f0.txt /home/zzz/Videos/xrated.ssh/$d/$f1.txt
  fi
  if [ -f $f1.txt ]
  then
    mv $f1.txt /home/zzz/Videos/xrated.ssh/$d/$f1.txt
  fi
  # touch /home/zzz/Videos/xrated.ssh/$d/$f1.txt
done

exit 0
