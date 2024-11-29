#!/bin/bash

IFS=' '

read -a strarr < <( wpctl status | /usr/bin/grep "Cannon Lake.*HDMI.*1.*\[vol" )

if [[ ${strarr[1]:0:2} = *[^[:alnum:]]* ]]; then
  foundID="${strarr[2]:0:2}"
else
  foundID="${strarr[1]:0:2}"
fi

echo $foundID
wpctl set-default "${foundID}"
