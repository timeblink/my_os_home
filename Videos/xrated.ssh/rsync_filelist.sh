#!/bin/bash

# # filelist.txt filelist2.txt
# cat filelist.txt \
#     | awk -F'/' '{print "rsync -rav zzz@192.168.12.104:Videos/xrated.ssh/"$6"/"$7"  "$6"/"}' \
#     | tee -a rsync.sh && exit 0

# --dry-run \
rsync -rav --partial --update \
    --dry-run \
    --include-from=rsync_include.txt \
    --exclude '*/' \
    zzz@192.168.12.104:Videos/xrated.ssh/ \
    /home/zzz/Videos/xrated.ssh

#rsync -rav --partial --update zzz@192.168.12.104:Videos/xrated.ssh/桃乃木香奈 /home/zzz/Videos/xrated.ssh/
