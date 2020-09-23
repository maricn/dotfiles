exec pulseaudio --start
exec kanshi &
exec flashfocus &
exec gammastep &
exec pasystray --volume-max 100 --volume-inc 3 --notify all &

exec sleep 1 && unset QT_QPA_PLATFORMTHEME && env WAYLAND_DEBUG=1 chromium &

exec sleep 3 && unset QT_QPA_PLATFORMTHEME && env WAYLAND_DEBUG=1 QT_QPA_PLATFORM=xcb copyq &
exec sleep 3 && keepassxc &
exec sleep 3 && signal-desktop-beta &
#exec sleep 3 && whatsapp-for-linux &
exec sleep 3 && unset QT_QPA_PLATFORMTHEME && env WAYLAND_DEBUG=1 firefox &

#xrdb -merge ~/.Xresources
