#!/bin/bash

grep -v '\--,--,--' cut.txt > 1.txt

find -type f -name '*.mp4' -printf '%P\n' \
    | awk -F'.' '{print $1}' \
    | awk -F'/' '{print $1","$2",--,--,--"}' > 2.txt 


rm -f 11.txt
touch 11.txt

while read line
do
    d0=$(echo $line | awk -F',' '{print $1}')
    f=$(echo $line | awk -F',' '{print $2}')
    h=$(echo $line | awk -F',' '{print $3}')
    m=$(echo $line | awk -F',' '{print $4}')
    s=$(echo $line | awk -F',' '{print $5}')
    d1=$(grep $f 2.txt | awk -F',' '{print $1}')
    printf "%s,%s,%s,%s,%s\n" $d1 $f $h $m $s | tee -a 11.txt
done < 1.txt


rm -f 22.txt
touch 22.txt

while read line
do
    d0=$(echo $line | awk -F',' '{print $1}')
    f=$(echo $line | awk -F',' '{print $2}')
    grep $f 1.txt
    ret=$?
    if [ $ret == 1 ] ; then
        printf "%s,%s,--,--,--\n" $d0 $f | tee -a 22.txt
    fi
done < 2.txt


cat 11.txt 22.txt | sort -t, -k1,1 -k2,2 > cut.txt
