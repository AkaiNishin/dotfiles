#!/bin/bash
cd "$HOME/dotfiles/waybar/.config/waybar/widgetApp/"
source ~/Programming/venv/bin/activate
python main.py
deactivate
