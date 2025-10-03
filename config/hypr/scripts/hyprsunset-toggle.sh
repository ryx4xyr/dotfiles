#!/bin/bash
# Toggle simple usando IPC; persiste estado en /tmp hasta el próximo perfil programado
STATE=/tmp/hyprsunset_toggle_state
TEMP=3800   # tu “cálido” preferido

APP_NAME="Hyprsunset" # Agregamos el nombre de la app para agrupar notificaciones

if [[ -f "$STATE" && "$(cat "$STATE")" == "on" ]]; then
    hyprctl hyprsunset identity
    echo "off" > "$STATE"
    notify-send -a "$APP_NAME" -i "weather-clear" "Hyprsunset" "Filtro de luz azul: desactivado (tono natural)"
else
    hyprctl hyprsunset temperature "$TEMP"
    echo "on" > "$STATE"
    notify-send -a "$APP_NAME" -i "weather-clear-night" "Hyprsunset" "Filtro de luz azul: activado (${TEMP}K)"
fi
