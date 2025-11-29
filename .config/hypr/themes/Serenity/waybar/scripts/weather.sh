#!/usr/bin/env bash
# ~/.config/waybar/scripts/weather.sh
#
# Requisitos:
#   - curl
#   - jq
#   - Fuente con emojis / Nerd Font (para que se vean los iconos)
#
# Uso:
#   Sin argumentos →  geolocaliza por IP (puede fallar con VPN/ISP)
#   Con argumento  →  ciudad, país o "lat,lon", p. ej. "weather.sh Madrid"
#   Salida JSON    →  {"text":"☀️ 29°C","tooltip":"Soleado (113)"}

set -euo pipefail

LOCATION="${1:-}"  # ciudad/coordenadas o IP por defecto
URL="https://wttr.in/${LOCATION}?format=j1"

# Intenta descargar, si falla, mostrar algo neutro
weather_json=$(curl -s --connect-timeout 3 "$URL") || {
  echo '{"text":"🌐 --°C","tooltip":"No se pudo obtener el clima"}'
  exit 0
}

# --- 1) Extrae código y temperatura ---
code=$(jq -r '.current_condition[0].weatherCode' <<<"$weather_json") || code="0"
temp_c=$(jq -r '.current_condition[0].temp_C' <<<"$weather_json")    || temp_c="--"

# --- 2) Mapeo código → icono ---
declare -A WEATHER_CODES=(
  [113]='☀️'  [116]='⛅️' [119]='☁️'  [122]='☁️'  [143]='🌫'
  [176]='🌦' [179]='🌧' [182]='🌧' [185]='🌧' [200]='⛈'
  [227]='🌨' [230]='❄️' [248]='🌫' [260]='🌫' [263]='🌦'
  [266]='🌦' [281]='🌧' [284]='🌧' [293]='🌦' [296]='🌦'
  [299]='🌧' [302]='🌧' [305]='🌧' [308]='🌧' [311]='🌧'
  [314]='🌧' [317]='🌧' [320]='🌨' [323]='🌨' [326]='🌨'
  [329]='❄️' [332]='❄️' [335]='❄️' [338]='❄️' [350]='🌧'
  [353]='🌦' [356]='🌧' [359]='🌧' [362]='🌧' [365]='🌧'
  [368]='🌨' [371]='❄️' [374]='🌧' [377]='🌧' [386]='⛈'
  [389]='🌩' [392]='⛈' [395]='❄️'
)

icon="${WEATHER_CODES[$code]:-☁️}"

# --- 3) Salida JSON para Waybar ---
printf '{"text":"%s %s°C","tooltip":"%s (%s)"}\n' "$icon" "$temp_c" "$icon" "$code"
