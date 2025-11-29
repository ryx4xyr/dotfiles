#!/bin/bash
# Script simplificado y corregido para Hyprlock (Solo Youtube Music/Firefox)

# Nota: Asume que el reproductor (Firefox/Youtube Music) es el único o el principal.
# Si hay más de uno, este script usará el primer reproductor activo que encuentre.
PLAYER=$(playerctl -l 2>/dev/null | head -n 1)

if [ -z "$PLAYER" ]; then
    # Si no hay un reproductor activo, devuelve cadenas vacías o por defecto
    case "$1" in
        --title)   echo "No hay título" ;;
        --artist)  echo "No hay artista" ;;
        --length)  echo "00:00" ;;
        --status)  echo "󰎆" ;; # Campo de tiempo actual (posición)
        --source)  echo "" ;;
        *)         echo "" ;;
    esac
    exit 0
fi

# Función para convertir microsegundos (us) a formato MM:SS
format_time() {
    length_us=$1
    if [ -n "$length_us" ] && [ "$length_us" -ge 0 ] 2>/dev/null; then
        length_s=$((length_us / 1000000))
        minutes=$((length_s / 60))
        seconds=$((length_s % 60))
        printf "%02d:%02d" "$minutes" "$seconds"
    else
        echo "󰎆"
    fi
}

# Ejecución del comando
case "$1" in
    --title)
	TITLE=$(playerctl --player="$PLAYER" metadata title 2>/dev/null)
        MAX_LEN=20

        if [ ${#TITLE} -gt $MAX_LEN ]; then
            # Trunca la cadena y añade "..."
            echo "${TITLE:0:$MAX_LEN}..."
        else
            # Muestra el título completo si es <= 20 caracteres
            echo "$TITLE"
        fi
	;;

    --artist)
        # Artista de la canción, truncado a 25 caracteres con "..."
        ARTIST=$(playerctl --player="$PLAYER" metadata artist 2>/dev/null)
	MAX_LEN=25

	# ¡Corrección de sintaxis aquí! (Asegurando el espacio después de '[' y antes de ']')
	if [ ${#ARTIST} -gt $MAX_LEN ]; then
	    echo "${ARTIST:0:$MAX_LEN}..."
	else
	    echo "$ARTIST"
	fi
        ;;
    --length)
        # Longitud total de la pista (Para 'PLAYER LENGTH')
        TOTAL_LENGTH=$(playerctl --player="$PLAYER" metadata mpris:length 2>/dev/null)
        format_time "$TOTAL_LENGTH"
        ;;

    --status)
        # Posición actual de la pista (Para 'PLAYER STATUS', que ahora es el tiempo actual)
        CURRENT_POSITION=$(playerctl --player="$PLAYER" position 2>/dev/null)
        format_time "$CURRENT_POSITION"
        ;;

    --source)
        # Siempre devuelve "Youtube Music"
        echo "Youtube Music 󰎆"
        ;;

    *)
        echo ""
        ;;
esac
