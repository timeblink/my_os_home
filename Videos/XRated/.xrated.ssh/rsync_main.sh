#!/bin/bash

#cat filelist*.txt > filelist.txt

rm rsync_filelist.sh
cat filelist.txt | awk -F'/' '{print \
  "rsync -rav --partial --update /home/zzz/Public/Videos/XRated/xrated.ssh/" \
  $1"/"$2 \
  " /home/zzz/Videos/XRated/.xrated.ssh/"$1"/"}' \
  | tee rsync_filelist.sh



exit 0
rm rsync_filelist1.sh
awk -F'/' '{print \
  "rsync -rav --partial --update zzz@192.168.12.102:Videos/XRated/.xrated.ssh/" \
  $1"/"$2 \
  " /home/zzz/Videos/XRated/.xrated.ssh/"$1"/"}' \
  filelist1.txt | tee rsync_filelist1.sh

rm rsync_filelist0.sh
awk -F'/' '{print \
  "rsync -rav --partial --update zzz@192.168.12.102:Videos/XRated/.xrated.ssh/" \
  $1"/"$2 \
  " /home/zzz/Videos/XRated/.xrated.ssh/"$1"/"}' \
  filelist0.txt | tee rsync_filelist0.sh

exit 0
#    --exclude '*/' \
#    --dry-run \
rsync -rav --partial --update \
    --exclude='*' --exclude-from=rsync_rule.txt \
    --dry-run \
    zzz@192.168.12.102:Videos/XRated/.xrated.ssh/ \
    /home/zzz/Videos/XRated/.xrated.ssh

