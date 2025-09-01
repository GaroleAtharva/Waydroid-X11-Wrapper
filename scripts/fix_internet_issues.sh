#!/usr/bin/env bash
# Check and fix Waydroid network routing

set -euo pipefail

echo "[+] Checking Waydroid network status..."

# Get default route inside Waydroid
DEFAULT_ROUTE=$(sudo waydroid shell ip route | grep "^default" || true)

if [[ -z "$DEFAULT_ROUTE" ]]; then
    echo "[!] No default route found inside Waydroid. Adding..."
    sudo waydroid shell ip route add default via 192.168.250.1 dev eth0 || true
else
    echo "[✓] Default route present: $DEFAULT_ROUTE"
fi

# Check DNS
DNS_CONFIG=$(sudo waydroid shell getprop net.dns1 || true)
if [[ -z "$DNS_CONFIG" || "$DNS_CONFIG" == "0.0.0.0" ]]; then
    echo "[!] DNS not configured, setting Google DNS..."
    sudo waydroid shell settings put global dns1 8.8.8.8
    sudo waydroid shell settings put global dns2 8.8.4.4
else
    echo "[✓] DNS configured: $DNS_CONFIG"
fi

echo "[✓] Network check complete."
