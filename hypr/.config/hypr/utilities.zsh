#!/bin/bash

STREAMERS=("banished_pheasant" "MaruFideos" "foodichafa" "Meica05" "TheKasaneru", "TipitoEnojado")
SELECTED=$(printf "%s\n" "${STREAMERS[@]}" | rofi -dmenu -p "Select twitch streamer: ")

[ -z "$SELECTED" ] && exit

mpv --title="Twitch: $SELECTED" "https://www.twitch.tv/$SELECTED" &

sleep 2
hyprctl dispatch focuswindow "Twitch: $SELECTED"
hyprctl dispatch pin active
