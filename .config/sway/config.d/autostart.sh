exec kanshi &
exec gammastep &
exec brightnessctl --device='tpacpi::kbd_backlight' s 1

exec sleep 1 && pulseaudio --start
exec sleep 1 && flashfocus &
exec libinput-gestures-setup stop; \
    sleep 1 && dex ~/.config/autostart/libinput-gestures.desktop

exec sleep 2 && unset QT_QPA_PLATFORMTHEME && env WAYLAND_DEBUG=1 chromium &
exec sleep 2 && unset QT_QPA_PLATFORMTHEME && env WAYLAND_DEBUG=1 firefox &

exec sleep 3 && unset QT_QPA_PLATFORMTHEME && env WAYLAND_DEBUG=1 QT_QPA_PLATFORM=xcb copyq &
exec sleep 3 && keepassxc &
exec sleep 3 && signal-desktop-beta &
#exec sleep 3 && whatsapp-for-linux &

#xrdb -merge ~/.Xresources
