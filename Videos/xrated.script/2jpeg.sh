#!/bin/bash

echo $1
echo $2
echo $3

# exit 0

# ffmpeg -loglevel level-8 -i input.mp4 \
#     -ss 00:46:03 -to 00:46:05 \
#     -c:v copy -c:a copy \
#     output.mp4

# ffmpeg -i output.mp4 \
#     -ss 00:00:00 -to 00:00:10 \
#     -y -f image2 -vf fps=1 output_%03d.jpg

ffmpeg -loglevel level-8 -y -i $1 -ss $2 -to $3 -c:v copy -c:a copy output.mp4

ffmpeg -loglevel level-8 -y -i output.mp4 -f image2 -vf fps=1 output_%03d.jpg
