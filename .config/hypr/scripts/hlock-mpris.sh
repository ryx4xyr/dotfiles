#!/bin/env bash

THUMB=/tmp/hyde-mpris
THUMB_BLURRED=/tmp/hyde-mpris-blurred
THUMB_RECTANGLE=/tmp/blurred_rectangle.png

# --- Función para obtener el nombre del reproductor ---
# Intenta obtener el reproductor de YouTube Music (que es probable que sea 'firefox').
# Si no está disponible, intenta obtener el primer reproductor disponible.
get_player() {
    # playerctl -l devuelve la lista de nombres de reproductores disponibles
    if playerctl -l | grep -q 'firefox'; then
        echo 'firefox'
    elif playerctl -l | head -n 1; then
        playerctl -l | head -n 1 # Usa el primer reproductor si firefox no está
    else
        return 1 # No hay reproductor disponible
    fi
}

fetch_thumb() {
    PLAYER=$(get_player)
    if [ $? -ne 0 ]; then
        return 1 # No hay reproductor
    fi

    # Usa el nombre del reproductor obtenido
    artUrl=$(playerctl -p "$PLAYER" metadata --format '{{mpris:artUrl}}') 
    
    # Verifica si la URL de la carátula ha cambiado para evitar recargar innecesariamente
    [[ "${artUrl}" = "$(cat "${THUMB}.inf" 2>/dev/null)" ]] && return 0

    printf "%s\n" "$artUrl" > "${THUMB}.inf"

    # La URL de YouTube Music puede ser "https://..." o "file:///..."
    if [[ "$artUrl" == http* ]]; then
        curl -so "${THUMB}.png" "$artUrl"
    # Si la URL no es una ruta web válida, asume que falló o no está disponible
    else
        rm -f "${THUMB}*" # Elimina archivos antiguos si no hay carátula
        return 1
    fi
    
    # Crea versiones de la imagen (manteniendo la lógica de Imagick)
    magick "${THUMB}.png" -quality 50 "${THUMB}.png"
    
    # Crea la versión borrosa
    magick "${THUMB}.png" -blur 200x7 -resize 1920x^ -gravity center -extent 1920x1080\! "${THUMB_BLURRED}.png"
    
    # Crea el rectángulo borroso (si es necesario)
    magick -size 800x200 xc:none -fill black -draw "rectangle 0,0 800,200" -blur 0x3 "${THUMB_RECTANGLE}"

    # Notifica a hyprlock para que recargue la configuración
    pkill -USR2 hyprlock
}

# --- Ejecución del script ---

PLAYER=$(get_player)

# Verifica si hay un reproductor de medios, si no, elimina los archivos y sale.
if [ $? -ne 0 ]; then
    rm -f "${THUMB}*"
    exit 1
fi

# El script principal ahora usa el nombre del reproductor variable
# Ejecuta la obtención de metadatos y la miniatura en segundo plano.
# Si la obtención de metadatos falla por alguna razón, borra los archivos y sale.
{ playerctl -p "$PLAYER" metadata --format '{{title}}     {{artist}}' && fetch_thumb ;} || { rm -f "${THUMB}*" && exit 1;} &
