#!/bin/zsh

# Listar las redes WiFi disponibles usando nmcli y obtener solo los SSID
SSID=$(nmcli -f SSID dev wifi list | grep -v "^SSID" | uniq | rofi -dmenu -p "Select a wifi network")

# Si se selecciona una red
if [ -n "$SSID" ]; then
    # Solicitar la contraseña usando rofi
    PASSWORD=$(echo "" | rofi -dmenu -p "Password: $SSID")
    
    # Conectarse a la red seleccionada
    nmcli device wifi connect "$SSID" password "$PASSWORD"
fi

