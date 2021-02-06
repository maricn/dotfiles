#!/bin/bash

# Find name of the current workspace
CURR_WS="`swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .current_workspace'`"

# (un)Mark the active window as main on the current workspace
swaymsg "mark --toggle" "main-$CURR_WS"
