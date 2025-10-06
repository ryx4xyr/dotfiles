#!/usr/bin/env bash
# screenshot-region.sh ─ miniatura + sonido + popup (sin notificación de Hyprshot)

DIR="$HOME/Imágenes/Screenshots"
mkdir -p "$DIR"

FILENAME="$(date '+%Y-%m-%d_%H-%M-%S').png"
FILE="$DIR/$FILENAME"

# 1) Seleccionar región con el ratón.
# 2) Guardar y copiar al portapapeles.
# 3) -s ⇒ sin libnotify; -o/-f ⇒ ruta y nombre exactos.
hyprshot -s -m region \
         -o "$DIR" \
         -f "$FILENAME"

# Sonido *después* de terminar la captura
canberra-gtk-play -i camera-shutter -d "camera" --volume 0.1 &

# Miniatura con Eww
eww update screenshot-path="$FILE"
eww open screenshot-popup
sleep 5
eww close screenshot-popup
