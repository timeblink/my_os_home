#!/bin/bash

#m3u8list=()
#m3u8list+=""

mp4dir=${HOME}/Videos/xrated
mkdir -p ${mp4dir}
tsdir=${HOME}/Videos/xrated.ts
mkdir -p ${tsdir}

LIMIT_RATE="1024"

pushd ${mp4dir}
m3u8list=(`find -name '*.m3u8' -printf '%P\n'|sort`)

pushd ${tsdir}
for m3u8 in ${m3u8list[@]}
do
    rm -f *.ts playlist.m3u8
    name=${m3u8%%.*}
    printf "[ -f %s.mp4 ]\t" "${name}"
    if [ -f ${mp4dir}/${name}.mp4 ]
    then
	printf "\n"
        continue
    fi
    printf "wget --quiet --limit-rate=%sk -c -i %s.txt\n" "${LIMIT_RATE}" "${name}"
    wget --quiet --limit-rate=${LIMIT_RATE}k -c -i ${mp4dir}/${name}.txt
    #printf "cp %s.m3u8 playlist.m3u8\n" "${mp4dir}/${name}"
    cp ${mp4dir}/${name}.m3u8 playlist.m3u8
    #printf "ffmpeg -loglevel repeat+level+fatal -i playlist.m3u8 -c copy %s.mp4\n" "${mp4dir}/${name}" "${mp4dir}/${name}"
    ffmpeg -loglevel repeat+level+fatal -i playlist.m3u8 -c copy ${mp4dir}/${name}.mp4
done
rm -f *.ts playlist.m3u8
popd

popd

exit 0
