#!/bin/bash

set -xe

BT_ATTEMPTS=0
while true; do
  bluetoothctl connect "54:78:C9:7E:2D:47"
  BT_SUCCESS=$?
  sleep 1
  $BT_SUCCESS == 0 || break
  # if [[ $BT_SUCCESS != 0 || (((BT_ATTEMPTS++))  5) ]]; then break; fi
done

IFS=' '

read -a strarr < <( wpctl status | /usr/bin/grep "WiiM Ultra *\[vol" )

if [[ ${strarr[1]:0:3} = *[^[:alnum:]]* ]]; then
  foundID="${strarr[2]:0:3}"
else
  foundID="${strarr[1]:0:3}"
fi

echo $foundID
wpctl set-default "${foundID}"

export SDL_JOYSTICK_HIDAPI_XBOX_ONE_HOME_LED=0.1

curl -i -k https://192.168.178.173/httpapi.asp?command=setPlayerCmd:switchmode:bluetooth
