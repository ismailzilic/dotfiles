#!/bin/sh

ip=$(ip -4 addr show scope global 2>/dev/null | awk '/inet / {print $2}' | head -1 | cut -d/ -f1)

echo "Leaked IP: ${ip:-No IP}"
