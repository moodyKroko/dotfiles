#!/bin/bash

killall waybar

if [[ $USER = "moody" ]] then
  waybar -c ~/.config/waybar/config.jsonc & -s ~/.config/waybar/style.css
else
  waybar &
fi
