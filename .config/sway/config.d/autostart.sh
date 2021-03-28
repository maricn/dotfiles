exec kanshi &
exec gammastep &
exec brightnessctl --device='tpacpi::kbd_backlight' s 1

exec sleep 1 && flashfocus &

exec sleep 2 && pulseaudio --start
exec sleep 2 && unset QT_QPA_PLATFORMTHEME && chromium &
exec sleep 2 && unset QT_QPA_PLATFORMTHEME && firefox &

exec sleep 3 && ydotoold &
exec sleep 3 && unset QT_QPA_PLATFORMTHEME && QT_QPA_PLATFORM=wayland copyq &
exec sleep 3 && keepassxc &
exec sleep 3 && signal-desktop-beta &
exec sleep 3 && emote &
#exec sleep 3 && whatsapp-for-linux &

# This just won't work, must start it manually (maybe try with some envvars in the future)
# exec libinput-gestures-setup stop; \
    # sleep 5 && libinput-gestures-setup start

#xrdb -merge ~/.Xresources
