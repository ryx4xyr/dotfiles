#!/bin/bash

# Baja el volumen real en 2.5%
pactl set-sink-volume @DEFAULT_SINK@ -2.5%

# Obtiene el volumen actual del sink predeterminado
CURRENT_VOLUME=$(pactl list sinks | grep -A 1 "Default Sink:" | grep 'Volume:' | head -n 1 | awk '{print $5}' | sed 's/%//')

# swayosd-client necesita un entero. Redondeamos el volumen actual.
ROUNDED_VOLUME=$(printf "%.0f" "$CURRENT_VOLUME")

# Muestra el volumen actual en el OSD
swayosd-client --output-volume="$ROUNDED_VOLUME" --monitor=HDMI-A-1
