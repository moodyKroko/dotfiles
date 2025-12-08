#!/bin/bash

# Get the names of your displays
INTERNAL="eDP-1"    # Typically the internal laptop display
EXTERNAL="HDMI-A-1" # Your external display, adjust as needed
DEFAULT_ENABLE="$INTERNAL, 1920x1080@60, 0x0, 1"

if printenv | grep -q "HYPRLAND_INSTANCE_SIGNATURE"; then
  if hyprctl monitors | grep -q $EXTERNAL; then
    hyprctl keyword monitor "$INTERNAL,disable"
  else
    hyprctl keyword monitor "$DEFAULT_ENABLE"
  fi
  exit 0
fi

if pgrep -x "i3" >/dev/null; then
  # Check if the external display is connected
  if xrandr | grep "$EXTERNAL connected"; then
    xrandr --output "$INTERNAL" --off --output "$EXTERNAL" --auto --primary --mode 1920x1080 --rate 74.99
  else
    # If no external display, ensure internal is on
    xrandr --output "$INTERNAL" --auto --primary
  fi

  # Restart i3 to apply changes
  i3-msg restart
fi
