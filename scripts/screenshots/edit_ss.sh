#!/usr/bin/env bash
# screenshot-ksnip.sh — captura región + edición con Ksnip + popup/sonido
set -euo pipefail

DIR="$HOME/Imágenes/Screenshots"
mkdir -p "$DIR"

FILE="$DIR/$(date '+%Y-%m-%d_%H-%M-%S').png"

# 1 ▸ Captura región
if ! grim -g "$(slurp)" "$FILE"; then
    notify-send "Ksnip" "Captura cancelada"
    exit 1
fi

# 2 ▸ Editar con Ksnip (-e = abrir en el editor)
ksnip -e "$FILE" &
ksnip_pid=$!
wait "$ksnip_pid"   # el script queda en pausa hasta que cierres Ksnip

# 3 ▸ ¿se guardó algo?
[[ -s "$FILE" ]] || {
    notify-send "Ksnip" "No se guardó la imagen"
    rm -f "$FILE"
    exit 1
}

# 4 ▸ Sonido + popup eww
canberra-gtk-play -i camera-shutter -d camera --volume 0.1 &
eww update screenshot-path="$FILE"
eww open  screenshot-popup
sleep 5
eww close screenshot-popup
