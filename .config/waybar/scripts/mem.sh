#!/bin/bash

read total used free <<< "$(awk '/MemTotal/{t=$2} /MemAvailable/{a=$2} END{printf "%d %d %d", t, a, t-a}' /proc/meminfo)"
pct=$((used * 100 / total))

echo "Mem: $(awk "BEGIN { printf \"%.2f\", $used / 1048576 }") GiB"
