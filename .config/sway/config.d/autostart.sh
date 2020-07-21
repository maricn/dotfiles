exec pulseaudio --start
exec kanshi &
exec flashfocus &
exec pasystray --volume-max 100 --volume-inc 3 --notify all &

exec copyq &
exec keepassxc &
exec signal-desktop &

#xrdb -merge ~/.Xresources
