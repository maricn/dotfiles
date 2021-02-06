#!/bin/sh

# swaywm-get-window-criteria - Get criteria for use with swaywm config commands

# To use, run this script, then click on a window.
# Output is in the format: [<name>=<value> <name>=<value> ...]

# Remember the previous state of WAYLAND_DEBUG and temporarily run in quiet
wl_debug=$WAYLAND_DEBUG
unset WAYLAND_DEBUG
export WAYLAND_DEBUG=0

# Check for swaymsg, jq, slurp
for cmd in swaymsg jq slurp; do
    if ! which $cmd > /dev/null 2>&1; then
        echo "$PROGNAME: $cmd: command not found" >&2
        exit 1
    fi
done

# Run swaymsg, get all windows
sway_tree=`swaymsg -t get_tree`

# Let the user select the desired window among visible windows
chosen_geo=`WAYLAND_DEBUG=0 echo $sway_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp`

chosen_position=${chosen_geo% *}
chosen_size=${chosen_geo#* }

# echo "position: $chosen_position"
# echo "size: $chosen_size"

chosen_x=${chosen_position%,*}
chosen_y=${chosen_position#*,}

# echo "x: $chosen_x"
# echo "y: $chosen_y"

chosen_width=${chosen_size%x*}
chosen_height=${chosen_size#*x}

# echo "w: $chosen_width"
# echo "h: $chosen_height"

chosen_window=`echo $sway_tree | jq -r ".. | select(.pid? and .visible?) | select(.rect.x==$chosen_x and .rect.y==$chosen_y and .rect.width==$chosen_width and .rect.height==$chosen_height)"`
echo $chosen_window | jq

export WAYLAND_DEBUG=$wl_debug
