#!/bin/bash

# Get the names of your displays
INTERNAL="eDP-1"    # Typically the internal laptop display
EXTERNAL="HDMI-A-1" # Your external display, adjust as needed
DEFAULT_ENABLE="${INTERNAL}, 1920x1080@60, 0x0, 1"

if [[ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]]; then

  if ! command -v jq &>/dev/null; then
    notify-send -u critical "Error: jq is required but not installed."
    exit 1
  fi

  connected_monitors=$(hyprctl monitors all -j | jq -r '.[].name')

  case "${connected_monitors}" in
  *"${EXTERNAL}"*)
    hyprctl keyword monitor "${INTERNAL},disable"
    ;;
  *)
    hyprctl keyword monitor "${DEFAULT_ENABLE}"
    ;;
  esac
  exit 0
fi

if pgrep -x "i3" >/dev/null; then
  connected_x_monitors=$(xrandr --query | awk '/ connected/ {print $1}')

  case "${connected_x_monitors}" in
  *"${EXTERNAL}"*)
    xrandr --output "${INTERNAL}" --off \
      --output "${EXTERNAL}" --auto --primary --mode 1920x1080 --rate 74.99
    ;;
  *)
    xrandr --output "${INTERNAL}" --auto --primary
    ;;
  esac

  # Restart i3 to apply changes
  i3-msg restart
fi
