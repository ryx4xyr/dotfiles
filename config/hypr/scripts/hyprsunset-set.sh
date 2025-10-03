#!/bin/bash

MODE=$1
TEMP=3800

# Añade una variable para el nombre de la app para que las notificaciones se agrupen correctamente
APP_NAME="Hyprsunset"

# Si no se pasa un modo, muestra una ayuda.
if [[ -z "$MODE" ]]; then
    notify-send -a "$APP_NAME" "Error" "Falta el argumento. Usa 'day' o 'night'."
    exit 1
fi

if [[ "$MODE" == "day" ]]; then
    hyprctl hyprsunset identity
    notify-send -a "$APP_NAME" -i "weather-clear" "Hyprsunset" "Filtro desactivado (tono natural)"
elif [[ "$MODE" == "night" ]]; then
    hyprctl hyprsunset temperature $TEMP
    notify-send -a "$APP_NAME" -i "weather-clear-night" "Hyprsunset" "Filtro activado (${TEMP}K)"
else
    # Maneja argumentos inválidos
    notify-send -a "$APP_NAME" -i "dialog-error" "Hyprsunset" "Modo no reconocido: '$MODE'. Usa 'day' o 'night'."
    exit 1
fi
