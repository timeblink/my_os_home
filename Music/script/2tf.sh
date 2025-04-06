#!/bin/bash

rm -rf 2tf
mkdir -p 2tf

f_count=0

set -x

#echo "$a_file_name"
#echo $f_count
#ffmpeg -i "$a_file_name" 2tf/"$f_count".mp3
#let f_count++

traverse_dir(){
	for file in "$1"/*; do
		echo "$file"
		if [ -d "$file" ]; then
			traverse_dir "$file"
		else
			echo $f_count
			ffmpeg -i "$file" 2tf/"$f_count".mp3
			let f_count++
		fi
	done
}

traverse_dir $1
