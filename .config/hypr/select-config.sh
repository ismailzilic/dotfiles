#!/bin/bash

DESKTOP_CONF="$HOME/dotfiles/.config/hypr/hyprland-desktop.conf"
LAPTOP_CONF="$HOME/dotfiles/.config/hypr/hyprland-laptop.conf"
HYPR_CONF="$HOME/dotfiles/.config/hypr/hyprland.conf"

if [ -d "/sys/class/power_supply/BAT0" ]; then
    ln -sf "$LAPTOP_CONF" "$HYPR_CONF"
else
    ln -sf "$DESKTOP_CONF" "$HYPR_CONF"
fi
