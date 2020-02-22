#!/bin/sh

# xfce4 leftovers - GTK theme & icons
xfsettingsd
# xfce4-session

# natural scrolling??
xinput set-prop 11 "Synaptics Scrolling Distance" -40, -40
xinput set-prop 13 "Evdev Wheel Emulation Axes" 7, 6, 5, 4

# Thinkpad TrackPoint natural scroll
xinput set-button-map "TPPS/2 Elan TrackPoint" 1 0 3 5 4 7 6

# keyboard remappings
# use only xkb, not: xmodmap ~/.Xmodmap

# keyboard repeat rate
xset r rate 330 44

# disable touchpad
xinput set-prop 11 "Device Enabled" 0
synclient TouchpadOff=1

# screensaving ~~~~~~~~~~~~~~~~~~~~~
# for actual screensaver (look at ~/.Xdefaults for timeout setting)
xscreensaver &
# run the i3lock-fancy wrapper (go blank if no activity) on screen lock
xss-lock -- ~/.config/i3/lock.sh &
# for blacking out the screen
# xset dpms 1800
# this is just for setting up xautolock locker, it runs no timer for locking
# xautolock -detectsleep -locker "i3lock-fancy -gp -f Iosevka-Term-Thin-Nerd-Font-Complete-Mono" &
xautolock -detectsleep -locker "betterlockscreen -l blur &" &
# xautolock -detectsleep -locker "i3lock -c 994488 --ignore-empty-password"

# calendar
# orage && orage --toggle && orage --toggle

# network manager applet
nm-applet &

# keepassxc to tray
keepassxc &

# start cadence session (jack & pulse), no tray
cadence-session-start -s

# notification daemon
dunst &

# copyQ
copyq &

# f.lux - night mode applet
#sh -c fluxgui

# eval $(ssh-agent)

# init ~/.Xresources
xrdb -merge ~/.Xresources

# exec --no-startup-id compton -cCGb --backend glx --vsync opengl
compton -cCGb --backend glx --vsync opengl
flashfocus &
exec i3 # --shmlog-size=26214400 # -d all 2>&1 1>/home/nikola/i3.log
# exec dbus-launch --exit-with-session /usr/bin/i3

