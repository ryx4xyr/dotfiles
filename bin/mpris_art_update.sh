#!/bin/bash
TARGET_FILE="/tmp/hyde-mpris.png"

# Función para limpiar y salir
cleanup() {
    rm -f "$TARGET_FILE"
    exit 0
}
trap cleanup SIGINT SIGTERM

# Bucle principal que escucha eventos MPRIS
playerctl --follow metadata --format '{{ mpris:artUrl }}' | while read -r ART_URL; do
    if [[ "$ART_URL" =~ ^file:// ]]; then
        # Manejar rutas locales
        ART_PATH="${ART_URL/file:\/\//}"
        cp "$ART_PATH" "$TARGET_FILE"
    elif [[ "$ART_URL" =~ ^http ]]; then
        # Manejar URLs web (común con navegadores)
        wget -q -O "$TARGET_FILE" "$ART_URL"
    else
        # Si no hay URL o es un valor vacío, limpiar la imagen anterior
        rm -f "$TARGET_FILE"
        continue
    fi

    # 🔧 FIX: eliminar transparencia y evitar borde blanco en Hyprlock
    if [[ -f "$TARGET_FILE" ]]; then
        magick "$TARGET_FILE" -background "#1e1e1e" -alpha remove -alpha off "$TARGET_FILE"
    fi
done &
