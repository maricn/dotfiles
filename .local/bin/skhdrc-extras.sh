#!/usr/bin/env zsh

function yabai_fullscreen()
{
   SPACE_TYPE=$(yabai -m query --spaces --window | jq '.[] | .["type"]')
   if [[ "$SPACE_TYPE" == "float" ]]; then
       echo $SPACE_TYPE
       WIN_WIDTH=$(yabai -m query --windows --window | jq '.["frame"].w')
       echo $WIN_WIDTH
       WIN_HEIGHT=$(yabai -m query --windows --window | jq '.["frame"].h')
       DIS_WIDTH=$(yabai -m query --displays --window | jq '.["frame"].w')
       DIS_HEIGHT=$(yabai -m query --displays --window | jq '.["frame"].h')
       DIFF=$(( abs($WIN_WIDTH - $DIS_WIDTH) + abs($WIN_HEIGHT - $DIS_WIDTH) ))
       echo $DIFF
       if [[ "$DIFF" -lt "64" ]]; then
           yabai -m window --grid 3:3:1:1:1:1;
       else
           yabai -m window --grid 1:1:0:0:1:1;
       fi
   else
       yabai -m window --toggle zoom-fullscreen;
   fi
}

function daily_standup_screenshot()
{
    local DATE="$(date '+%Y-%m-%d')"
    local TIME="$(date '+%H%M%S')"
    local DIR="$HOME/Pictures/screenshots/standup/$DATE/"
    local FILENAME_ORIG="$DIR/$TIME.png"
    mkdir -p $DIR

    # interactive screen capture
    screencapture -i "$FILENAME_ORIG"

    # interactive note capture
    local DIALOG_RESPONSE=$(osascript -e 'tell app "System Events" to display dialog "Note to be saved in the filename?" default answer "PAPI-" buttons {"Cancel", "Save"} default button "Save"')
    echo $DIALOG_RESPONSE | rg '^button returned:Cancel' && exit 0  # it's ok to cancel
    echo $DIALOG_RESPONSE | rg '^button returned:Save' 1>/dev/null || exit 1  # it's not ok to neither Cancel nor to Save

    # update screenshot filename with the note
    local DIALOG_NOTE="$(echo $DIALOG_RESPONSE | rg 'text returned:(.*)$' -or '$1')"
    mv "$FILENAME_ORIG" "$DIR/$TIME.$DIALOG_NOTE.png"
}
