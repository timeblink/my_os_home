#!/bin/bash

for filename in `find -type f -name '*.flac' -printf '%P\n'`
do
  rm -f ${filename%%.*}.mp3
  ffmpeg -i ${filename} -b:a 320k ${filename%%.*}.mp3
  rm -f ${filename}
done
