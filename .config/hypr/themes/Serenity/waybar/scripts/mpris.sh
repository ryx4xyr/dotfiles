#!/bin/bash

PLAYER="spotify"
status=$(playerctl --player=$PLAYER status 2>/dev/null)

# Icono según estado
if [ "$status" = "Playing" ]; then
    play_icon="<span foreground='#c89dfa'></span>"
elif [ "$status" = "Paused" ]; then
    play_icon="<span foreground='#c89dfa'></span>"
else
    play_icon="<span foreground='#c89dfa'></span>"
fi

#icon="<span foreground='#c89dfa'>󰎆</span>"
icon="<span foreground='#f8a5ff'></span>"

# Obtener metadata
artist=$(playerctl --player=$PLAYER metadata artist 2>/dev/null)
title=$(playerctl --player=$PLAYER metadata title 2>/dev/null)

# Si no hay contenido, mostrar solo ícono musical
if [ -z "$artist" ] && [ -z "$title" ]; then
    echo '{"text": "", "tooltip": "No hay contenido reproducido"}'
    exit
fi

# Construir texto (primero título, luego artista)
text="${title} - ${artist}"

# Truncar sin escapar
max_length=40
if [ ${#text} -gt $max_length ]; then
    text_display="${text:0:$max_length}..."
else
    text_display="$text"
fi

# Escapar texto (después de truncar)
escape() {
    echo "$1" | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g'
}

text_display_escaped=$(escape "$text_display")
tooltip_escaped=$(escape "$text")

# Imprimir JSON válido
echo "{\"text\": \"$icon  $text_display_escaped\", \"tooltip\": \"$tooltip_escaped\"}"

#$play_icon
