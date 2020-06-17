#!/bin/bash

echo >&2 "inputplug $@"
# #!/bin/bash necessary for ${@:4}
event=$1 id=$2 type=$3 name="${@:4}"

case "$event $type $name" in
    'XIDeviceEnabled XISlaveKeyboard TADA TADA68 Keyboard' | \
    'XIDeviceEnabled XISlaveKeyboard Keebio BDN9 Rev. 1')
        echo "inputplug $name: $event $type"
        sleep 0.5 && "$HOME/.xinitrc-keyboard-remap"
    ;;
esac
