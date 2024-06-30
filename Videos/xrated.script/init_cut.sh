#!/bin/bash

touch cut.txt

echo -n "" > cut.txt

for i in `find -mindepth 2 -maxdepth 2 -type f -name '*.txt' -printf '%P\n' | awk -F'.' '{print $1}'`
do
  d=$(echo $i | awk -F'/' '{print $1}')
  f=$(echo $i | awk -F'/' '{print $2}')
  while read line
  do
    # printf '%s\n' $line
    h=$(echo $line | awk -F':' '{print $1}')
    m=$(echo $line | awk -F':' '{print $2}')
    s=$(echo $line | awk -F':' '{print $3}')
    printf '%s,%s,%s,%s,%s\n' $d $f $h $m $s | tee -a cut.txt
  done < $i.txt
done

exit 0
