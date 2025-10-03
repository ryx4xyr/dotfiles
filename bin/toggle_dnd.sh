#!/bin/bash

# Notificación previa
notify-send -t 2500 "SwayNC - Estado actualizado" "🔕 No Molestar activado"

# Espera 1 segundo
sleep 2

# Alternar Do Not Disturb
swaync-client -d

# Mostrar estado actualizado
if [ "$(swaync-client -D)" = "true" ]; then
    notify-send "SwayNC - Estado actualizado" "🔕 No Molestar activado"
else
    notify-send "SwayNC - Estado actualizado" "🔔 Notificaciones habilitadas"
fi

