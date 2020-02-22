#!/bin/bash
set -e 

xset s off dpms 0 10 0
xautolock -detectsleep -locknow
xset s off -dpms
