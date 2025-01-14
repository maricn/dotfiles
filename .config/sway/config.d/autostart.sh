# replaced by way-displays
# exec kanshi &
exec way-displays > /tmp/way-displays.${XDG_VTNR}.${USER}.log 2>&1
exec "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" &

# notifications
exec mako &


exec brightnessctl --device='tpacpi::kbd_backlight' s 1 &

exec sleep 1 && flashfocus &
exec sleep 1 && keepassxc &

# exec sleep 2 && unset QT_QPA_PLATFORMTHEME && chromium &
exec sleep 2 && unset QT_QPA_PLATFORMTHEME && firefox &

exec sleep 3 && ydotoold &
exec sleep 3 && unset QT_QPA_PLATFORMTHEME && QT_QPA_PLATFORM=wayland copyq &
exec sleep 3 && signal-desktop &
exec sleep 3 && emote &
# exec sleep 3 && aw-server &
exec sleep 3 && sworkstyle &
exec sleep 3 && bluetooth-autoconnect -d &
# no gammastep if the BenQ projector is connected on startup
exec sleep 3 && way-displays -g | grep -q "BenQ PJ" && gammastep-indicator &

#exec sleep 3 && whatsapp-for-linux &

# This just won't work, must start it manually (maybe try with some envvars in the future)
# exec libinput-gestures-setup stop; \
# trying again with restart instead of start (2021-04-29T12:48:39+0200)
exec sleep 20 && libinput-gestures-setup restart

# exec sleep 7 && aw-watcher-window-wayland &
exec sleep 7 && festival --server &
#xrdb -merge ~/.Xresources
