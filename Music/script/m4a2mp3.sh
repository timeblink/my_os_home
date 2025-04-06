#!/bin/bash

for i in `find -type f -printf '%P\n' | sort`
do
  n=$(echo $i | awk -F'.' '{print $1}')
  faad -o - $n.m4a | lame - $n.mp3
done
