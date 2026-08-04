#!/bin/bash

# -------------------------------------------------------
# Script for handling system and session state
# -------------------------------------------------------

selected_option=$(printf "shut down\nrestart\nsuspend\nlock\nlog out" | rofi -dmenu -p "option: " )

case "$selected_option" in

	"shut down")
		exec systemctl poweroff
		;;

	"restart")
		exec systemctl reboot
		;;

	"suspend")
		exec systemctl suspend
		;;

	"lock")
		exec loginctl lock-session
		;;

	"log out")
		exec hyprchutdown || hyprctl dispatch exit
		;;

	"*")
		;;
esac
