#!/bin/bash

#rm tmp.sh
#touch tmp.sh
#chmod +x tmp.sh
#echo "\$!/bin/bash" | tee tmp.sh
#cat rsync_include.txt \
#    | awk '{print "rsync -rav --partial --update zzz@192.168.12.104:Videos/xrated.ssh/"$1,"."}' \
#    | tee -a tmp.sh

#exit 0

#    --exclude '*/' \
#    --dry-run \
rsync -rav --partial --update \
    --include-from=rsync_include.txt \
    --exclude-from=rsync_exclude.txt \
    zzz@192.168.12.108:Videos/xrated.ssh/ \
    /home/zzz/Videos/xrated.ssh

#rsync -rav --partial --update zzz@192.168.12.104:Videos/xrated.ssh/桃乃木香奈 /home/zzz/Videos/xrated.ssh/
