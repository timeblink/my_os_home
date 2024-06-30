#!/bin/bash

sshdir=${HOME}/Videos/xrated.ssh
mkdir -p ${sshdir}

mp4dir=${HOME}/Videos/xrated.mp4
mkdir -p ${mp4dir}

tsdir=${HOME}/Videos/xrated.ts
mkdir -p ${tsdir}

ucdir=${HOME}/Videos/xrated.uc
mkdir -p ${ucdir}

trashd=${HOME}/Videos/xrated.trash
mkdir -p ${trashd}

exehome=${HOME}/Videos/xrated.script

w_count=0
i_sleep=45

while [ $w_count -le 10 ]
do
    let w_count++

    pushd ${mp4dir}
    m3u8list=(`find -name '*.m3u8' -printf '%P\n'|sort -r`)
    popd

    pushd ${tsdir}
    for m3u8 in ${m3u8list[@]}
    do
        name=${m3u8%%.*}
        mp4get=0

        printf "[ -f %s.mp4 ]\t" "${name}"

        if [ -f ${ucdir}/${name}.mp4 ]
        then
            printf " in uc dir \n"
            mp4get=1
        fi

        if [ -f ${mp4dir}/${name}.mp4 ]
        then
            printf " in mp4 dir \n"
            mp4get=1
        fi

        f=`find ${sshdir} -type f -name ${name}.mp4 | wc -l`
        if [ $f -ne 0 ]
        then
            printf " in ssh dir \n"
            mp4get=1
        fi

        if [ $mp4get -ne 0 ]
        then
            mv -f ${mp4dir}/${name}.m3u8 ${trashd}/
            mv -f ${mp4dir}/${name}.txt ${trashd}/
        fi

        [ $mp4get -ne 0 ] && continue

        # printf " download_mp4.sh %s \n" "${name}"
        sh ${exehome}/download_mp4.sh ${name}
        res=$?
        [ $res -ne 0 ] && continue

        [ -f ${mp4dir}/${name}.m3u8 ] && mv ${mp4dir}/${name}.m3u8 ${trashd}/
        [ -f ${mp4dir}/${name}.txt ] && mv ${mp4dir}/${name}.txt ${trashd}/

    done
    popd

    if [ $w_count -ne 0 ]
    then
        # printf "sleep %ss\n" "${i_sleep}"
        sleep ${i_sleep}s
    fi

done

exit 0
