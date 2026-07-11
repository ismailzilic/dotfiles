#!/bin/bash

# -------------------------------------------------------
# Script for handling system power state
# -------------------------------------------------------

selected_option=$(printf "performance\nbalanced\nbalanced battery\npower saving\nvirtual host\n" | rofi -dmenu -p "option: ")

case "$selected_option" in

	"performance")
		exec tuned-adm profile throughput-performance
		;;

	"balanced")
		exec tuned-adm profile balanced
		;;

	"balanced battery")
		exec tuned-adm profile balanced-battery
		;;

	"power saving")
		exec tuned-adm profile powersave
		;;

	"virtual host")
		exec tuned-adm profile virtual-host
		;;

	"*")
		;;
esac
