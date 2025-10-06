#!/usr/bin/env bash
# Ruta de destino
DIR="$HOME/Imágenes/Screenshots"
mkdir -p "$DIR"

# Nombre ★sin★ sufijo “hyprshot”
FILENAME="$(date '+%Y-%m-%d_%H-%M-%S').png"
FILE="$DIR/$FILENAME"

# Captura al monitor principal con Hyprshot
# ‑m output           → modo monitor
# ‑m HDMI-A-1         → nombre del monitor
# -o / --output‑folder→ carpeta
# -f / --filename     → nombre (con extensión)
hyprshot -s -m output -m HDMI-A-1 \
         -o "$DIR" \
         -f "$FILENAME"

# Sonido y popup (igual que antes)
canberra-gtk-play -i camera-shutter -d "camera" --volume 0.1 &

eww update screenshot-path="$FILE"
eww open screenshot-popup
sleep 5
eww close screenshot-popup
