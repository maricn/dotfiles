#!/usr/bin/env sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# yabai_mode=$(yabai -m query --spaces --display | jq -r 'map(select(."has-focus" == true))[-1].type')

# case "$yabai_mode" in
#   bsp)   ICON=􀏝 ;;
#   stack) ICON=􀏜 ;;
#   float) ICON=􀢌 ;;
# esac

# case $SENDER in
  # "display_change")
  #   internal_display_id=$(system_profiler -json SPDisplaysDataType  | jq -r '.SPDisplaysDataType[0].spdisplays_ndrvs | map(select(.spdisplays_connection_type == "spdisplays_internal"))[-1]._spdisplays_displayID')
  #   selected_display_id=$(yabai -m query --displays --display | jq -r '.id')

  #   if [ $selected_display_id = $internal_display_id ]; then
  #     sketchybar --set $NAME position=left
  #   else
  #     sketchybar --set $NAME position=center
  #   fi
  #   ;;

#   *) sketchybar --set $NAME label="$INFO";;
# esac

sketchybar --set "$NAME" label="$INFO"

# (
# apps=$(yabai -m query --windows --space | jq -r '.[1:][].app')

# IFS=$'\n' read -r -d '' -a appsarr <<< "$apps"

# sketchybar --remove $NAME.*

# for ((i = 0; i < ${#appsarr[@]}; i++)); do
#   sketchybar                                  \
#     --add item $NAME.$i left                  \
#     --set $NAME.$i                            \
#         icon.drawing=off                      \
#         background.drawing=off                \
#         label.color=0x6Fa5adcb                \
#         label="${appsarr[$i]}"                \
#         label.padding_left=0                  \
#         associated_display=active
# done
# )
