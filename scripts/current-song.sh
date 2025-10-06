#!/bin/bash

# Ícono (puedes cambiarlo por otro de Nerd Font o emoji)
ICON=""

# Definir el único player válido
PLAYER="spotify"

# Verificar si Spotify está activo y reproduciendo
STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)

if [ "$STATUS" != "Playing" ] && [ "$STATUS" != "Paused" ]; then
    echo ""
    exit
fi

# Obtener título y artista desde Spotify
TITLE=$(playerctl --player=$PLAYER metadata title 2>/dev/null)
ARTIST=$(playerctl --player=$PLAYER metadata artist 2>/dev/null)

# Si no hay información, salir
if [ -z "$TITLE" ]; then
    echo ""
    exit
fi

# Limitar título y artista por separado
MAX_TITLE=12
MAX_ARTIST=15

if [ ${#TITLE} -gt $MAX_TITLE ]; then
    TITLE="${TITLE:0:$MAX_TITLE}…"
fi

if [ ${#ARTIST} -gt $MAX_ARTIST ]; then
    ARTIST="${ARTIST:0:$MAX_ARTIST}…"
fi

# Resultado final (orden: Título      Artista)
echo "$TITLE  $ICON   $ARTIST"
