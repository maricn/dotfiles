#!/bin/bash

TERM=alacritty
# TERM=kitty

"$TERM" --class=launcher --title "sway-launcher-desktop" -e env TERMINAL_COMMAND="$TERM -e" /usr/bin/sway-launcher-desktop &

while ! swaymsg "[app_id=\"^launcher$\"]" resize set 640 640; do sleep 0.1; done \
    && swaymsg "[app_id=\"^launcher$\"]" move position center;
    # && while ! swaymsg "[app_id=\"^launcher$\"]" resize set 640 640; do sleep 0.1; done;
