#!/bin/bash

# Obtener el índice del sink predeterminado
SINK=$(pactl get-default-sink)

# Consultar si está muteado
IS_MUTED=$(pactl get-sink-mute "$SINK" | awk '{print $2}')

# Alternar mute y mostrar OSD
if [ "$IS_MUTED" = "yes" ]; then
    pactl set-sink-mute "$SINK" 0
else
    pactl set-sink-mute "$SINK" 1
fi

# Mostrar OSD (sin cambiar el volumen)
swayosd-client --output-volume=0 --monitor=HDMI-A-1
