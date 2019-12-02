#!/bin/bash

wid=`xdotool search --classname urxvtq | head -n 1`
if [ -z "$wid" ]; then
   /usr/bin/urxvt -geometry 320x34+0+0 -name urxvtq -depth 32 -b rgba:1111/1111/1111/aaaa
   wid=$(xdotool search --classname urxvtq | head -n 1)
   xdotool windowfocus $wid
else
    if [ -z "$(xdotool search --onlyvisible --classname urxvtq 2>/dev/null | head -n 1)" ];     then
        xdotool windowmap $wid
        xdotool windowfocus $wid
    else
        xdotool windowunmap $wid
    fi
fi
