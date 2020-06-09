#!/bin/zsh

# xfce4 leftovers - GTK theme & icons {{{
  xfsettingsd
  # xfce4-session
# }}}

# inputs {{{
  # natural scrolling {{{
    xinput set-prop 'SYNA8004:00 06CB:CD8B Touchpad' "Synaptics Scrolling Distance" -40, -40 || echo "xinput failed in ~/.xinitrc"
    xinput set-prop 13 "Evdev Wheel Emulation Axes" 7, 6, 5, 4 || echo "xinput failed in ~/.xinitrc"

    xinput set-button-map "TPPS/2 Elan TrackPoint" 1 0 3 5 4 7 6 || echo "xinput failed in ~/.xinitrc"
    xinput set-prop 'Logitech USB Trackball' 293 7, 6, 5, 4 || echo "xinput failed in ~/.xinitrc"
  # }}}

  # disable touchpad {{{
    xinput set-prop 'SYNA8004:00 06CB:CD8B Touchpad' "Device Enabled" 0 || echo "xinput failed in ~/.xinitrc"
    xinput set-prop 'SYNA8004:00 06CB:CD8B Mouse' "Device Enabled" 0 || echo "xinput failed in ~/.xinitrc"
    synclient TouchpadOff=1
  # }}}

  # remap keyboard keys CAPS = (ESC, CTRL), SPACE = (SPACE, FN). (wait for X)
  $(sleep 3 && ~/.xinitrc-keyboard-remap) &

  # keyboard repeat rate
  xset r rate 330 44
# }}}

####### screen(saving) ~~~~~~~~~~~~~~~~~~~
# for actual screensaver (look at ~/.Xdefaults for timeout setting)
# xscreensaver &

# run the xautolock locker wrapper (go blank if no activity) while screen is locked
xss-lock -- ~/.config/i3/lock.sh &

# for blacking out the screen
# xset dpms 1800

# desktop wallpaper (wait for compton)
$(sleep 3 && betterlockscreen -r 2560x1440 -w)

# this is just for setting up xautolock locker, it runs no timer for locking
# xautolock -detectsleep -locker "i3lock-fancy -gp -f Iosevka-Term-Thin-Nerd-Font-Complete-Mono" &
xautolock -detectsleep -locker "betterlockscreen -l blur -r 2560x1440 &" -corners -+0- -cornerdelay 1 -cornersize 12 &
# xautolock -detectsleep -locker "i3lock -c 994488 --ignore-empty-password"

####### autostart apps ~~~~~~~~~~~~~~~~~~~
# FIXME: calendar
# THIS FAILS, don't know why: orage && orage --toggle && orage --toggle
# also need to solve duplicates of events

# eval $(ssh-agent)

# keepassxc (sleep to load i3wm layout)
$(sleep 3 && keepassxc) &

# signal messenger (sleep to load i3wm layout)
$(sleep 3 && signal-desktop) &

# Slack firefox (sleep to load i3wm layout)
# $(sleep 4 && ~/.local/share/applications/Slack\ \[Firefox\].desktop) &

# start cadence session (jack & pulse), no tray
# not using jack anymore: cadence-session-start -s
pulseaudio &

# notification daemon
dunst &

# copyQ
copyq &

# network manager applet
$(sleep 3 && nm-applet) &

# bluetooth manager applet
$(sleep 3 && blueman-applet) &

# volume / audio mixer applet
$(sleep 3 && pasystray --volume-max 100 --volume-inc 3 --notify all) &

# screenshot tool
$(sleep 3 && XDG_CURRENT_DESKTOP=gnome dbus-launch /usr/bin/flameshot) &

####### visual stuff ~~~~~~~~~~~~~~~~~~~~~
# f.lux - night mode applet
#sh -c fluxgui

# init ~/.Xresources
xrdb -merge ~/.Xresources

# exec --no-startup-id compton -cCGb --backend glx --vsync opengl
compton -cCGb --backend glx --vsync opengl
# flash window on focus (wait for compton)
$(sleep 3 && flashfocus) &

exec dbus-launch --exit-with-session i3 # --shmlog-size=26214400 # -d all 2>&1 1>/home/nikola/i3.log
# exec dbus-launch --exit-with-session /usr/bin/i3

