exec kanshi &
exec gammastep &
exec mako &
exec brightnessctl --device='tpacpi::kbd_backlight' s 1 &

exec sleep 1 && flashfocus &

exec sleep 2 && pulseaudio --start
exec sleep 2 && unset QT_QPA_PLATFORMTHEME && chromium &
exec sleep 2 && unset QT_QPA_PLATFORMTHEME && firefox &

exec sleep 3 && ydotoold &
exec sleep 3 && unset QT_QPA_PLATFORMTHEME && QT_QPA_PLATFORM=wayland copyq &
exec sleep 3 && keepassxc &
exec sleep 3 && signal-desktop-beta &
exec sleep 3 && emote &
exec sleep 3 && aw-server &

#exec sleep 3 && whatsapp-for-linux &

# This just won't work, must start it manually (maybe try with some envvars in the future)
# exec libinput-gestures-setup stop; \
# trying again with restart instead of start (2021-04-29T12:48:39+0200)
exec sleep 30 && libinput-gestures-setup restart

exec sleep 7 && aw-watcher-window-wayland &
#xrdb -merge ~/.Xresources
