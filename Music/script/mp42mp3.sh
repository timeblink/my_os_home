#!/bin/bash

for filename in `find -type f -name '*.mp4' -printf '%P\n'`
do
  rm -f ${filename%%.*}.mp3
  # ffmpeg -i ?.mp4 ?.mp3
	# ffmpeg -i input.mp4 -vn output.aac
	# ffmpeg -i output.aac -ab 320k -ar 44100 -ac 2 output.mp3
  ffmpeg \
	  -i ${filename} \
	  -vn \
	  -acodec libmp3lame \
	  -ab 320k \
	  -ar 44100 \
	  -ac 2 \
	  ${filename%%.*}.mp3
  rm -f ${filename}
done
