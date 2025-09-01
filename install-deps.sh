#!/usr/bin/env bash
# Install dependencies for Waydroid + Weston

set -euo pipefail

PKGS=(
    curl
    ca-certificates
    lxc
    lxc-templates
    python3-lxc
    policykit-1
    weston
    xwayland
    waydroid
)

echo "[+] Updating package lists..."
sudo apt update

echo "[+] Installing required packages..."
sudo apt install -y "${PKGS[@]}"

echo "[✓] Dependencies installed."
