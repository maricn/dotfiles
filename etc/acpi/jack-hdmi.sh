#!/bin/sh

# Set the laptop or HDMI display as primary and restart i3wm to apply tray_output move and redraw (weird transparency issues workaround)

case "$3" in
    unplug)
        logger "Setting eDP1 as primary X output"
        sudo -u nikola XDG_RUNTIME_DIR=/run/user/1000 DISPLAY=:0 xrandr --output eDP1 --primary && i3-msg restart
        # $(sleep 3 && xrandr --output eDP1 --primary && i3-msg restart)
        ;;
    plug)
        logger "Setting HDMI1 as primary X output"
        sudo -u nikola XDG_RUNTIME_DIR=/run/user/1000 DISPLAY=:0 xrandr --output HDMI1 --primary && i3-msg restart
        ;;
    *) logger "ACPI action for jack-hdmi undefined: $3" ;;
esac
