#!/usr/bin/env bash

# get path where the script is located to find the lock icon
script_path=$(readlink -f -- "$0")
script_path=${script_path%/*}

echo "$script_path"
#icon="$script_path/icons/lock.png"
tmpbg="/tmp/screen.png"
echo "$icons"
(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -i "$tmpbg"
