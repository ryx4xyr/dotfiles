#!/bin/bash

bar_signal() {
  local signal=$1
  local bars=""
  local i

  for (( i=0; i<4; i++ )); do
    if (( signal > i*25 )); then
      bars+="█"
    else
      bars+="░"
    fi
  done

  echo "$bars"
}

# Obtener interfaces conectadas ignorando loopback y docker, etc
CONNS=$(nmcli -t -f DEVICE,TYPE,STATE device | grep ":connected" | grep -vE "lo|loopback|docker|virbr|veth")

if [[ -z "$CONNS" ]]; then
  echo "❌ Sin conexión activa"
else
  # Prioridad WiFi > Ethernet > otra
  # Buscar WiFi primero
  WIFI_IFACE=$(echo "$CONNS" | grep ":wifi" | cut -d: -f1)
  ETH_IFACE=$(echo "$CONNS" | grep ":ethernet" | cut -d: -f1)

  if [[ -n "$WIFI_IFACE" ]]; then
    SSID=$(nmcli -t -f ACTIVE,SSID dev wifi | grep "^yes" | cut -d: -f2)
    SIGNAL=$(nmcli -f IN-USE,SIGNAL dev wifi | grep '*' | awk '{print $2}')
    IP=$(nmcli -t -f IP4.ADDRESS dev show "$WIFI_IFACE" | grep -oP '\d+\.\d+\.\d+\.\d+')
    ICON=$(signal_icon $SIGNAL)
    echo "⚪ WiFi conectado: $SSID | Señal: $SIGNAL% $ICON | IP: $IP"
  elif [[ -n "$ETH_IFACE" ]]; then
    IP=$(nmcli -t -f IP4.ADDRESS dev show "$ETH_IFACE" | grep -oP '\d+\.\d+\.\d+\.\d+')
    echo "🔌 Ethernet conectado | IP: $IP"
  else
    # Si hay otras interfaces conectadas, las listamos
    OTHER_IFACE=$(echo "$CONNS" | head -n1 | cut -d: -f1,2)
    echo "🔗 Conexión activa: $OTHER_IFACE"
  fi
fi


