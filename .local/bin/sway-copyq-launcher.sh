#!/bin/env bash

function _copyq_reposition() {
  local i=0
  while ! swaymsg "[class=\"^copyq$\"]" resize set 640 640; do 
    sleep 0.1; 
    if [ $i -gt 5 ]; then
      return 1;
    else
      i=$((i+1)); 
    fi
  done;
  swaymsg "[class=\"^copyq$\"]" floating enable;
  swaymsg "[class=\"^copyq$\"]" move position center;
  swaymsg "[class=\"^copyq$\"]" sticky enable;
}

copyq toggle
_copyq_reposition
