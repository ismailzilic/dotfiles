#!/bin/sh

usage=$(top -bn1 | awk '/^%Cpu/ {printf "%.0f", 100 - $8}' || echo "?")

temp=$(for d in /sys/class/hwmon/hwmon*/name; do
  [ "$(cat "$d" 2>/dev/null)" = "k10temp" ] && cat "${d%/name}/temp1_input"
done | head -1)

[ -n "$temp" ] && temp="$((temp / 1000))°C" || temp="?°C"

echo "CPU: ${usage}% ${temp}"
