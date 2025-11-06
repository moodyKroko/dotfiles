#!/bin/bash

killall waybar

if [[ $USER = "moody" ]] then
  waybar -c ~/.config/waybar/config.jsonc & -s ~/.config/waybar/style.css
else
  waybar &
fi

# enable later
# CONFIG='dir/config/jsonc'
# STYLE='dir/style.css'

# if pgrep -x "waybar" > /dev/null; then
#   killall -SIGUSR2 waybar
# else
#   if [[ $USER = "moody" ]] then
#     waybar -c "$CONFIG" -s "$STYLE" > /dev/null 2>&1 &
#   else
#     waybar /dev/null 2>&1 &
#   fi
# fi
