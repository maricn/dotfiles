#!/bin/sh

echo >&2 "$@"
event=$1 id=$2 type=$3

case "$event $type" in
    'XIDeviceEnabled XISlaveKeyboard')
        sleep 1 && "$HOME/.xinitrc-keyboard-remap"
esac
