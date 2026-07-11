#!/bin/sh

busy=$(cat /sys/class/drm/card*/device/gpu_busy_percent 2>/dev/null | head -1)

temp=$(cat /sys/class/drm/card*/device/hwmon/hwmon*/temp1_input 2>/dev/null | head -1)

[ -n "$temp" ] && temp=$((temp / 1000))

echo "GPU: ${busy:-?}% ${temp:-?}°C"
