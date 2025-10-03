#!/bin/bash
echo "$(date): Script ejecutado" >> /tmp/wlogout-debug.log
echo "$(date): Ejecutando hyprlock" >> /tmp/wlogout-debug.log
pkill wlogout
hyprlock -c /home/kry_/.config/hyprlock/config &
