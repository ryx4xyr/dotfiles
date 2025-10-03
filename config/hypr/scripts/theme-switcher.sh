#!/bin/bash

THEME_DIR="$HOME/.config/hypr/themes"
CURRENT_FILE="$THEME_DIR/current_theme"

# Si fue lanzado con argumentos o desde Hyprland autostart (modo silencioso)
if [ "$1" = "--auto" ] && [ -f "$CURRENT_FILE" ]; then
  SELECTED_THEME=$(<"$CURRENT_FILE")
else
  # Modo interactivo con rofi
  cd "$THEME_DIR" || exit 1
  IFS=$'\n'
  SELECTED_THEME=$(
    for dir in */; do
      WALL=$(find "$dir" -type f \( -iname "wallpaper.jpg" -o -iname "wallpaper.png" -o -iname "wallpaper.jpeg" -o -iname "wallpaper.webp" \) | head -n 1)
      [ -n "$WALL" ] && echo -en "${dir%/}\0icon\x1f$THEME_DIR/$WALL\n"
    done | rofi -dmenu -i \
      -p "Selecciona tema" \
      -show-icons \
      -theme-str 'window { width: 40%; } listview { columns: 4; lines: 3; }'
  )
  [ -z "$SELECTED_THEME" ] && exit 0
  echo "$SELECTED_THEME" > "$CURRENT_FILE"
fi

THEME_PATH="$THEME_DIR/$SELECTED_THEME"
( sleep 1 && notify-send -i task-complete -u normal -t 4000 "Cambio de tema" "$SELECTED_THEME fue aplicado exitosamente." ) &

# Establecer fondo de pantalla
WALL=$(find "$THEME_PATH" -type f \( -iname "wallpaper.jpg" -o -iname "wallpaper.png" -o -iname "wallpaper.jpeg" -o -iname "wallpaper.webp" \) | head -n 1)
[ -n "$WALL" ] && swww img "$WALL" --transition-fps=60 --transition-step=10 --transition-duration=3 --transition-type=any #none simple outer inner wave grow wipe

# Aplicar configuración de Waybar
if [ -d "$THEME_PATH/waybar" ]; then
  cp "$THEME_PATH/waybar/config" ~/.config/waybar/config
  cp "$THEME_PATH/waybar/style.css" ~/.config/waybar/style.css
  pkill waybar && env GTK_THEME=Adwaita waybar & disown
fi

# Aplicar configuración visual de Hyprland
if [ -f "$THEME_PATH/hypr/general.conf" ]; then

  cp "$THEME_PATH/hypr/general.conf" ~/.config/hypr/modules/general.conf
fi

# Aplicar colores de Rofi si existen en el tema
if [ -f "$THEME_PATH/rofi/custom-1.rasi" ]; then
  cp "$THEME_PATH/rofi/custom-1.rasi" ~/.config/rofi/colors/custom-1.rasi
fi

# Aplicar configuración de Hyprlock
if [ -f "$THEME_PATH/hyprlock/hyprlock.conf" ]; then
  cp "$THEME_PATH/hyprlock/hyprlock.conf" ~/.config/hypr/hyprlock.conf
fi

# Copiar scripts de Hyprlock si existen
if [ -d "$THEME_PATH/hyprlock/scripts" ]; then
  mkdir -p ~/.config/scripts
  cp -r "$THEME_PATH/hyprlock/scripts/"* ~/.config/scripts/
fi

# Aplicar colores de Kitty
KITTY_WAL_SRC="$THEME_PATH/wal/colors-kitty.conf"
KITTY_WAL_DEST="$HOME/.config/hypr/themes/current/wal/colors-kitty.conf"

if [ -f "$KITTY_WAL_SRC" ]; then
  mkdir -p "$(dirname "$KITTY_WAL_DEST")"
  cp "$KITTY_WAL_SRC" "$KITTY_WAL_DEST"
  pkill -USR1 kitty 2>/dev/null || true
fi


# Aplicar tema de cursor (si existe cursor.conf)
if [ -f "$THEME_PATH/cursor/cursor.conf" ]; then
  source "$THEME_PATH/cursor/cursor.conf"
  # Llama al script externo para aplicar y persistir el cursor
  ~/.config/hypr/scripts/apply_cursor_theme.sh "$CURSOR_THEME" "$CURSOR_SIZE"
fi

# Aplicar estilo de EWW
if [ -f "$THEME_PATH/eww/eww.scss" ]; then
  echo "Cambiando estilo de EWW..."
  cp "$THEME_PATH/eww/eww.scss" ~/.config/eww/eww.scss
  eww reload
fi

# Aplicar estilo CSS de swayosd
if [ -f "$THEME_PATH/swayosd/swayosd.css" ]; then
  mkdir -p ~/.config/swayosd
  cp "$THEME_PATH/swayosd/swayosd.css" ~/.config/swayosd/style.css
  pkill swayosd-server 2>/dev/null || true
  (swayosd-server & disown)
fi

if [ -f "$THEME_PATH/gtk/settings.ini" ]; then

   # Copiar el archivo settings.ini completo
   mkdir -p ~/.config/gtk-3.0
   cp "$THEME_PATH/gtk/settings.ini" ~/.config/gtk-3.0/settings.ini

   # Copiar a gtk-4.0
   mkdir -p ~/.config/gtk-4.0
   cp ~/.config/gtk-3.0/settings.ini ~/.config/gtk-4.0/settings.ini

   # Extraer las variables del archivo copiado
   GTK_THEME=$(grep 'gtk-theme-name' ~/.config/gtk-3.0/settings.ini | cut -d'=' -f2)
   ICON_THEME=$(grep 'gtk-icon-theme-name' ~/.config/gtk-3.0/settings.ini | cut -d'=' -f2)
   PREFER_DARK=$(grep 'gtk-application-prefer-dark-theme' ~/.config/gtk-3.0/settings.ini | cut -d'=' -f2)

   # Limpiar las variables (eliminar comillas si las hay)
   GTK_THEME="${GTK_THEME//\"/}"
   ICON_THEME="${ICON_THEME//\"/}"

   # Aplicar el tema GTK con gsettings
   gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
   gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"

   # Aplicar la preferencia de modo oscuro/claro
   if [ "$PREFER_DARK" == "1" ]; then
       gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
   else
       gsettings set org.gnome.desktop.interface color-scheme 'default'
   fi
   # Crear .gtkrc-2.0 para aplicaciones legacy
   echo "gtk-theme-name=\"$GTK_THEME\"" > ~/.gtkrc-2.0
   echo "gtk-icon-theme-name=\"$ICON_THEME\"" >> ~/.gtkrc-2.0
fi
