#!/bin/bash
TEMPS=(5000 4600 4200 3800 3400)  # edita a gusto
IDX_FILE=/tmp/hyprsunset_temp_idx

# Deshabilitar todos los perfiles definidos en hyprsunset.conf
# Esto permite que el cambio manual persista.
hyprctl hyprsunset disable all

idx=0
[[ -f "$IDX_FILE" ]] && idx=$(cat "$IDX_FILE")
idx=$(( (idx + 1) % ${#TEMPS[@]} ))

hyprctl hyprsunset temperature "${TEMPS[$idx]}"
echo "$idx" > "$IDX_FILE"
notify-send "🌗 Hyprsunset" "Temperatura: ${TEMPS[$idx]}K"
