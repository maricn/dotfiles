#!/bin/bash

# Find name of the current workspace
CURR_WS="`swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .current_workspace'`"

# Check if the focused window is marked as main on the current workspace
IS_MAIN="`swaymsg -t get_tree | jq -r \".. | select(.focused?) | .marks | contains([\\\"main-$CURR_WS\\\"])\"`" && \

# swap places, exchange marks, focus stays on the same position (diff window)
if [[ "$IS_MAIN" = "true" ]]; then
    swaymsg swap container with mark "prev-$CURR_WS" && \
    swaymsg unmark "main-$CURR_WS" && \
    swaymsg "[con_mark=\"prev-$CURR_WS\"]" "mark --replace" "main-$CURR_WS" && \
    swaymsg mark "prev-$CURR_WS" && \
    swaymsg "[con_mark=\"main-$CURR_WS\"]" focus;
else \
    swaymsg "[con_mark=\"prev-$CURR_WS\"]" unmark "prev-$CURR_WS"; \
    swaymsg swap container with mark "main-$CURR_WS" && \
    swaymsg "[con_mark=\"main-$CURR_WS\"]" mark "prev-$CURR_WS" && \
    swaymsg mark "main-$CURR_WS" && \
    swaymsg "[con_mark=\"prev-$CURR_WS\"]" focus;
fi
