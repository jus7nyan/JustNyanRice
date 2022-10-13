#!/bin/bash
video=$(xclip -o)

declare -A myArray=( [mp3]=1 [mp4]=2 )

choice=$(printf "%s\n" "${!myArray[@]}" | dmenu -fn monospace-9)

if [ "${myArray[$choice]}" == "1" ]
then
        yt-dlp -f 'ba' -x --audio-format mp3 $video  -o '/home/justnyan/yt/%(title)s.%(ext)s'
else
        yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' $video -o '/home/justnyan/yt/%(title)s.%(ext)s'
fi
