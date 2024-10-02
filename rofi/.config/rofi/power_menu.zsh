#!/bin/zsh

# Opciones para el menú de apagado/cerrar sesión
OPTIONS="Turn off\nLog out"

# Mostrar opciones usando Rofi o dmenu
SELECTION=$(echo -e $OPTIONS | rofi -dmenu -p "System actions")

# Ejecutar la acción seleccionada
case "$SELECTION" in
    "Turn off")
        systemctl poweroff
        ;;
    "Log out")
        pkill -KILL -u $USER
        ;;
    *)
        # Si se cancela o no se selecciona nada, no hacer nada
        ;;
esac

