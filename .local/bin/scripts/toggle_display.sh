#!/bin/bash

INTERNAL="eDP-1"
EXTERNAL="HDMI-A-1"
DEFAULT_ENABLE="${INTERNAL},preferred,auto,1"

# for i3wm =====================
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
  exit 0
fi

# for hyprland =====================
handle_monitor() {
  if [ "$1" = "monitoradded>>HDMI-A-1" ]; then
    hyprctl keyword monitor "${INTERNAL},disable"
    hyprctl keyword monitor "${EXTERNAL},1920x1080@74.99,auto,1"
  elif [ "$1" = "monitorremoved>>HDMI-A-1" ]; then
    hyprctl keyword monitor "${DEFAULT_ENABLE}"
    hyprctl keyword monitor "${EXTERNAL},preferred,auto,1"
  fi
}

# wait for the process to send data that notifies about monitor being added/removed
# then use handle_monitor to enable/disable monitor
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle_monitor "$line" && sleep 0.1; done
