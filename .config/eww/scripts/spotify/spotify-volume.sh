#!/bin/bash
# Ya no necesitamos set -x aquí, los logs van a /tmp/spotify.log

LOG_FILE="/tmp/spotify_defpoll_debug.log" # <--- Nuevo archivo de log para depuración

# --- INICIO DE DEPURACIÓN PARA DEPOLL ---
echo "$(date): spotify-volume.sh ejecutado por defpoll (o manualmente)." >> "$LOG_FILE"
echo "$(date): PATH dentro del script: $PATH" >> "$LOG_FILE"
echo "---" >> "$LOG_FILE"
# --- FIN DE DEPURACIÓN ---

# Primero, intenta obtener el volumen de Spotify usando DBus
volume_dbus_output=$(gdbus call --session \
                            --dest org.mpris.MediaPlayer2.spotify \
                            --object-path /org/mpris/MediaPlayer2 \
                            --method org.freedesktop.DBus.Properties.Get \
                            "org.mpris.MediaPlayer2.Player" \
                            "Volume" 2>/dev/null)

# Si el comando gdbus falló (ej. Spotify no está ejecutándose o no responde por DBus)
if [ $? -ne 0 ] || [ -z "$volume_dbus_output" ]; then
    echo "$(date): Spotify no está activo o no responde vía DBus en spotify-volume.sh" >> "$LOG_FILE"
    echo "--" # Valor para EWW cuando Spotify no está activo
    eww update SPOTIFY_VOL="--"
    if eww list-windows | grep -q "\*spotify_volume_osd"; then
        eww close spotify_volume_osd
        echo "$(date): spotify_volume_osd cerrado porque Spotify no está activo." >> "$LOG_FILE"
    fi
    exit 1
fi

# Ajuste de sed para que coincida con la salida real
volume_double=$(echo "$volume_dbus_output" | sed -n 's/.*<\([0-9.]*\)>.*/\1/p')

# Usar awk para el redondeo y formateo a entero
volume=$(awk "BEGIN {printf \"%.0f\", ($volume_double * 100)}")

if [ -z "$volume" ]; then
    volume="0"
    echo "$(date): WARNING: Falló la extracción del volumen DBus, se estableció en 0." >> "$LOG_FILE"
fi

echo "$(date): Volumen recuperado en spotify-volume.sh (DBus): ${volume}" >> "$LOG_FILE"

eww update SPOTIFY_VOL=$volume
echo "$(date): eww update SPOTIFY_VOL=${volume} ejecutado." >> "$LOG_FILE"

if ! eww list-windows | grep -q "\*spotify_volume_osd"; then
  echo "$(date): Abriendo spotify_volume_osd." >> "$LOG_FILE"
  eww open spotify_volume_osd
else
  echo "$(date): spotify_volume_osd ya está abierto." >> "$LOG_FILE"
fi

sleep 5
eww close spotify_volume_osd
echo "$(date): spotify_volume_osd cerrado." >> "$LOG_FILE"

# Esta línea es para que defpoll capture el valor
echo "$volume"