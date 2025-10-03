#!/bin/bash

# Este script aplica el tema y tamaño de cursor proporcionados
# Argumentos: $1 = CURSOR_THEME, $2 = CURSOR_SIZE

CURSOR_THEME="$1"
CURSOR_SIZE="$2"

if [ -z "$CURSOR_THEME" ] || [ -z "$CURSOR_SIZE" ]; then
  echo "Uso: $0 <CURSOR_THEME> <CURSOR_SIZE>"
  exit 1
fi

# 1. Aplicar el cursor en vivo para Hyprland y Wayland nativo
hyprctl setcursor "$CURSOR_THEME" "$CURSOR_SIZE"

# 2. Configurar el cursor para aplicaciones GTK a través de gsettings
gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR_THEME"
gsettings set org.gnome.desktop.interface cursor-size "$CURSOR_SIZE"

# 3. ACTUALIZAR settings.ini para GTK3 y GTK4
GTK3_SETTINGS_FILE="$HOME/.config/gtk-3.0/settings.ini"
GTK4_SETTINGS_FILE="$HOME/.config/gtk-4.0/settings.ini"

mkdir -p "$HOME/.config/gtk-3.0"
mkdir -p "$HOME/.config/gtk-4.0"

# Función auxiliar para actualizar settings.ini
update_gtk_settings_ini() {
  local file="$1"
  local theme="$2"
  local size="$3"

  if ! grep -q "^\[Settings\]" "$file" 2>/dev/null; then
    echo -e "\n[Settings]" >> "$file"
  fi

  if grep -q "gtk-cursor-theme-name" "$file"; then
    sed -i "s/^gtk-cursor-theme-name=.*/gtk-cursor-theme-name=$theme/" "$file"
  else
    sed -i "/^\[Settings\]/a gtk-cursor-theme-name=$theme" "$file"
  fi

  if grep -q "gtk-cursor-theme-size" "$file"; then
    sed -i "s/^gtk-cursor-theme-size=.*/gtk-cursor-theme-size=$size/" "$file"
  else
    sed -i "/^\[Settings\]/a gtk-cursor-theme-size=$size" "$file"
  fi
}

update_gtk_settings_ini "$GTK3_SETTINGS_FILE" "$CURSOR_THEME" "$CURSOR_SIZE"
update_gtk_settings_ini "$GTK4_SETTINGS_FILE" "$CURSOR_THEME" "$CURSOR_SIZE"


# 4. Refrescar el cursor en XWayland apps (opcional, pero no hace daño)
xsetroot -cursor_name left_ptr

# 5. PARA PERSISTENCIA GLOBAL: Modificar hypr_cursor_persistent.conf
PERSISTENT_CURSOR_CONF="$HOME/.config/hypr/hypr_cursor_persistent.conf"

echo "# Configuración de cursor generada por theme-switcher.sh para persistencia global" > "$PERSISTENT_CURSOR_CONF"
echo "env = HYPRCURSOR_THEME,$CURSOR_THEME" >> "$PERSISTENT_CURSOR_CONF"
echo "env = HYPRCURSOR_SIZE,$CURSOR_SIZE" >> "$PERSISTENT_CURSOR_CONF"
echo "env = XCURSOR_THEME,$CURSOR_THEME" >> "$PERSISTENT_CURSOR_CONF"
echo "env = XCURSOR_SIZE,$CURSOR_SIZE" >> "$PERSISTENT_CURSOR_CONF"

# 6. Recargar Hyprland para que aplique las nuevas variables de entorno
hyprctl reload

# 7. Forzar una recarga del cursor en Rofi lanzando y cerrando una instancia
#    Esto debería hacer que la próxima vez que lo abras, lea la nueva config.
( rofi -dmenu -p "Recargando cursor de Rofi..." -e "Cerrando..." & ) && sleep 0.1 && pkill -f "rofi -dmenu -p Recargando cursor de Rofi..."
# La línea de arriba:
# - Lanza rofi en segundo plano (para que no bloquee el script)
# - Espera un momento (0.1 segundos) para que Rofi tenga tiempo de inicializarse
# - Mata la instancia de Rofi recién lanzada.
#   Usamos `pkill -f` con parte de la cadena de comando para ser específicos.
#   El `-e "Cerrando..."` es un mensaje de error que se muestra brevemente si Rofi falla,
#   pero aquí lo usamos para tener una cadena única para pkill.

echo "Cursor actualizado a: Tema=$CURSOR_THEME, Tamaño=$CURSOR_SIZE"
