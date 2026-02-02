#!/bin/bash

filename=$1
output_f=/dev/null

#rm simple.txt

echo ${filename} | tee ${output_f}
echo "" | tee -a ${output_f}

arr_i=('I0微信' 'I1开箱' 'I2功德' 'I3牌位' 'I4佛事' 'I5流通')

for arr in "${arr_i[@]}"
do
   grep "${arr}" ${filename} \
    | awk -v aname=${arr} -F',' '{sum += $3}END{printf "%s = %.2f\n",aname,sum}' \
    | tee -a ${output_f}
done

arr_o=('O0伙食' 'O1薪酬' 'O2慈善' 'O3交通' 'O4日常' 'O6电话' 'O7活动' 'O8手续')
for arr in "${arr_o[@]}"
do
   grep "${arr}" ${filename} \
    | awk -v aname=${arr} -F',' '{sum += $4}END{printf "%s = %.2f\n",aname,sum}' \
    | tee -a ${output_f}
done


