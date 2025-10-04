#!/bin/bash

ACTION="$1"
ICON=

case "$ACTION" in
  playpause)
    playerctl -p spotify play-pause
    sleep 0.1
    STATUS=$(playerctl status 2>/dev/null)
    if [[ "$STATUS" == "Playing" ]]; then
      ICON=""
    else
      ICON=""
    fi
    ;;
  next)
    playerctl next
    ICON=""
    ;;
  previous)
    playerctl previous
    ICON=""
    ;;
  *)
    exit 1
    ;;
esac

# Mostrar OSD con el ícono correspondiente
~/.config/eww/scripts/show_media_osd.sh "$ICON"

