#!/usr/bin/env bash

CONFIG="/tmp/eww_cava_config"

cat > "$CONFIG" <<EOF
[general]
bars = 12
framerate = 60

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

# Cava produce líneas como: "0;2;4;6;7;5;..."
# Este script las convierte a formato JSON para EWW

stdbuf -o0 cava -p "$CONFIG" | while read -r line; do
  bars=$(echo "$line" | tr ';' ' ')
  json="{\"bars\":[$(echo $bars | sed 's/ /,/g')]}"
  eww update cava_data="$json"
done
