#!/bin/bash

set -e
set -x

# is supposed to be the only exfat device connected to the laptop - /dev/sda1 usually
# using hacky way to interact with udisksctl bc i don't understand its interface
# DEVICE="$(udisksctl dump | grep -o exfat -B20 | grep '^\ *Device:' | awk '{ print $2 }' | grep -o '/dev/sda1' )"
DEVICE="/dev/sda1"
udisksctl mount -b "$DEVICE"

DIR_CLIP="$HOME/Videos/CLIP"
DIR_PHOTO="$HOME/Pictures/100MSDCF"

# list files sorted by time modified, 1 per line; exclude directories and picture profile files; find the latest
NEWEST_CLIP="$(ls -tA1 "$DIR_CLIP" | egrep -v '^d' | head -n1)"
NEWEST_PHOTO="$(ls -tA1 "$DIR_PHOTO" | egrep -v '^d|.pp3$|converted' | head -n1)"

find /run/media/nikola/disk/PRIVATE/M4ROOT/CLIP \
    -type f -name "*.MP4" -newer "$DIR_CLIP/$NEWEST_CLIP" \
    -exec cp -nv -t "$DIR_CLIP" "{}" \+ 
find /run/media/nikola/disk/DCIM/100MSDCF \
    -type f -name "*.ARW" -newer "$DIR_PHOTO/$NEWEST_PHOTO" \
    -exec cp -nv -t "$DIR_PHOTO" "{}" \+

udisksctl unmount -b "$DEVICE"
