#!/bin/bash

sshdir=${HOME}/Videos/xrated.ssh
mkdir -p ${sshdir}

mp4dir=${HOME}/Videos/xrated.mp4
mkdir -p ${mp4dir}

tsdir=${HOME}/Videos/xrated.ts
mkdir -p ${tsdir}

ucdir=${HOME}/Videos/xrated.uc
mkdir -p ${ucdir}

trashd=${HOME}//Videos/xrated.trash
mkdir -p ${trashd}

LIMIT_RATE=
h=`date +'%H'`
LIMIT_RATE="128"
[ $h == '00' ] && LIMIT_RATE="2048"
[ $h == '01' ] && LIMIT_RATE="2048"
[ $h == '02' ] && LIMIT_RATE="2048"
[ $h == '03' ] && LIMIT_RATE="2048"
[ $h == '04' ] && LIMIT_RATE="2048"
[ $h == '21' ] && LIMIT_RATE="2048"
[ $h == '22' ] && LIMIT_RATE="2048"
[ $h == '23' ] && LIMIT_RATE="2048"

#pushd ${tsdir}
rm -f *.ts playlist.m3u8

name=$1

# printf "[ -f %s.mp4 ]\t" "${name}"

printf "wget --quiet --limit-rate=%sk -c -i %s.txt\n" "${LIMIT_RATE}" "${name}"
wget --quiet --limit-rate=${LIMIT_RATE}k -c -i ${mp4dir}/${name}.txt
cp ${mp4dir}/${name}.m3u8 playlist.m3u8
ffmpeg -loglevel repeat+level+fatal -i playlist.m3u8 -c copy ${ucdir}/${name}.mp4
res=$?

rm -f *.ts playlist.m3u8
#popd

mv ${mp4dir}/${name}.m3u8 ${trashd}/
mv ${mp4dir}/${name}.txt ${trashd}/

exit 0
