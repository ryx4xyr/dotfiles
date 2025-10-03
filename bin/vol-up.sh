#!/bin/bash

# Aumenta el volumen real
pactl set-sink-volume @DEFAULT_SINK@ +2.5%

# Obtiene el volumen actual del sink predeterminado
# pactl list sinks | grep 'Volume:' | head -n 1 | awk '{print $5}' | sed 's/%//'
# La línea anterior es un poco más robusta para obtener el porcentaje
CURRENT_VOLUME=$(pactl list sinks | grep -A 1 "Default Sink:" | grep 'Volume:' | head -n 1 | awk '{print $5}' | sed 's/%//')

# swayosd-client necesita un entero. Redondeamos el volumen actual.
# Usamos printf para un redondeo más preciso
ROUNDED_VOLUME=$(printf "%.0f" "$CURRENT_VOLUME")

# Muestra el volumen actual en el OSD
swayosd-client --output-volume="$ROUNDED_VOLUME" --monitor=HDMI-A-1
