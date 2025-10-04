#!/bin/bash

# set -x # Descomenta esta línea solo si necesitas depuración para este script

adjust_arg="$1" # El argumento (+5, -5, etc.)

# --- LÓGICA DE AJUSTE DE VOLUMEN CON DBUS (esta parte ya funciona bien) ---

# Obtener el volumen actual de Spotify
current_volume_dbus_output=$(gdbus call --session \
                            --dest org.mpris.MediaPlayer2.spotify \
                            --object-path /org/mpris/MediaPlayer2 \
                            --method org.freedesktop.DBus.Properties.Get \
                            "org.mpris.MediaPlayer2.Player" \
                            "Volume" 2>/dev/null)

if [ $? -ne 0 ] || [ -z "$current_volume_dbus_output" ]; then
    echo "Spotify no está activo o no responde vía DBus. No se puede ajustar el volumen."
    exit 1
fi

current_volume_double=$(echo "$current_volume_dbus_output" | sed -n 's/.*<\([0-9.]*\)>.*/\1/p')
current_volume_percent=$(awk "BEGIN {printf \"%.0f\", ($current_volume_double * 100)}")

new_volume_percent=$((current_volume_percent + adjust_arg))

if (( new_volume_percent > 100 )); then
  new_volume_percent=100
elif (( new_volume_percent < 0 )); then
  new_volume_percent=0
fi

new_volume_double=$(awk "BEGIN {print $new_volume_percent / 100}")

gdbus call --session \
    --dest org.mpris.MediaPlayer2.spotify \
    --object-path /org/mpris/MediaPlayer2 \
    --method org.freedesktop.DBus.Properties.Set \
    "org.mpris.MediaPlayer2.Player" \
    "Volume" \
    "<double $new_volume_double>" 2>/dev/null

# --- CONTROL DEL OSD DE EWW (para mostrar +5% o -5%) ---
# Determinar qué OSD abrir
if (( adjust_arg > 0 )); then
  eww_osd_window="spotify_volume_up_osd"
elif (( adjust_arg < 0 )); then
  eww_osd_window="spotify_volume_down_osd"
else
  # Si el ajuste es 0 (no debería pasar con tus keybinds)
  exit 0
fi

# Asegurarse de que el demonio de EWW esté corriendo (solo por si acaso)
eww daemon &

# Cerrar cualquier OSD de volumen que pudiera estar abierto para evitar solapamientos
eww close spotify_volume_up_osd 2>/dev/null
eww close spotify_volume_down_osd 2>/dev/null

# Abrir el OSD correcto
eww open "$eww_osd_window"

# Esperar un momento para que se muestre y luego cerrarlo
sleep 2 # Puedes ajustar este tiempo (en segundos)
eww close "$eww_osd_window"

exit 0
