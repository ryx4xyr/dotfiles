#!/bin/bash

PLAYER="spotify"
status=$(playerctl --player=$PLAYER status 2>/dev/null)

# Icono según estado (sin cambios)
if [ "$status" = "Playing" ]; then
    play_icon="<span foreground='#c89dfa'></span>"
elif [ "$status" = "Paused" ]; then
    play_icon="<span foreground='#c89dfa'></span>"
else
    play_icon="<span foreground='#c89dfa'></span>"
fi

icon="<span foreground='#eeff00'></span>"

# Obtener metadata (sin cambios)
artist=$(playerctl --player=$PLAYER metadata artist 2>/dev/null)
title=$(playerctl --player=$PLAYER metadata title 2>/dev/null)

# Si no hay contenido, mostrar solo ícono musical (sin cambios)
if [ -z "$artist" ] && [ -z "$title" ]; then
    echo '{"text": "", "tooltip": "No hay contenido reproducido"}'
    exit
fi

# Longitud máxima total
max_length=40

# Longitud máxima para cada campo (título y artista)
max_title_length=20
max_artist_length=15

# Truncar título
if [ ${#title} -gt $max_title_length ]; then
    title_display="${title:0:$max_title_length}..."
else
    title_display="$title"
fi

# Truncar artista
if [ ${#artist} -gt $max_artist_length ]; then
    artist_display="${artist:0:$max_artist_length}..."
else
    artist_display="$artist"
fi

# Construir el texto final
text_display="${title_display} - ${artist_display}"
text="${title} - ${artist}"

# Función para escapar caracteres (sin cambios)
escape() {
    echo "$1" | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g'
}

text_display_escaped=$(escape "$text_display")
tooltip_escaped=$(escape "$text")

# Imprimir JSON válido (sin cambios)
echo "{\"text\": \"$icon  $text_display_escaped\", \"tooltip\": \"$tooltip_escaped\"}"