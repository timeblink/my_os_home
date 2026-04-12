#!/bin/bash

x_path="/home/zzz/Pictures/xrated"

for i in `find ${x_path} -mindepth 1 -type d`
do
  cd $i
  rm *.jpg *.jpeg *.gif
  wget -i url.txt
  ffmpeg -framerate 1/2 -i %03d.jpg -c:v gif -y $i.gif
  cd /home/zzz/Pictures/xrated
done
