#!/bin/bash

NUM_PAQUETES=$(yay -Qu 2>/dev/null | wc -l)

if [ "$NUM_PAQUETES" -eq 0 ]; then
    TITULO="Sistema al día"
    MENSAJE="No hay paquetes por actualizar."
    ICONO="dialog-information"
else
    TITULO="Actualizaciones Pendientes"
    MENSAJE="Tienes $NUM_PAQUETES paquetes por actualizar. ¡Es hora de un 'up'!"
    ICONO="system-software-update"
fi

notify-send -t 5000 -a "Yay Updater" -i "$ICONO" "$TITULO" "$MENSAJE"
