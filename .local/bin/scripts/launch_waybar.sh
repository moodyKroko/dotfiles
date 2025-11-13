#!/bin/bash

# enable later
CONFIG=~/.config/waybar/config.jsonc
STYLE=~/.config/waybar/style.css

if pgrep -x "waybar" > /dev/null; then
  killall -SIGUSR2 waybar
else
  if [[ $USER = "moody" ]] then
    waybar -c $CONFIG -s $STYLE > /dev/null 2>&1 &
  else
    waybar /dev/null 2>&1 &
  fi
fi
