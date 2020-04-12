#!/bin/sh

# xfce4 leftovers - GTK theme & icons
xfsettingsd
# xfce4-session

# inputs ~~~~~~~~~~~~~~~~~~~~~~~~~~~
# natural scrolling??
xinput set-prop 'SYNA8004:00 06CB:CD8B Touchpad' "Synaptics Scrolling Distance" -40, -40 || echo "xinput failed in ~/.xinitrc"
xinput set-prop 13 "Evdev Wheel Emulation Axes" 7, 6, 5, 4 || echo "xinput failed in ~/.xinitrc"

xinput set-button-map "TPPS/2 Elan TrackPoint" 1 0 3 5 4 7 6 || echo "xinput failed in ~/.xinitrc"
xinput set-prop 'Logitech USB Trackball' 293 7, 6, 5, 4 || echo "xinput failed in ~/.xinitrc"

# disable touchpad
xinput set-prop 'SYNA8004:00 06CB:CD8B Touchpad' "Device Enabled" 0 || echo "xinput failed in ~/.xinitrc"
xinput set-prop 'SYNA8004:00 06CB:CD8B Mouse' "Device Enabled" 0 || echo "xinput failed in ~/.xinitrc"
synclient TouchpadOff=1

# keyboard remappings
# start with xkbcomp
xkbcomp ~/.dotfiles/xkb/xkb_US-RSl-RSc-DE.xkb $DISPLAY
# quick tap on caps generates escape, quick tap on space generates space
# otherwise caps is used as LCTL and space as ISO_Level3_Shift
xcape -t 135 -e 'Control_L=Escape;Hyper_L=space'
# map anything to space & Caps_Lock so they stay functional
xmodmap -e "keycode any = space"
xmodmap -e "keycode any = Caps_Lock"

# keyboard repeat rate
xset r rate 330 44

# screensaving ~~~~~~~~~~~~~~~~~~~~~
# for actual screensaver (look at ~/.Xdefaults for timeout setting)
# xscreensaver &

# run the xautolock locker wrapper (go blank if no activity) while screen is locked
xss-lock -- ~/.config/i3/lock.sh &

# for blacking out the screen
# xset dpms 1800

# desktop wallpaper
betterlockscreen -w

# this is just for setting up xautolock locker, it runs no timer for locking
# xautolock -detectsleep -locker "i3lock-fancy -gp -f Iosevka-Term-Thin-Nerd-Font-Complete-Mono" &
xautolock -detectsleep -locker "betterlockscreen -l blur -r 3840x2160 &" -corners -+0- -cornerdelay 1 -cornersize 12 &
# xautolock -detectsleep -locker "i3lock -c 994488 --ignore-empty-password"

# autostart apps ~~~~~~~~~~~~~~~~~~~
# calendar
# THIS FAILS, don't know why: orage && orage --toggle && orage --toggle

# eval $(ssh-agent)

# keepassxc to tray
keepassxc &

# start cadence session (jack & pulse), no tray
# not using jack anymore: cadence-session-start -s
pulseaudio &

# notification daemon
dunst &

# copyQ
copyq &

# network manager applet
$(sleep 3 && nm-applet) &

# visual stuff ~~~~~~~~~~~~~~~~~~~~~
# f.lux - night mode applet
#sh -c fluxgui

# init ~/.Xresources
xrdb -merge ~/.Xresources

# exec --no-startup-id compton -cCGb --backend glx --vsync opengl
compton -cCGb --backend glx --vsync opengl
$(sleep 3 && flashfocus) &

exec i3 # --shmlog-size=26214400 # -d all 2>&1 1>/home/nikola/i3.log
# exec dbus-launch --exit-with-session /usr/bin/i3

