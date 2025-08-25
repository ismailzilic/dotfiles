#!/bin/bash

DESKTOP_CONF="$HOME/dotfiles/.config/hypr/hyprland-desktop.conf"
LAPTOP_CONF="$HOME/dotfiles/.config/hypr/hyprland-laptop.conf"
HYPR_CONF="$HOME/.config/hypr/hyprland.conf"

if ls /sys/class/power_supply/ | grep -q "BAT"; then
    ln -sf "$LAPTOP_CONF" "$HYPR_CONF"
else
    ln -sf "$DESKTOP_CONF" "$HYPR_CONF"
fi
