#!/bin/bash

m3u8dir=/home/atman/Downloads/xrated
m3u8tmp=/home/atman/Downloads/xrated/tmp00
mp4dir=/home/atman/Videos/xrated
m3u8url=$1
name=
relname=
tmp_list=()
mp4_list=()

#set -x

n1=1
n2=2

for i in `find ${mp4dir} -type f -name '*.mp4' | sort`
do
    tmp_list+=($(basename ${i}))
done

for i in `find ${m3u8tmp} -type f -name '*.txt' | sort`
do
    tmp_list+=($(basename ${i}))
done

mp4_list=$(echo "${tmp_list[@]}" | tr ' ' '\n' | sort)

for mp4 in ${mp4_list[@]}
do
    #echo $mp4
    n2=$(echo ${mp4%%.*} | sed 's/^0//g')
    nn=$((n2 - n1))
    #echo $nn
    if [ $nn -gt 1 ]
    then
        name=$((n1 + 1))
        break
    fi
    n1=${n2}
    name=$((n1 + 1))
    #echo ""
done

# echo $name
#exit 0

relname=$(printf '%02d' ${name})

m3u8file=${m3u8tmp}/${relname}.m3u8
txtfile=${m3u8tmp}/${relname}.txt

dirurl=$(dirname ${m3u8url})

set -x
rm -f ${m3u8file}
wget --quiet -O ${m3u8file} ${m3u8url}
set +x

for i in `grep -e '.ts$' ${m3u8file}`
do
    echo ${dirurl}"/"${i} | tee -a ${txtfile}
done

sed -i '1d' ${txtfile}

exit 0
