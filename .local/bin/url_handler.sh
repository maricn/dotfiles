#!/bin/bash

# Feed script a url.
# If an image, it will view in imv,
# if a video or gif, it will view in mpv
# if a music file or pdf, it will download,
# otherwise it opens link in browser.

# List of sites that will be opened in mpv.
vidsites="youtube.com
	\|hooktube.com
	\|bitchute.com
	"
ext="${1##*.}"
mpvFiles="mkv mp4 avi"
imvFiles="png jpg jpeg jpe gif"
wgetFiles="mp3 flac opus aac ogg mp3?source=feed pdf"

echo $ext

if echo $imvFiles | grep -w $ext > /dev/null; then
	imv "$1" >/dev/null &
elif echo $mpvFiles | grep -w $ext > /dev/null; then
	mpv --loop --quiet "$1" > /dev/null &
elif echo $wgetFiles | grep -w $ext > /dev/null; then
	wget "$1" >/dev/null &
elif echo "$@" | grep "$vidsites">/dev/null; then
	mpv -quiet "$1" > /dev/null &
else
	/usr/bin/firefox "$1" 2>/dev/null & disown
fi
