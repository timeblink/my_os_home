#!/bin/bash

#cat sort_list*.txt > filelist.txt

rm rsync_filelist.sh
cat filelist.txt | awk -F'/' '{print \
  "rsync -rav --partial --update /home/zzz/Public/Videos/XRated/xrated.ssh/" \
  $1"/"$2 \
  " /home/zzz/Videos/XRated/.xrated.ssh/"$1"/"}' \
  | tee rsync_filelist.sh

