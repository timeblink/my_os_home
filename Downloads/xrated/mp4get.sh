#!/bin/bash

mp4dir=${HOME}/Videos/xrated
mkdir -p ${mp4dir}

tsdir=${HOME}/Videos/xrated.ts
mkdir -p ${tsdir}

LIMIT_RATE="1024"

w_count=0
i_sleep=45

while [ $w_count -le 10 ]
do
    let w_count++

    pushd ${mp4dir}
    m3u8list=(`find -name '*.m3u8' -printf '%P\n'|sort`)
    popd

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
        cp ${mp4dir}/${name}.m3u8 playlist.m3u8
        ffmpeg -loglevel repeat+level+fatal -i playlist.m3u8 -c copy ${mp4dir}/${name}.mp4
        res=$?
        if [ $res -eq 0 ]
        then
            w_count=0
        fi
    done
    rm -f *.ts playlist.m3u8
    popd

    if [ $w_count -ne 0 ]
    then
        printf "sleep %ss\n" "${i_sleep}"
        sleep ${i_sleep}s
    fi

done