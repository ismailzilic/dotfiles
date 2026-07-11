#!/bin/bash

# -------------------------------------------------------
# Script for handling system and session state
# -------------------------------------------------------

selected_option=$(printf "suspend\nshut down\nrestart\nlog out" | rofi -dmenu -p "option: " )

case "$selected_option" in

	"suspend")
		exec systemctl suspend
		;;

	"shut down")
		exec systemctl poweroff
		;;

	"restart")
		exec systemctl reboot
		;;

	"log out")
		exec hyprctl dispatch exit
		;;

	"*")
		;;
esac
